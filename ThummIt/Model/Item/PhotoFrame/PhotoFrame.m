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
        // 템플릿에서만 필요
        self.center = CGPointMake(0.5, 0.5);
        self.scale = 1;
        self.rotationDegree = 0;
        
        [self addSubViewsToBaseView];
    }
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    PhotoFrame *copied = [super copyWithZone:zone];
    
    UIView *copiedBaseView = [[UIView alloc] initWithFrame:self.baseView.frame];
    copiedBaseView.backgroundColor = self.baseView.backgroundColor;
    copiedBaseView.clipsToBounds = self.baseView.clipsToBounds;
    copiedBaseView.layer.cornerRadius = self.baseView.layer.cornerRadius;
    copied.baseView = copiedBaseView;
    
    UIImageView *copiedPhotoImageView = [[UIImageView alloc] initWithFrame:self.photoImageView.frame];
    copiedPhotoImageView.image = [self.photoImageView.image copy];
    copied.photoImageView = copiedPhotoImageView;
    copiedPhotoImageView.contentMode = self.photoImageView.contentMode;
    copied.itemName = [NSString stringWithString:self.itemName];
    [copied.baseView addSubview:copied.photoImageView];

    copied.backgroundImageView = [[UIImageView alloc] initWithFrame:self.backgroundImageView.frame];
    copied.backgroundImageView.image = [UIImage imageNamed:self.backgroundImageName];
    [copied.baseView addSubview:copied.backgroundImageView];
    copied.rotationDegree = self.rotationDegree;
    copied.scale = self.scale;


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
        self.photoCenter = [[decoder decodeObjectForKey:@"center"] CGPointValue];
        self.photoRotationDegree = [[decoder decodeObjectForKey:@"photoRotationDegree"] floatValue];
        self.photoScale = [[decoder decodeObjectForKey:@"photoScale"] floatValue];

    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{
    
    [super encodeWithCoder:encoder];
    
    [encoder encodeObject:self.phAsset.localIdentifier forKey:@"localIdentifier"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.photoRotationDegree] forKey:@"photoRotationDegree"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.photoScale] forKey:@"photoScale"];
    [encoder encodeObject:[NSValue valueWithCGPoint:self.photoCenter] forKey:@"photoCenter"];
    
    
}


#pragma mark - helper
-(void)loadView{
    
    [self makeBaseView];
    self.baseView.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(degreesToRadians(self.rotationDegree)), CGAffineTransformMakeScale(self.scale, self.scale));
    self.baseView.center = self.center;
    
    if (self.backgroundImageName) {
        [self addBackgroundImageWithName:self.backgroundImageName];
    }
    
    [self addSubViewsToBaseView];
    self.photoImageView.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(degreesToRadians(self.photoRotationDegree)), CGAffineTransformMakeScale(self.photoScale, self.photoScale));
    self.photoImageView.center = self.photoCenter;

}


-(void)addSubViewsToBaseView{
    
    self.plusLabel = [[UILabel alloc] init];
    self.plusLabel.text = NSLocalizedString(@"+ Photo", nil);
    self.plusLabel.textColor = UIColor.blackColor;
    [self.plusLabel sizeToFit];
    self.plusLabel.center = CGPointMake(self.baseView.frameWidth/2, self.baseView.frameHeight/2);
    self.plusLabel.hidden = true;
    [self.baseView addSubview:self.plusLabel];
    
    self.photoImageView = [[UIImageView alloc] init];
    self.photoImageView.frameSize = self.baseView.frameSize;
    self.photoImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.baseView addSubview:self.photoImageView];
    
}

@end
