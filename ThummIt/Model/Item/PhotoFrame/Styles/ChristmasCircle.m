//
//  ChristmasCircle.m
//  Thummit
//
//  Created by 이성준 on 2020/12/15.
//

#import "ChristmasCircle.h"

@implementation ChristmasCircle

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"BasicCircle";
        self.backgroundImageName = @"christmasCircle";
        self.isCircle = true;
        [self addBackgroundImageWithName:self.backgroundImageName];
        [self makeBaseView];
        
    }
    return self;
    
}

-(void)makeBaseView{
    [super makeBaseView];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float circleViewWidth = screenWidth*0.8/2;
    self.baseView.frameSize = CGSizeMake(circleViewWidth, circleViewWidth);
    self.baseView.backgroundColor = UIColor.whiteColor;
}

-(void)addBackgroundImageWithName:(NSString *)imageName{
    
    self.backgroundImageView = [[UIImageView alloc] init];
    self.backgroundImageView.frameSize = self.baseView.frameSize;
    self.backgroundImageView.center = CGPointMake(self.baseView.frameWidth/2, self.baseView.frameHeight/2);
    self.backgroundImageView.backgroundColor = UIColor.clearColor;
    self.backgroundImageView.clipsToBounds = true;
    self.backgroundImageView.layer.cornerRadius = self.backgroundImageView.frameWidth/2;
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    if (imageName) {
        self.backgroundImageView.image = [UIImage imageNamed:imageName];
        [self.baseView addSubview:self.backgroundImageView];
    }

}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(ChristmasCircle*)christmasCircle{
    
    ChristmasCircle* christmasCircle = [[self alloc] init];
    return christmasCircle;
    
}
@end
