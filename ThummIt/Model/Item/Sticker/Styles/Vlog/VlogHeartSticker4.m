//
//  VlogHeartSticker4.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "VlogHeartSticker4.h"

@implementation VlogHeartSticker4

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"vlogHeartSticker4";
        self.backgroundImageName = @"vlogHeartSticker4";

    }
    return self;
}

+(VlogHeartSticker4*) vlogHeartSticker4{
    
    VlogHeartSticker4* vlogHeartSticker4 = [[self alloc] init];
    return vlogHeartSticker4;
}

@end
