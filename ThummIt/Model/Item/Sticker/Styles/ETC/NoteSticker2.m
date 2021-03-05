//
//  NoteSticker2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "NoteSticker2.h"

@implementation NoteSticker2

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"noteSticker2";
        self.backgroundImageName = @"noteSticker2";
        self.tintColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(NoteSticker2*)noteSticker2{
    
    NoteSticker2* noteSticker2 = [[self alloc] init];
    return noteSticker2;
}

@end

