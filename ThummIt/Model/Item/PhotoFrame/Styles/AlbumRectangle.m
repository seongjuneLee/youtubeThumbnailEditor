//
//  AlbumRectangle.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/14.
//

#import "AlbumRectangle.h"

@implementation AlbumRectangle

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"AlbumPhotoFrame";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = screenWidth * 9/16;

    float frameWidth = screenWidth * 0.27;
    float frameHeight = screenHeight * 0.42;

    self.baseView.frameSize = CGSizeMake(frameWidth, frameHeight);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(AlbumRectangle *)albumRectangle{
    
    AlbumRectangle *albumRectangle = [[self alloc] init];
    return albumRectangle;
    
}

@end
