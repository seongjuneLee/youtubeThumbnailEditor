//
//  CircleSticker1.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/13.
//

#import "CircleSticker1.h"

@implementation CircleSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"circleSticker1";
        self.backgroundImageName = @"circleSticker1";
        self.tintColor = [UIColor redColor];
        self.canChangeColor = true;
//        self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
    
}

+(CircleSticker1*)circleSticker1{
    
    CircleSticker1* circleSticker1 = [[self alloc] init];
    return circleSticker1;
    
}


@end
