//
//  NoteSticker3.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "NoteSticker3.h"

@implementation NoteSticker3

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"noteSticker3";
        self.backgroundImageName = @"noteSticker3";
        self.tintColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    }
    return self;
}

+(NoteSticker3*)noteSticker3{
    
    NoteSticker3* noteSticker3 = [[self alloc] init];
    return noteSticker3;
}

@end
