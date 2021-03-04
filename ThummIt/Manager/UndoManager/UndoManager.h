//
//  UndoManager.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UndoManager : NSObject

+ (UndoManager *)sharedInstance;

@property (strong, nonatomic) NSMutableArray *undoRedoStacks;
@property (nonatomic) NSInteger currentIndex;
@property (nonatomic) NSInteger maximumCount;

-(void)addCurrentProjectToUndoRedoStack;
-(void)undo;
-(void)redo;
-(BOOL)isUndoRemains;
-(BOOL)isRedoRemains;
-(void)initUndoRedo;


#pragma mark - editing photo undo redo

@property (strong, nonatomic) NSMutableArray *undoRedoStacksForEditingPhoto;
@property (nonatomic) NSInteger currentIndexForEditingPhoto;
@property (nonatomic) NSInteger maximumCountForEditingPhoto;

-(void)initUndoRedoForEditingPhoto;
-(void)addCurrentPhotoToStack:(UIImage *)image;
-(void)sendPushnotiForEditingPhotoUndoRedo;
-(void)undoEditingPhotoWithBlock:(void(^)(UIImage *image))block;
-(void)redoEditingPhotoWithBlock:(void(^) (UIImage *image))block;
-(void)removeForwadsForEditingPhoto;
-(BOOL)isUndoRemainsForEditingPhoto;
-(BOOL)isRedoRemainsForEditingPhoto;

@end

NS_ASSUME_NONNULL_END
