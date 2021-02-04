//
//  CloudSticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "CloudSticker1.h"

@implementation CloudSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"cloudSticker1";
        self.backgroundImageName = @"cloudSticker1";
        self.tintColor = [UIColor whiteColor];
    }
    return self;
}

+(CloudSticker1*)cloudSticker1{
    
    CloudSticker1* cloudSticker1 = [[self alloc] init];
    return cloudSticker1;
}

@end
