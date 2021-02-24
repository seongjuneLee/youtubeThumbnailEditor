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
    }
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    PhotoFrame *copied = [super copyWithZone:zone];
    copied.photoScale = self.photoScale;
    copied.isCircle = self.isCircle;
        
    copied.isFixedPhotoFrame = self.isFixedPhotoFrame;
    
    [copied loadView];
    [copied setItemCenterAndScale];

    // 카피시에 이미지를 가져올 때 phasset으로 가져오면 시차가 발생하는 문제 해결 위해. loadView 아래해서 해줄것.
    copied.photoImageView.frame = self.photoImageView.frame;
    copied.photoImageView.image = self.photoImageView.image;

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
        self.photoCenter = [[decoder decodeObjectForKey:@"photoCenter"] CGPointValue];
        self.photoScale = [[decoder decodeObjectForKey:@"photoScale"] floatValue];
        self.isCircle = [[decoder decodeObjectForKey:@"isCircle"] boolValue];
        self.isFixedPhotoFrame = [[decoder decodeObjectForKey:@"isFixedPhotoFrame"] boolValue];

    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{
    
    [super encodeWithCoder:encoder];
    
    [encoder encodeObject:self.phAsset.localIdentifier forKey:@"localIdentifier"];
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

}
    
-(void)setBaseViewFrame{
    
}

-(void)addSubViewsToBaseView{
    
    
    self.photoImageView = [[UIImageView alloc] init];
    self.photoImageView.contentMode = UIViewContentModeScaleAspectFill;
    if (self.phAsset) {
        [PhotoManager.sharedInstance getImageFromPHAsset:self.phAsset withPHImageContentMode:PHImageContentModeAspectFill withSize:CGSizeMake(1920, 1080) WithCompletionBlock:^(UIImage * _Nonnull image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                float ratio = image.size.height/image.size.width;
                float width = self.baseView.bounds.size.width;
                float height = self.baseView.bounds.size.height;
                if (ratio > 1) {
                    self.photoImageView.frameSize = CGSizeMake(width, width * ratio);
                } else {
                    self.photoImageView.frameSize = CGSizeMake(height * 1/ratio, height);
                }
                self.photoImageView.center = self.photoCenter;
                self.photoImageView.image = image;

            });
        }];
    } else {
        self.plusPhotoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plusBlack"]];
        self.plusPhotoImageView.frameSize = CGSizeMake(self.baseView.frameWidth * 0.1, self.baseView.frameWidth * 0.1);
        self.plusPhotoImageView.center = CGPointMake(self.baseView.frameWidth/2, self.baseView.frameHeight/2);
        [self.baseView addSubview:self.plusPhotoImageView];
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
