//
//  TypoManager.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TypoManager : NSObject

+ (TypoManager *)sharedInstance;
-(NSArray *)typos;

@end

NS_ASSUME_NONNULL_END
