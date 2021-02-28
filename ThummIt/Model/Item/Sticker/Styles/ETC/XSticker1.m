//
//  XSticker1.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/14.
//

#import "XSticker1.h"

@implementation XSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"xSticker1";
        self.backgroundImageName = @"xSticker1";
        self.tintColor = [UIColor redColor];
        self.canChangeColor = true;
    }
    return self;
}

+(XSticker1*)xSticker1{
    
    XSticker1* xSticker1 = [[self alloc] init];
    return xSticker1;
}

@end
