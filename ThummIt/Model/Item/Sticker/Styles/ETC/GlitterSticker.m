//
//  GlitterSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "GlitterSticker.h"

@implementation GlitterSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"glitterSticker";
        self.backgroundImageName = @"glitterSticker";
        self.tintColor = [UIColor colorWithRed:252/255.0 green:203/255.0 blue:85/255.0 alpha:1.0];
    }
    return self;
}

+(GlitterSticker*)glitterSticker{
    
    GlitterSticker* glitterSticker = [[self alloc] init];
    return glitterSticker;
}

@end
