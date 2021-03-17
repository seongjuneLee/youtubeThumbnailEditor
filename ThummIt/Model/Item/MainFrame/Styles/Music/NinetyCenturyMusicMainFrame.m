//
//  NinetyCenturyMusicMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "NinetyCenturyMusicMainFrame.h"

@implementation NinetyCenturyMusicMainFrame


-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"ninetyCenturyMusicFrame";
        self.backgroundImageName = @"ninetyCenturyMusicFrame";
}
    return self;
}

+(NinetyCenturyMusicMainFrame *)ninetyCenturyMusicMainFrame{

    NinetyCenturyMusicMainFrame *ninetyCenturyMusicMainFrame = [[self alloc] init];
        
    return ninetyCenturyMusicMainFrame;
}

@end
