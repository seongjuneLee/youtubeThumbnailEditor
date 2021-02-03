//
//  BasicArrowSticker.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/14.
//

#import "BasicArrowSticker.h"

@implementation BasicArrowSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"basicArrowSticker";
        self.backgroundImageName = @"basicArrowStickerRed";
        self.tintColor = [UIColor whiteColor];
    }
    return self;
}

+(BasicArrowSticker*)basicArrowSticker{
    
    BasicArrowSticker* basicArrowSticker = [[self alloc] init];
    return basicArrowSticker;
}

@end
