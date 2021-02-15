//
//  AppManager.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppManager : NSObject

+ (AppManager *)sharedInstance;
@property (nonatomic) CGSize keyboardSize;
@end

NS_ASSUME_NONNULL_END
