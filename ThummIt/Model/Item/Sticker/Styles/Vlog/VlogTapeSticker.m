//
//  VlogTapeSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/02.
//

#import "VlogTapeSticker.h"

@implementation VlogTapeSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"vlogTapeSticker";
        self.backgroundImageName = @"vlogTapeSticker";

    }
    return self;
}

+(VlogTapeSticker*) vlogTapeSticker{
    
    VlogTapeSticker* vlogTapeSticker = [[self alloc] init];
    return vlogTapeSticker;
}


@end
