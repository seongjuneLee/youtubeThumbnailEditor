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
        
        float screenWidth = UIScreen.mainScreen.bounds.size.width;
        float circleViewWidth = screenWidth*0.8/2;
        self.baseView = [[UIView alloc] init];
        self.baseView.frameSize = CGSizeMake(circleViewWidth, circleViewWidth);
        self.baseView.clipsToBounds = true;
        self.baseView.layer.cornerRadius = self.baseView.frameWidth/2;
        self.baseView.backgroundColor = UIColor.whiteColor;
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
        self.photoImageView = [decoder decodeObjectForKey:@"photoImageView"];
        
        NSString *imageURL = [decoder decodeObjectForKey:@"imageURL"];
        if (imageURL.length) {
            NSData *data = [[NSData alloc]initWithBase64EncodedString:imageURL options:NSDataBase64DecodingIgnoreUnknownCharacters];
            self.photoImageView.image = [UIImage imageWithData:data];
        }

    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{
    
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.phAsset.localIdentifier forKey:@"localIdentifier"];
    NSString *imageURL = [UIImagePNGRepresentation(self.photoImageView.image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    [encoder encodeObject:self.photoImageView forKey:@"photoImageView"];
    [encoder encodeObject:imageURL forKey:@"imageURL"];

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
    
    self.plusLabel = [[UILabel alloc] init];
    self.plusLabel.text = NSLocalizedString(@"+ Photo", nil);
    self.plusLabel.textColor = UIColor.blackColor;
    [self.plusLabel sizeToFit];
    self.plusLabel.center = CGPointMake(self.baseView.frameWidth/2, self.baseView.frameHeight/2);
    [self.baseView addSubview:self.plusLabel];
    
    self.photoImageView = [[UIImageView alloc] init];
    self.photoImageView.frameSize = self.baseView.frameSize;
    self.photoImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.baseView addSubview:self.photoImageView];
    
}

-(void)scaleItem{
    
    [super scaleItem];
    self.baseView.layer.cornerRadius = self.baseView.frameWidth/2;
    self.plusLabel.center = CGPointMake(self.baseView.frameWidth/2, self.baseView.frameHeight/2);
    self.photoImageView.center = CGPointMake(self.baseView.frameWidth/2, self.baseView.frameHeight/2);

}

@end
