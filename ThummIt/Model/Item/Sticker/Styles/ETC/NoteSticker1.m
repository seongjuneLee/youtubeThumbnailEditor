//
//  NoteSticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "NoteSticker1.h"

@implementation NoteSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"noteSticker1";
        self.backgroundImageName = @"noteSticker1";
        self.tintColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    }
    return self;
}

+(NoteSticker1*)noteSticker1{
    
    NoteSticker1* noteSticker1 = [[self alloc] init];
    return noteSticker1;
}

@end


