//
//  RetroMusicMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/12.
//

#import "RetroMusicMainFrame.h"

@implementation RetroMusicMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"retroMusicFrame";
        self.backgroundImageName = @"retroMusicFrame";
}
    return self;
}

+(RetroMusicMainFrame *)retroMusicMainFrame{

    RetroMusicMainFrame *retroMusicMainFrame = [[self alloc] init];
        
    return retroMusicMainFrame;
}

@end
