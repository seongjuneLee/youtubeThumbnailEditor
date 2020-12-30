//
//  ItemManager.h
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemManager : NSObject

+ (ItemManager *)sharedInstance;

-(NSArray *)photoFrameCategories;

-(NSArray *)circlePhotoFrames;
-(NSArray *)rectanglePhotoFrames;

@end

NS_ASSUME_NONNULL_END
