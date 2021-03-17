//
//  TwoMusicNoteSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "TwoMusicNoteSticker.h"

@implementation TwoMusicNoteSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"twoMusicNoteSticker";
        self.backgroundImageName = @"twoMusicNoteSticker";
        
    }
    return self;
}

+(TwoMusicNoteSticker *)twoMusicNoteSticker{
    
    TwoMusicNoteSticker *twoMusicNoteSticker = [[self alloc] init];
    return twoMusicNoteSticker;
}

@end
