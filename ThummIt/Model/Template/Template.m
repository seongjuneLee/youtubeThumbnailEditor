//
//  Template.m
//  Thummit
//
//  Created by 이성준 on 2020/12/15.
//

#import "Template.h"

@implementation Template

-(id)init{
    
    self = [super init];
    if(self){
        
    }
    return self;
}

-(NSMutableArray *)items{
    
    NSMutableArray *items = [NSMutableArray array];
    [items addObjectsFromArray:self.photoFrames];
    return items;
    
}

@end
