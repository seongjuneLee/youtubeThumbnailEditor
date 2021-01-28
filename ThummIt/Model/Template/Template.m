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

-(void)centerLabel:(PhotoFrame *)photoFrame withSizeDelta:(float)delta{
    
    photoFrame.plusLabel.frameX -= delta/2;
    photoFrame.plusLabel.frameY -= delta/2;
    
}


@end
