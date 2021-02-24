//
//  ItemManager.h
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import <Foundation/Foundation.h>
#import "Item.h"
NS_ASSUME_NONNULL_BEGIN

@interface ItemManager : NSObject

+ (ItemManager *)sharedInstance;

-(NSArray *)photoFrameCategories;
-(NSArray *)stickerCategories;
-(NSArray *)mainFrameCategories;

-(NSArray *)photoFrameDatas;
-(NSArray *)stickerDatas;
-(NSArray *)mainFrameDatas;

-(NSArray *)typoDatas;
-(NSArray *)photoFrameDatasForFreeFormProject;
-(NSArray *)photoFrameCategoriesForFreeFormProject;

-(void)addItem:(Item *)item withView:(UIView *)view underView:(UIView *)gestureView withCriteriaView:(UIImageView *)imageView;
-(void)deleteItem:(Item *)item;
-(BOOL)containsItem:(Item *)item;

@property (strong, nonatomic) NSArray *fetchedTypoDatas;

@end

NS_ASSUME_NONNULL_END
