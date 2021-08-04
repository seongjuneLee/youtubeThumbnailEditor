//
//  Photo.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/25.
//

#import "Photo.h"
#import "PhotoManager.h"
@implementation Photo
-(instancetype)init{
    self = [super init];
    if (self) {
        
        self.photoImageView = [[UIImageView alloc] init];
        self.baseView = [[UIView alloc] init];
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone{
    Photo *copied = [super copyWithZone:zone];
        
    copied.imageData = self.imageData;

    // 카피시에 이미지를 가져올 때 phasset으로 가져오면 시차가 발생하는 문제 해결 위해. loadView 아래해서 해줄것.
//    copied.photoImageView.frame = self.photoImageView.frame;
//    copied.photoImageView.image = self.photoImageView.image;

    return copied;

}

-(void)loadView{
    
    self.baseView = [[UIView alloc] init];
    self.photoImageView = [[UIImageView alloc] init];
    self.photoImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.baseView.center = self.center;
    float width = UIScreen.mainScreen.bounds.size.width * 0.8;
    float height = (UIScreen.mainScreen.bounds.size.width * 9/16) * 0.8;

    if (self.imageData) {
        self.photoImageView.image = [UIImage imageWithData:self.imageData];
        UIImage *image = self.photoImageView.image;
        float ratio = image.size.height/image.size.width;
        
        if (ratio < 1) {
            self.baseView.frameSize = CGSizeMake(width, width * ratio);
            self.photoImageView.frameSize = CGSizeMake(width, width * ratio);
        } else {
            self.baseView.frameSize = CGSizeMake(height * 1/ratio, height);
            self.photoImageView.frameSize = CGSizeMake(height * 1/ratio, height);
        }
    } else {
        self.baseView.frameSize = CGSizeMake(width, height);
        self.photoImageView.frameSize = CGSizeMake(width, height);
    }
    self.photoImageView.center = CGPointMake(self.baseView.bounds.size.width/2,self.baseView.bounds.size.height/2);
    [self.baseView addSubview:self.photoImageView];
}

-(id)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
        
        NSString *phAssetLocalIdentifier = [decoder decodeObjectForKey:@"localIdentifier"];
        for (PHAsset *phAsset in PhotoManager.sharedInstance.phassets) {
            if ([phAsset.localIdentifier isEqualToString:phAssetLocalIdentifier]) {
                self.phAsset = phAsset;
            }
        }
        
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{
    
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.phAsset.localIdentifier forKey:@"localIdentifier"];

    NSData *imageData = UIImagePNGRepresentation(self.photoImageView.image);
    [encoder encodeObject:imageData forKey:@"imageData"];

}

@end
