//
//  SaveManager.m
//  Thummit
//
//  Created by 이성준 on 2020/12/20.
//

#import "SaveManager.h"
#import "UndoManager.h"
#import "UIImage+Additions.h"

@implementation SaveManager

+ (SaveManager *)sharedInstance {
    static SaveManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SaveManager alloc] init];
        sharedInstance.savingQueue = dispatch_queue_create("saving queue", DISPATCH_QUEUE_SERIAL);
    });
    
    return sharedInstance;
}

-(Template*)currentTemplate{
    
    Template *currentTemplate;
    for (NSArray *templates in TemplateManager.sharedInstance.templateDatas) {
        for (Template *template in templates) {
            if ([self.currentProject.selectedTemplateName isEqualToString:template.templateName]) {
                currentTemplate = template;
            }
        }
    }
    
    return currentTemplate;
    
}

-(void)addItem:(Item *)item{
    if ([item isKindOfClass:Photo.class]) {
        [self.currentProject.photos addObject:(Photo *)item];
    } else if ([item isKindOfClass:PhotoFrame.class]) {
        [self.currentProject.photoFrames addObject:(PhotoFrame *)item];
    } else if ([item isKindOfClass:Text.class]){
        [self.currentProject.texts addObject:(Text *)item];
    } else if ([item isKindOfClass:Sticker.class]){
        [self.currentProject.stickers addObject:(Sticker *)item];
    }
}

-(void)deleteItem:(Item *)item{
    if ([item isKindOfClass:Photo.class]) {
        [self.currentProject.photos removeObject:(Photo *)item];
    } else if ([item isKindOfClass:PhotoFrame.class]) {
        [self.currentProject.photoFrames removeObject:(PhotoFrame *)item];
    } else if ([item isKindOfClass:Text.class]){
        [self.currentProject.texts removeObject:(Text *)item];
    } else if ([item isKindOfClass:Sticker.class]){
        [self.currentProject.stickers removeObject:(Sticker *)item];
    }
}

-(void)saveAndAddToStack{
    
    dispatch_sync(self.savingQueue, ^{
        [self.currentProject save];
        [UndoManager.sharedInstance addCurrentProjectToUndoRedoStack];
        [self savePreviewImage];
    });

}

-(void)save{
    
    dispatch_sync(self.savingQueue, ^{
        [self.currentProject save];
        [self savePreviewImage];
    });

    
}

-(void)applyCurrentProject:(Project *)project{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd-hh-mm-ss"];
    NSString *stringDate = [dateFormatter stringFromDate:[NSDate date]];
    project.lastEditedDate = stringDate;

    self.currentProject = project;
    [self.currentProject save];
    
}

-(void)savePreviewImage{
    
    UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
    
    // view
    UIView *view = [[UIView alloc] initWithFrame:window.bounds];
    view.frameY = 0;
    view.backgroundColor = self.currentProject.backgroundColor;
    
    // frameImageView
    UIImageView *mainFrameImageView = [[UIImageView alloc] initWithFrame:self.bgViewRect];
    mainFrameImageView.contentMode = UIViewContentModeScaleAspectFit;
    if (self.currentProject.mainFrameImageName) {
        mainFrameImageView.image = [UIImage imageNamed:self.currentProject.mainFrameImageName];
        [view addSubview:mainFrameImageView];
    }
    
    // add Items
    for (Item *item in self.currentProject.items) {
        Item *copied = [item copy];
        
        [copied loadView];
        [copied setItemCenterAndScale];
        if (copied.isBasePhotoFrame) {
            copied.baseView.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1.0];
            [view insertSubview:copied.baseView belowSubview:mainFrameImageView];
        }
    }
    
    

    for (Item *item in self.sortedItems) {
        Item *copied = [item copy];
        
        if ([copied isKindOfClass:PhotoFrame.class]) {
            PhotoFrame *photoFrame = (PhotoFrame *)item;
            PhotoFrame *copiedPhotoFrame = (PhotoFrame *)copied;
            [copiedPhotoFrame makeBaseView];
            copiedPhotoFrame.photoImageView = [[UIImageView alloc] initWithFrame:photoFrame.photoImageView.frame];
            copiedPhotoFrame.photoImageView.image = photoFrame.photoImageView.image;
            [copiedPhotoFrame.baseView addSubview:copiedPhotoFrame.photoImageView];
            [copiedPhotoFrame addBGImageView];
            [copiedPhotoFrame setItemCenterAndScale];
            
        } else {
            [copied loadView];
            [copied setItemCenterAndScale];
        }
        [view addSubview:copied.baseView];
        
    }
    
    // to image and save
        UIImage *viewImage = [view toImage];
        self.currentProject.previewImage = [viewImage crop:self.bgViewRect];
}

-(NSMutableArray *)items{
    return SaveManager.sharedInstance.currentProject.items;
}

-(NSMutableArray *)texts{
    return SaveManager.sharedInstance.currentProject.texts;
}
-(NSMutableArray *)stickers{
    return SaveManager.sharedInstance.currentProject.stickers;
}
-(NSMutableArray *)photoFrames{
    return SaveManager.sharedInstance.currentProject.photoFrames;
}
-(NSMutableArray *)photos{
    return SaveManager.sharedInstance.currentProject.photos;
}

-(NSMutableArray *)sortedItems{
    
    NSArray *sorted = [SaveManager.sharedInstance.currentProject.items sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSString *first = [(Item*)a indexInLayer];
        NSString *second = [(Item*)b indexInLayer];
        return [@(first.integerValue) compare:@(second.integerValue)];
    }];
    NSMutableArray *sortedItems = [sorted mutableCopy];

    NSMutableArray *removableItems = [NSMutableArray array];
    for (Item *item in sortedItems) {
        if (item.isBasePhotoFrame) {
            [removableItems addObject:item];
        }
    }
    if (removableItems.count>0) {
        [sortedItems removeObjectsInArray:removableItems];
    }
        
    return sortedItems;
}

@end
