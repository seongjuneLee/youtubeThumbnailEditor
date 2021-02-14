//
//  Border.m
//  Thummit
//
//  Created by 이성준 on 2020/12/15.
//

#import "PhotoFrame.h"
#import "PhotoManager.h"

@implementation PhotoFrame

-(id)init{
    
    self = [super init];
    if(self){
        self.baseView = [[UIView alloc] init];
        self.baseView.clipsToBounds = true;
        self.baseView.backgroundColor = UIColor.whiteColor;

        // 템플릿에서만 필요
        self.center = CGPointMake(0.5, 0.5);
        self.rotationDegree = 0;
        self.photoScale = 1;
        self.photoRotationDegree = 0;
    }
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    PhotoFrame *copied = [super copyWithZone:zone];
    
    copied.photoScale = self.photoScale;
    copied.photoRotationDegree = self.photoRotationDegree;
    copied.isCircle = self.isCircle;
    
    UIView *copiedBaseView = [[UIView alloc] initWithFrame:self.baseView.bounds];
    copiedBaseView.backgroundColor = self.baseView.backgroundColor;
    copiedBaseView.clipsToBounds = self.baseView.clipsToBounds;
    
    copiedBaseView.layer.cornerRadius = self.baseView.layer.cornerRadius;
    
    copiedBaseView.transform = self.baseView.transform;
    copiedBaseView.center = self.baseView.center;
    
    copied.baseView = copiedBaseView;
    
    UIImageView *copiedPhotoImageView = [[UIImageView alloc] initWithFrame:self.photoImageView.frame];
    copiedPhotoImageView.image = [self.photoImageView.image copy];
    copiedPhotoImageView.backgroundColor = UIColor.clearColor;
    copied.photoImageView = copiedPhotoImageView;
    copiedPhotoImageView.contentMode = self.photoImageView.contentMode;
    copied.itemName = [NSString stringWithString:self.itemName];
    [copied.baseView addSubview:copied.photoImageView];
    

    copied.backgroundImageView = [[UIImageView alloc] initWithFrame:self.backgroundImageView.frame];
    copied.backgroundImageView.image = [UIImage imageNamed:self.backgroundImageName];
    [copied.baseView addSubview:copied.backgroundImageView];
    
    copied.isFixedPhotoFrame = self.isFixedPhotoFrame;
    copied.indexInLayer = self.indexInLayer;

    return copied;
}


-(id)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
        
        
        NSString *phAssetLocalIdentifier = [decoder decodeObjectForKey:@"localIdentifier"];
        for (PHAsset *phAsset in PhotoManager.sharedInstance.phassets) {
            if ([phAsset.localIdentifier isEqualToString:phAssetLocalIdentifier]) {
                self.phAsset = phAsset;
            }
        }
        self.photoImageView.center = [[decoder decodeObjectForKey:@"photoCenter"] CGPointValue];
        self.photoRotationDegree = [[decoder decodeObjectForKey:@"photoRotationDegree"] floatValue];
        self.photoScale = [[decoder decodeObjectForKey:@"photoScale"] floatValue];
        self.isCircle = [[decoder decodeObjectForKey:@"isCircle"] boolValue];
        self.isFixedPhotoFrame = [[decoder decodeObjectForKey:@"isFixedPhotoFrame"] boolValue];

    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{
    
    [super encodeWithCoder:encoder];
    
    [encoder encodeObject:self.phAsset.localIdentifier forKey:@"localIdentifier"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.photoRotationDegree] forKey:@"photoRotationDegree"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.photoScale] forKey:@"photoScale"];
    [encoder encodeObject:[NSValue valueWithCGPoint:self.photoImageView.center] forKey:@"photoCenter"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.isCircle] forKey:@"isCircle"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.isFixedPhotoFrame] forKey:@"isFixedPhotoFrame"];

}


#pragma mark - helper
-(void)loadView{
    
    self.baseView = [[UIView alloc] init];
    self.baseView.clipsToBounds = true;
    self.baseView.backgroundColor = UIColor.whiteColor;
    [self setBaseViewFrame];
    if (self.isCircle) {
        self.baseView.layer.cornerRadius = (self.baseView.frameWidth)/2;
        self.backgroundImageView.layer.cornerRadius = self.backgroundImageView.frameWidth/2;
        self.backgroundImageView.clipsToBounds = true;
    }
    [self addSubViewsToBaseView];

    CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(self.rotationDegree);

    float width = UIScreen.mainScreen.bounds.size.width;
    float scale = width/self.baseView.frameWidth;
    if (!self.isFixedPhotoFrame) {
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scale * self.scale, scale * self.scale);
        self.baseView.transform = CGAffineTransformConcat(rotationTransform, scaleTransform);
    } else {
        self.baseView.transform = rotationTransform;
    }
    
    self.baseView.center = self.center;

}
    
-(void)setBaseViewFrame{
    
}

-(void)addSubViewsToBaseView{
    
    if (self.isTemplateItem) {
        self.plusLabel = [[UILabel alloc] init];
        self.plusLabel.text = NSLocalizedString(@"+ Photo", nil);
        self.plusLabel.textColor = UIColor.blackColor;
        [self.plusLabel sizeToFit];
        self.plusLabel.center = CGPointMake(self.baseView.frameWidth/2, self.baseView.frameHeight/2);
        [self.baseView addSubview:self.plusLabel];
    }
    
    self.photoImageView = [[UIImageView alloc] init];
    self.photoImageView.contentMode = UIViewContentModeScaleAspectFill;
    if (self.phAsset) {
        [PhotoManager.sharedInstance getImageFromPHAsset:self.phAsset withPHImageContentMode:PHImageContentModeAspectFill withSize:CGSizeMake(1920, 1080) WithCompletionBlock:^(UIImage * _Nonnull image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.photoImageView.image = image;
                float ratio = image.size.height/image.size.width;
                float width = self.baseView.frameWidth * 1.2;
                self.photoImageView.frameSize = CGSizeMake(self.baseView.frameWidth * 1.2, width * ratio);
            });
        }];
    }
    [self.baseView addSubview:self.photoImageView];
    if (self.backgroundImageName) {
        self.backgroundImageView = [[UIImageView alloc] init];
        self.backgroundImageView.frameSize = self.baseView.frameSize;
        self.backgroundImageView.center = CGPointMake(self.baseView.frameWidth/2, self.baseView.frameHeight/2);
        self.backgroundImageView.backgroundColor = UIColor.clearColor;
        self.backgroundImageView.clipsToBounds = true;
        if (self.isCircle) {
            self.backgroundImageView.layer.cornerRadius = self.backgroundImageView.frameWidth/2;
        }
        self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.backgroundImageView.image = [UIImage imageNamed:self.backgroundImageName];
        [self.baseView addSubview:self.backgroundImageView];
    }

}

@end
