//
//  VlogVideoSticker.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "VlogVideoSticker.h"

@implementation VlogVideoSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"vlogVideoSticker";
        self.backgroundImageName = @"vlogVideoSticker";
        self.tintColor = [UIColor colorWithRed:20/255.0 green:179/255.0 blue:215/255.0 alpha:1.0];

    }
    return self;
}

+(VlogVideoSticker*) vlogVideoSticker{
    
    VlogVideoSticker* vlogVideoSticker = [[self alloc] init];
    return vlogVideoSticker;
}

@end
