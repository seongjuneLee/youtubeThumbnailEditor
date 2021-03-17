//
//  YourPlaylistTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/14.
//

#import "YourPlaylistTypo.h"

@implementation YourPlaylistTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"your",nil);
        self.fontName = @"S-CoreDream-7ExtraBold";
        self.textColor = [UIColor colorWithRed:(169/255.0) green:(96/255.0) blue:(220/255.0) alpha:1];
        self.canChangeColor = true;
        self.obliqueValue = 0.25;
        self.fontSize = 40;
        self.fontInterval = 2;
        
    }
    return self;
}

+(YourPlaylistTypo *)yourPlaylistTypo{
    YourPlaylistTypo *yourPlaylistTypo = [[self alloc] init];
    return yourPlaylistTypo;
    
}

@end
