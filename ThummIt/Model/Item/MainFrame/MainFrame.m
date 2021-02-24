//
//  MainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "MainFrame.h"

@implementation MainFrame

- (id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone{
    
    MainFrame *copied = [super copyWithZone:zone];
    copied.tintColor = self.tintColor;
    copied.backgroundImageName = self.backgroundImageName;
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
    if (image) {
        imageWidth = image.size.width * image.scale;
        imageHeight = image.size.height * image.scale;
    }
    
    CGSize screenSize = UIScreen.mainScreen.bounds.size;
    float width = screenSize.width;

    self.baseView = [[UIView alloc] init];
    self.baseView.clipsToBounds = true;
    self.baseView.frameSize = CGSizeMake(width, width * 9/16);
    self.baseView.backgroundColor = UIColor.clearColor;

}

-(void)addBackgroundImageView{
    
    self.backgroundImageView = [[UIImageView alloc] init];
    self.backgroundImageView.frameSize = self.baseView.frameSize;
    self.backgroundImageView.center = CGPointMake(self.baseView.frameWidth/2, self.baseView.frameHeight/2);
    self.backgroundImageView.backgroundColor = UIColor.clearColor;
    self.backgroundImageView.clipsToBounds = true;
//    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    
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
