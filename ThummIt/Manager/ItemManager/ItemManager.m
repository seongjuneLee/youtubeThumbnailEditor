//
//  ItemManager.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import "ItemManager.h"
#import "PhotoFrameHeader.h"

@implementation ItemManager

+ (ItemManager *)sharedInstance {
    static ItemManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ItemManager alloc] init];
    });
    
    return sharedInstance;
}

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

@end
