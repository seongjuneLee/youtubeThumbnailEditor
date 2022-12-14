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
        self.photoFrames = [NSMutableArray array];
        self.texts = [NSMutableArray array];
        self.stickers = [NSMutableArray array];
        [self setUpPhotoFrame];
        [self setUpTexts];
        [self setUpStickers];
        [self setUpMainFrames];
    }
    return self;
}

-(NSMutableArray *)items{
    
    NSMutableArray *items = [NSMutableArray array];
    [items addObjectsFromArray:self.photoFrames];
    [items addObjectsFromArray:self.texts];
    [items addObjectsFromArray:self.stickers];
    
    return items;
    
}

-(void)setUpPhotoFrame{
        
}

-(void)setUpTexts{
    
}

-(void)setUpStickers{
    
}

-(void)setUpMainFrames{
    
}

@end
