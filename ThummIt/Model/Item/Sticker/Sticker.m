//
//  Sticker.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/12.
//

#import "Sticker.h"

@implementation Sticker

-(id)init{
    self = [super init];
    if(self){
        // 템플릿에서만 필요
        self.center = CGPointMake(0.5, 0.5);
        self.scale = 1;
        self.rotationDegree = 0;
        
        
        float screenWidth = UIScreen.mainScreen.bounds.size.width;
        float circleViewWidth = screenWidth*0.8/2;
        self.baseView = [[UIView alloc] init];
        self.baseView.frameSize = CGSizeMake(circleViewWidth, circleViewWidth);
        self.baseView.backgroundColor = UIColor.clearColor;
        [self addSubViewsToBaseView];
        
    }
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    Sticker *copied = [super copyWithZone:zone];
    
    UIView *copiedBaseView = [[UIView alloc] initWithFrame:self.baseView.frame];
    copiedBaseView.backgroundColor = self.baseView.backgroundColor;
    copiedBaseView.clipsToBounds = self.baseView.clipsToBounds;
    copied.baseView = copiedBaseView;
    copied.backgroundImageView = [[UIImageView alloc] initWithFrame:self.backgroundImageView.frame];
    copied.backgroundImageView.image = [UIImage imageNamed:self.backgroundImageName];
    [copied.baseView addSubview:copied.backgroundImageView];
    copied.rotationDegree = self.rotationDegree;
    copied.baseView.transform = CGAffineTransformMakeRotation(degreesToRadians(copied.rotationDegree));
    if (self.itemName) {
        copied.itemName = [NSString stringWithString:self.itemName];
    }

    return copied;
}


-(id)initWithCoder:(NSCoder *)decoder{
    
    if((self = [super initWithCoder:decoder])) {
        
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{
    
    [super encodeWithCoder:encoder];

}

#pragma mark - helper

-(void)addCircleImageWithName:(NSString *)imageName{
    
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

-(void)addSubViewsToBaseView{
    
    self.backgroundImageView = [[UIImageView alloc] init];
    self.backgroundImageView.frameSize = self.baseView.frameSize;
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.baseView addSubview:self.backgroundImageView];
    
}

@end
