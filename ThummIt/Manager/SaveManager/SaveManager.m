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
        if (copied.isFixedPhotoFrame) {
            copied.baseView.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1.0];
            [view insertSubview:copied.baseView belowSubview:mainFrameImageView];
        } else {
            [view insertSubview:copied.baseView atIndex:copied.indexInLayer.integerValue];
        }
    }
    
    // to image and save
    UIImage *viewImage = [view toImage];
    self.currentProject.previewImage = [viewImage crop:self.bgViewRect];
}

@end
