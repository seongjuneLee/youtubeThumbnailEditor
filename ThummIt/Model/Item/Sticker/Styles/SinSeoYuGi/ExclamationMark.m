//
//  ExclamationMark.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "ExclamationMark.h"

@implementation ExclamationMark

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"exclamationMark";
        self.backgroundImageName = @"exclamationMark";
    }
    return self;
}

+(ExclamationMark*)exclamationMark{
    
    ExclamationMark* exclamationMark = [[self alloc] init];
    return exclamationMark;
}

@end
