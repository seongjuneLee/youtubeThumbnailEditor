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
@property (nonatomic) NSUInteger currentIndex;
@property (nonatomic) NSUInteger maximumCount;

-(void)addCurrentProjectToUndoRedoStack;
-(void)undo;
-(void)redo;
-(BOOL)isUndoRemains;
-(BOOL)isRedoRemains;

@end

NS_ASSUME_NONNULL_END
