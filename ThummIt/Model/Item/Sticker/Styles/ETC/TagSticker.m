//
//  TagSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "TagSticker.h"

@implementation TagSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"tagSticker";
        self.backgroundImageName = @"tagSticker";
        self.tintColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(TagSticker*)tagSticker{
    
    TagSticker* tagSticker = [[self alloc] init];
    return tagSticker;
}

@end
