//
//  ItemManager.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import "ItemManager.h"
#import "SaveManager.h"
#import "PhotoFrameHeader.h"
#import "StickerHeader.h"

@implementation ItemManager

+ (ItemManager *)sharedInstance {
    static ItemManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ItemManager alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - 포토 프레임

-(NSArray *)photoFrameCategories{
    
    NSString *circle = NSLocalizedString(@"circle", nil);
    NSString *rectangle = NSLocalizedString(@"rectangle", nil);
    NSArray *categories = @[circle, rectangle];
    
    return categories;
}

-(NSArray *)circlePhotoFrames{
    
    BasicCircle *basicCircle = [BasicCircle basicCircle];
    ChristmasCircle *christmasCircle = [ChristmasCircle christmasCircle];
    
    NSArray *photoFrames = @[basicCircle, christmasCircle];
    return photoFrames;
}

-(NSArray *)rectanglePhotoFrames{
    
    BasicCircle *basicCircle = [BasicCircle basicCircle];
    ChristmasCircle *christmasCircle = [ChristmasCircle christmasCircle];
    
    NSArray *photoFrames = @[basicCircle, christmasCircle];
    return photoFrames;
}

#pragma mark - 스티커

-(NSArray *)stickerCategories{

    NSString *basicCircle = NSLocalizedString(@"basic circle", nil);
    NSString *basicArrow = NSLocalizedString(@"basic arrow", nil);
    NSString *x = NSLocalizedString(@"X sticker", nil);
    NSString *exclamationMark = NSLocalizedString(@"exclamation Mark", nil);

    NSArray *categories = @[basicCircle, basicArrow, x, exclamationMark];
    
    return categories;
}


-(NSArray *)basicCircleStickers{
    
    BasicCircleSticker *basicCircleSticker = [BasicCircleSticker basicCircleSticker];
    basicCircleSticker.backgroundImageName = @"basicCircleStickerWhite";
    NSArray *stickers = @[basicCircleSticker];
    return stickers;
}

-(NSArray *)basicArrowStickers{
    
    BasicArrowSticker *basicArrowSticker  = [BasicArrowSticker basicArrowSticker];
    basicArrowSticker.backgroundImageName = @"basicArrowStickerWhite";
    NSArray *stickers = @[basicArrowSticker];
    return stickers;
}

-(NSArray *)xStickers{
    
    XSticker *xSticker  = [XSticker xSticker];
    xSticker.backgroundImageName = @"xStickerWhite";
    NSArray *stickers = @[xSticker];
    return stickers;
}

-(NSArray *)exclamationMark{
    
    ExclamationMark *exclamationMark  = [ExclamationMark exclamationMark];
    exclamationMark.backgroundImageName = @"exclamationMark";
    NSArray *stickers = @[exclamationMark];
    return stickers;
}

-(void)addItem:(Item *)item{
    
    [SaveManager.sharedInstance addItem:item];
    [SaveManager.sharedInstance save];
    
}

-(void)deleteItem:(Item *)item{
    
    [item.baseView removeFromSuperview];
    [SaveManager.sharedInstance deleteItem:item];
    [SaveManager.sharedInstance save];
    
}

@end
