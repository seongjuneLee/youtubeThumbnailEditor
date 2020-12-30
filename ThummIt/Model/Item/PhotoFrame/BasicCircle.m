//
//  BasicCircle.m
//  Thummit
//
//  Created by 이성준 on 2020/12/15.
//

#import "BasicCircle.h"

@implementation BasicCircle

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"BasicCircle";
        [self addCircleImageWithName:self.backgroundImageName];
        
    }
    return self;
    
}

+(BasicCircle*)basicCircle{
    
    BasicCircle* basicCircle = [[self alloc] init];
    return basicCircle;
    
}


@end
