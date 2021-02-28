//
//  CloudSticker2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "CloudSticker2.h"

@implementation CloudSticker2

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"cloudSticker2";
        self.backgroundImageName = @"cloudSticker2";
        self.tintColor = [UIColor whiteColor];
        self.canChangeColor = true;
    }
    return self;
}

+(CloudSticker2*)cloudSticker2{
    
    CloudSticker2* cloudSticker2 = [[self alloc] init];
    return cloudSticker2;
}

@end
