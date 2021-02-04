//
//  TargetSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "TargetSticker.h"

@implementation TargetSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"targetSticker";
        self.backgroundImageName = @"targetSticker";
        self.tintColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    }
    return self;
}

+(TargetSticker*)targetSticker{
    
    TargetSticker* targetSticker = [[self alloc] init];
    return targetSticker;
}

@end
