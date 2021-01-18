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
    NSString *x = NSLocalizedString(@"X", nil);

    NSArray *categories = @[basicCircle, basicArrow, x];
    
    return categories;
}


-(NSArray *)basicCircleStickers{
    
    BasicCircleSticker *basicCircleStickerRed = [BasicCircleSticker basicCircleSticker];
    BasicCircleSticker *basicCircleStickerYellow = [BasicCircleSticker basicCircleSticker];
    BasicCircleSticker *basicCircleStickerBlack = [BasicCircleSticker basicCircleSticker];
    BasicCircleSticker *basicCircleStickerWhite = [BasicCircleSticker basicCircleSticker];

    basicCircleStickerYellow.backgroundImageName = @"basicCircleStickerYellow";
    basicCircleStickerBlack.backgroundImageName = @"basicCircleStickerBlack";
    basicCircleStickerWhite.backgroundImageName = @"basicCircleStickerWhite";
    
    NSArray *stickers = @[basicCircleStickerRed, basicCircleStickerYellow, basicCircleStickerBlack, basicCircleStickerWhite];
    return stickers;
}

-(NSArray *)basicArrowStickers{
    
    BasicArrowSticker *basicArrowStickerRed = [BasicArrowSticker basicArrowSticker];
    BasicArrowSticker *basicArrowStickerYellow = [BasicArrowSticker basicArrowSticker];
    BasicArrowSticker *basicArrowStickerBlack = [BasicArrowSticker basicArrowSticker];
    BasicArrowSticker *basicArrowStickerWhite  = [BasicArrowSticker basicArrowSticker];

    basicArrowStickerYellow.backgroundImageName = @"basicArrowStickerYellow";
    basicArrowStickerBlack.backgroundImageName = @"basicArrowStickerBlack";
    basicArrowStickerWhite.backgroundImageName = @"basicArrowStickerWhite";
    
    NSArray *stickers = @[basicArrowStickerRed, basicArrowStickerYellow, basicArrowStickerBlack, basicArrowStickerWhite];
    return stickers;
}

-(NSArray *)xStickers{
    
    XSticker *xStickerRed = [XSticker xSticker];
    XSticker *xStickerYellow = [XSticker xSticker];
    XSticker *xStickerBlack = [XSticker xSticker];
    XSticker *xStickerWhite  = [XSticker xSticker];

    xStickerYellow.backgroundImageName = @"xStickerYellow";
    xStickerBlack.backgroundImageName = @"xStickerBlack";
    xStickerWhite.backgroundImageName = @"xStickerWhite";
    
    NSArray *stickers = @[xStickerRed, xStickerYellow, xStickerBlack, xStickerWhite];
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
