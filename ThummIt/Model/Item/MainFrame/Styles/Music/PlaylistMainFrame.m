//
//  PlaylistMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "PlaylistMainFrame.h"

@implementation PlaylistMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"playlistMusicFrame";
        self.backgroundImageName = @"playlistMusicFrame";
}
    return self;
}

+(PlaylistMainFrame *)playlistMainFrame{

    PlaylistMainFrame *playlistMainFrame = [[self alloc] init];
        
    return playlistMainFrame;
}

@end
