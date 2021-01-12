//
//  StickerManager.h
//  ThummIt
//
//  Created by 조재훈 on 2021/01/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StickerManager : NSObject

+ (StickerManager *)sharedInstance;
- (NSArray *)stickers;

@end

NS_ASSUME_NONNULL_END
