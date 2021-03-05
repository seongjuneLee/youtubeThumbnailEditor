//
//  UndoManager.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/13.
//

#import "UndoManager.h"
#import "SaveManager.h"

@implementation UndoManager

+ (UndoManager *)sharedInstance {
    static UndoManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UndoManager alloc] init];
        sharedInstance.undoRedoStacks = [NSMutableArray array];
        sharedInstance.maximumCount = 20;
        
        sharedInstance.undoRedoStacksForEditingPhoto = [NSMutableArray array];
        sharedInstance.maximumCountForEditingPhoto = 20;
    });
    
    return sharedInstance;
}

-(void)initUndoRedo{
    
    self.undoRedoStacks = [NSMutableArray array];
    self.currentIndex = 0;
}

-(void)addCurrentProjectToUndoRedoStack{
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:SaveManager.sharedInstance.currentProject];

    [self removeForwads];
    [self.undoRedoStacks addObject:data];
    if (self.undoRedoStacks.count > self.maximumCount) {
        [self.undoRedoStacks removeObjectAtIndex:0];
    }
    self.currentIndex = self.undoRedoStacks.count - 1;
    [self sendPushnotiForUndoRedo];
    
}

-(void)sendPushnotiForUndoRedo{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isUndoRedoAvailable" object:nil];
    
}

-(void)undo{
    
    if (self.undoRedoStacks.count == 0) {
        return;
    }
    if (self.currentIndex - 1 > 0) {
        self.currentIndex -= 1;
    } else {
        return;
    }

    NSData *data = self.undoRedoStacks[self.currentIndex];
    Project *project = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    project.coreDataStorage = SaveManager.sharedInstance.currentProject.coreDataStorage;
    [SaveManager.sharedInstance applyCurrentProject:project];
    [SaveManager.sharedInstance.currentProject save];
    [self sendPushnotiForUndoRedo];
//    for(ItemLayer *itemLayer in SaveManager.sharedInstance.currentProject.itemLayers){
//        if([itemLayer.item isKindOfClass:PhotoFrame.class]){
//            itemLayer.item.
//
//        }
//    }
    
}

-(void)redo{
    
    if (self.undoRedoStacks.count == 0) {
        return;
    }
    if (self.undoRedoStacks.count > self.currentIndex + 1) {
        self.currentIndex += 1;
    } else {
        return;
    }
    
    NSData *data = self.undoRedoStacks[self.currentIndex];
    Project *project = [NSKeyedUnarchiver unarchiveObjectWithData:data];

    project.coreDataStorage = SaveManager.sharedInstance.currentProject.coreDataStorage;
    [SaveManager.sharedInstance applyCurrentProject:project];
    [SaveManager.sharedInstance.currentProject save];
    [self sendPushnotiForUndoRedo];
    
}

-(void)removeForwads{
    
    NSMutableArray *objectsToRemove = [NSMutableArray new];
    for (int i = 0; i < self.undoRedoStacks.count; i++ ) {
        if (self.currentIndex < i) {
            [objectsToRemove addObject:self.undoRedoStacks[i]];
        }
    }
    
    [self.undoRedoStacks removeObjectsInArray:objectsToRemove];
    
}

-(BOOL)isUndoRemains{
    if (self.currentIndex - 1 > 0) {
        return true;
    } else {
        return false;
    }
}

-(BOOL)isRedoRemains{
    if (self.undoRedoStacks.count > self.currentIndex + 1) {
        return true;
    }
    return false;
}




#pragma mark - editingPhoto Undo Redo

-(void)initUndoRedoForEditingPhoto{
    
    self.undoRedoStacksForEditingPhoto = [NSMutableArray array];
    self.currentIndexForEditingPhoto = 0;
}

-(void)addCurrentPhotoToStack:(UIImage *)image{
    
    NSData *imageData = UIImagePNGRepresentation(image);
    [self removeForwadsForEditingPhoto];
    [self.undoRedoStacksForEditingPhoto addObject:imageData];
    if (self.undoRedoStacksForEditingPhoto.count > self.maximumCountForEditingPhoto) {
        [self.undoRedoStacksForEditingPhoto removeObjectAtIndex:0];
    }
    self.currentIndexForEditingPhoto = self.undoRedoStacksForEditingPhoto.count-1;
    [self sendPushnotiForEditingPhotoUndoRedo];
    
}

-(void)sendPushnotiForEditingPhotoUndoRedo{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isEditingPhotoUndoRedoAvailable" object:nil];
    
}

-(void)undoEditingPhotoWithBlock:(void(^) (UIImage *image))block{
    if (self.undoRedoStacksForEditingPhoto.count == 0) {
        return;
    }
    
    if (self.currentIndexForEditingPhoto - 1 >= 0) {
        self.currentIndexForEditingPhoto -= 1;
    } else {
        return;
    }

    NSData *data = self.undoRedoStacksForEditingPhoto[self.currentIndexForEditingPhoto];
    [self sendPushnotiForEditingPhotoUndoRedo];
    block([UIImage imageWithData:data]);

}

-(void)redoEditingPhotoWithBlock:(void(^) (UIImage *image))block{
    
    if (self.undoRedoStacksForEditingPhoto.count == 0) {
        return;
    }

    if (self.undoRedoStacksForEditingPhoto.count >= self.currentIndexForEditingPhoto+1) {
        self.currentIndexForEditingPhoto += 1;
    } else {
        return;
    }

    NSData *data = self.undoRedoStacksForEditingPhoto[self.currentIndexForEditingPhoto];
    [self sendPushnotiForEditingPhotoUndoRedo];
    block([UIImage imageWithData:data]);
}

-(void)removeForwadsForEditingPhoto{
    
    NSMutableArray *objectsToRemove = [NSMutableArray new];
    for (int i = 0; i < self.undoRedoStacksForEditingPhoto.count; i++ ) {
        if (self.currentIndexForEditingPhoto < i) {
            [objectsToRemove addObject:self.undoRedoStacksForEditingPhoto[i]];
        }
    }
    
    [self.undoRedoStacksForEditingPhoto removeObjectsInArray:objectsToRemove];
    
}

-(BOOL)isUndoRemainsForEditingPhoto{

    if (self.currentIndexForEditingPhoto - 1 >= 0) {
        return true;
    } else {
        return false;
    }
}

-(BOOL)isRedoRemainsForEditingPhoto{
    if (self.undoRedoStacksForEditingPhoto.count > self.currentIndexForEditingPhoto+1) {
        return true;
    }
    return false;
}


@end
