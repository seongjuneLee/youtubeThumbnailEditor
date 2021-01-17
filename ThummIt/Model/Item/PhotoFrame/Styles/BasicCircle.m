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
        [self makeBaseView];
        
    }
    return self;
    
}

-(void)makeBaseView{
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float circleViewWidth = screenWidth*0.8/2;
    self.baseView = [[UIView alloc] init];
    self.baseView.frameSize = CGSizeMake(circleViewWidth, circleViewWidth);
    self.baseView.backgroundColor = UIColor.clearColor;
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
        self.baseView.layer.cornerRadius = self.baseView.frameWidth/2;
        self.baseView.clipsToBounds = true;
        
        self.backgroundImageView.layer.cornerRadius = self.backgroundImageView.frameWidth/2;
        self.backgroundImageView.clipsToBounds = true;
    }
    return self;
}

+(BasicCircle*)basicCircle{
    
    BasicCircle* basicCircle = [[self alloc] init];
    return basicCircle;
    
}


@end
