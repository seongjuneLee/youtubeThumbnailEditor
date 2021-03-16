//
//  MintBoxSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "MintBoxSticker.h"

@implementation MintBoxSticker


-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"mintBoxSticker";
        self.backgroundImageName = @"mintBoxSticker";
        
    }
    return self;
}

+(MintBoxSticker *)mintBoxSticker{
    
    MintBoxSticker *mintBoxSticker = [[self alloc] init];
    return mintBoxSticker;
}

@end
