//
//  BTSMusicMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "BTSMusicMainFrame.h"

@implementation BTSMusicMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"btsMusicFrame";
        self.backgroundImageName = @"btsMusicFrame";
}
    return self;
}

+(BTSMusicMainFrame *)btsMusicMainFrame{

    BTSMusicMainFrame *btsMusicMainFrame = [[self alloc] init];
        
    return btsMusicMainFrame;
    
}

@end
