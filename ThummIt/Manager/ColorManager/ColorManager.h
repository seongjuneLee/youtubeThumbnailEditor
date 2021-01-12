//
//  ColorManager.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorManager : NSObject

+ (ColorManager *)sharedInstance;
-(NSArray *)bgColors;

@end

NS_ASSUME_NONNULL_END
