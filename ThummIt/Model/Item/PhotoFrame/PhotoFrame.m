//
//  Border.m
//  Thummit
//
//  Created by 이성준 on 2020/12/15.
//

#import "PhotoFrame.h"

@implementation PhotoFrame

-(id)init{
    
    self = [super init];
    if(self){
        self.itemType = 0;
        self.relativeCenter = CGPointMake(0.5, 0.5);
        self.scale = 1;
        self.rotationDegree = 0;
        
        float screenWidth = UIScreen.mainScreen.bounds.size.width;
        float circleViewWidth = screenWidth*0.8/2;
        self.baseView = [[UIView alloc] init];
        self.baseView.frameSize = CGSizeMake(circleViewWidth, circleViewWidth);
        self.baseView.clipsToBounds = true;
        self.baseView.layer.cornerRadius = self.backgroundImageView.frameWidth/2;
        self.baseView.backgroundColor = UIColor.clearColor;
        
    }
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    PhotoFrame *copied = [super copyWithZone:zone];
    copied.baseView.layer.cornerRadius = copied.baseView.frameWidth/2;
    
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
    
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float circleViewWidth = screenWidth*0.8/2;

    self.backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, circleViewWidth, circleViewWidth)];
    self.backgroundImageView.center = CGPointMake(self.baseView.frameWidth/2, self.baseView.frameHeight/2);
    self.backgroundImageView.backgroundColor = UIColor.clearColor;
    self.backgroundImageView.clipsToBounds = true;
    self.backgroundImageView.layer.cornerRadius = self.backgroundImageView.frameWidth/2;
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    if (imageName) {
        self.backgroundImageView.image = [UIImage imageNamed:imageName];
    }
    [self.baseView addSubview:self.backgroundImageView];

}

-(void)addSubViewsToBaseView{
    
    self.plusLabel = [[UILabel alloc] init];
    self.plusLabel.text = NSLocalizedString(@"+ Photo", nil);
    self.plusLabel.textColor = UIColor.blackColor;
    [self.plusLabel sizeToFit];
    self.plusLabel.center = CGPointMake(self.backgroundImageView.frameWidth/2, self.backgroundImageView.frameHeight/2);
    [self.baseView insertSubview:self.plusLabel atIndex:0];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frameSize = self.backgroundImageView.frameSize;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.baseView insertSubview:self.imageView atIndex:1];
    
}

-(void)scaleItem{
    
    [super scaleItem];
    self.baseView.layer.cornerRadius = self.baseView.frameWidth/2;
    self.plusLabel.center = CGPointMake(self.backgroundImageView.frameWidth/2, self.backgroundImageView.frameHeight/2);
    self.imageView.center = CGPointMake(self.backgroundImageView.frameWidth/2, self.backgroundImageView.frameHeight/2);

}

@end
