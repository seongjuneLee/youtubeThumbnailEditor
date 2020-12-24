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
        self.center = CGPointMake(0.5, 0.5);
        self.scale = 1;
        self.rotationDegree = 0;
    }
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    PhotoFrame *copied = [super copyWithZone:zone];
    copied.baseView.layer.cornerRadius = copied.baseView.frameWidth/2;
    
    return copied;
}

-(void)makePhotoImageViewAndButtonWithView:(UIView *)photoFrameView{
    
    self.plusLabel = [[UILabel alloc] init];
    self.plusLabel.text = NSLocalizedString(@"+ Photo", nil);
    self.plusLabel.textColor = UIColor.blackColor;
    [self.plusLabel sizeToFit];
    self.plusLabel.center = CGPointMake(photoFrameView.frameWidth/2, photoFrameView.frameHeight/2);
    [photoFrameView addSubview:self.plusLabel];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frameSize = photoFrameView.frameSize;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [photoFrameView addSubview:self.imageView];
    
}

-(id)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
        
        
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{
    
    [super encodeWithCoder:encoder];
}

-(void)scaleItem{
    
    [super scaleItem];
    self.baseView.layer.cornerRadius = self.baseView.frameWidth/2;
    self.plusLabel.center = CGPointMake(self.baseView.frameWidth/2, self.baseView.frameHeight/2);

}

@end
