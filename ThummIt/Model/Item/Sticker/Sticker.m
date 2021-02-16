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
        self.rotationDegree = 0;
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
    copied.baseView.transform = CGAffineTransformMakeRotation(copied.rotationDegree);
    if (self.itemName) {
        copied.itemName = [NSString stringWithString:self.itemName];
    }

    return copied;
}


-(id)initWithCoder:(NSCoder *)decoder{
    
    if((self = [super initWithCoder:decoder])) {
        self.tintColor = [decoder decodeObjectForKey:@"tintColor"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{
    
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.tintColor forKey:@"tintColor"];

}

#pragma mark - helper

-(void)loadView{
    
    [self makeBaseView];
    [self addBackgroundImageView];
    

}

-(void)makeBaseView{
    UIImage *image = [UIImage imageNamed:self.backgroundImageName];
    float imageWidth = 300;
    float imageHeight = 300;
    float ratio = 1;
    if (image) {
        imageWidth = image.size.width * image.scale;
        imageHeight = image.size.height * image.scale;
        ratio = imageHeight/imageWidth;
    }
    CGSize screenSize = UIScreen.mainScreen.bounds.size;
    float width = screenSize.width*0.8/2;
    float height = screenSize.height*0.8/2;

    self.baseView = [[UIView alloc] init];
    self.baseView.clipsToBounds = true;
    if (ratio > 1) {
        self.baseView.frameSize = CGSizeMake(height * 1/ratio, height);
    } else {
        self.baseView.frameSize = CGSizeMake(width, width*ratio);
    }
    self.baseView.backgroundColor = UIColor.clearColor;

}

-(void)addBackgroundImageView{
    self.backgroundImageView = [[UIImageView alloc] init];
    self.backgroundImageView.frameSize = self.baseView.frameSize;
    self.backgroundImageView.center = CGPointMake(self.baseView.frameWidth/2, self.baseView.frameHeight/2);
    self.backgroundImageView.backgroundColor = UIColor.clearColor;
    self.backgroundImageView.clipsToBounds = true;
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    UIImage *image = [UIImage imageNamed:self.backgroundImageName];
    
    if (self.cannotChangeColor) {
        self.backgroundImageView.image = image;
    } else {
        self.backgroundImageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.backgroundImageView.tintColor = self.tintColor;
    }
    
    [self.baseView addSubview:self.backgroundImageView];
    
}

@end
