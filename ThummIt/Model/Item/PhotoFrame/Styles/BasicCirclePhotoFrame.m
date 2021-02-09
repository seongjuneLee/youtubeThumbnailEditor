//
//  BasicCircle.m
//  Thummit
//
//  Created by 이성준 on 2020/12/15.
//

#import "BasicCirclePhotoFrame.h"

@implementation BasicCirclePhotoFrame

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"BasicCircle";
        self.isCircle = true;
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float circleViewWidth = screenWidth*0.8/2;
    self.baseView.frameSize = CGSizeMake(circleViewWidth, circleViewWidth);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
        
    }
    return self;
}

+(BasicCirclePhotoFrame*)basicCirclePhotoFrame{
    
    BasicCirclePhotoFrame* basicCirclePhotoFrame = [[self alloc] init];
    return basicCirclePhotoFrame;
    
}


@end
