//
//  ArrowSticker1.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/14.
//

#import "ArrowSticker1.h"

@implementation ArrowSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"arrowSticker1";
        self.backgroundImageName = @"arrowSticker1";
        self.tintColor = [UIColor redColor];
    }
    return self;
}

+(ArrowSticker1*)arrowSticker1{
    
    ArrowSticker1* arrowSticker1 = [[self alloc] init];
    return arrowSticker1;
}

@end
