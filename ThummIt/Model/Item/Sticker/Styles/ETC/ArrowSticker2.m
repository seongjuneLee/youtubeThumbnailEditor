//
//  ArrowSticker2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "ArrowSticker2.h"

@implementation ArrowSticker2

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"arrowSticker2";
        self.backgroundImageName = @"arrowSticker2";
        self.tintColor = [UIColor colorWithRed:(255/255) green:(0/255) blue:(0/255) alpha:(1)];
    }
    return self;
}

+(ArrowSticker2*)arrowSticker2{
    
    ArrowSticker2* arrowSticker2 = [[self alloc] init];
    return arrowSticker2;
}


@end
