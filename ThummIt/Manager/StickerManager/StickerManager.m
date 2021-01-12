//
//  StickerManager.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/12.
//

#import "StickerManager.h"
#import "StickerHeader.h"

@implementation StickerManager

+ (StickerManager *)sharedInstance {
    static StickerManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[StickerManager alloc] init];
    });
    
    return sharedInstance;
}

- (NSArray *)stickers{
    
    BasicCircleSticker *basicCircleSticker = [BasicCircleSticker basicCircleSticker];
    
    return @[basicCircleSticker];
}

@end
