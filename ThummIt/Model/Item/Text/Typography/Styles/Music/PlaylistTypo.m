//
//  PlaylistTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "PlaylistTypo.h"

@implementation PlaylistTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"PLAYLIST",nil);
        self.fontName = @"MapoFlowerIsland";
        self.textColor = [UIColor colorWithRed:252/255.0 green:189/255.0 blue:64/255.0 alpha:1];
        self.canChangeColor = true;
        self.fontInterval = 6.0;
        
    }
    return self;
}

+(PlaylistTypo *)playlistTypo{
    PlaylistTypo *playlistTypo = [[self alloc] init];
    return playlistTypo;
    
}

@end
