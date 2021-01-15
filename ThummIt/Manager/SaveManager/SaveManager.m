//
//  SaveManager.m
//  Thummit
//
//  Created by 이성준 on 2020/12/20.
//

#import "SaveManager.h"
#import "UndoManager.h"

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
    for (Template *template in TemplateManager.sharedInstance.templates) {
        if ([self.currentProject.selectedTemplateName isEqualToString:template.templateName]) {
            currentTemplate = template;
        }
    }
    
    return currentTemplate;
    
}

-(void)addItem:(Item *)item{
    if ([item isKindOfClass:PhotoFrame.class]) {
        [self.currentProject.photoFrames addObject:(PhotoFrame *)item];
    } else if ([item isKindOfClass:Text.class]){
        [self.currentProject.texts addObject:(Text *)item];
    } else if ([item isKindOfClass:Sticker.class]){
        [self.currentProject.stickers addObject:(Sticker *)item];
    }
}

-(void)deleteItem:(Item *)item{
    if ([item isKindOfClass:PhotoFrame.class]) {
        [self.currentProject.photoFrames removeObject:(PhotoFrame *)item];
    } else if ([item isKindOfClass:Text.class]){
        [self.currentProject.texts removeObject:(Text *)item];
    } else if ([item isKindOfClass:Sticker.class]){
        [self.currentProject.stickers removeObject:(Sticker *)item];
    }
}

-(void)save{
    
    dispatch_sync(self.savingQueue, ^{
        [self.currentProject save];
//        [UndoManager.sharedInstance addCurrentProjectToUndoRedoStack];
    });
    
}


@end
