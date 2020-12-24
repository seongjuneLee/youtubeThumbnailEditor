//
//  Item.m
//  Thummit
//
//  Created by 이성준 on 2020/12/17.
//

#import "Item.h"
#import "PhotoManager.h"
#import "UIImage+Additions.h"
@implementation Item

-(id)init{
    
    self = [super init];
    if (self) {
        self.baseView.layer.cornerRadius = self.baseView.frameWidth/2;
        self.baseView.clipsToBounds = true;
    }
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    Item * copied = [[self.class alloc] init];
    UIView *copiedBaseView = [[UIView alloc] initWithFrame:self.baseView.frame];
    copiedBaseView.backgroundColor = self.baseView.backgroundColor;
    copiedBaseView.clipsToBounds = self.baseView.clipsToBounds;
    copied.baseView = copiedBaseView;
    UIImageView *copiedImageView = [[UIImageView alloc] initWithFrame:self.imageView.frame];
    copiedImageView.image = [self.imageView.image copy];
    copied.imageView = copiedImageView;
    copiedImageView.contentMode = self.imageView.contentMode;
    copied.itemName = [NSString stringWithString:self.itemName];
    
    [copied.baseView addSubview:copied.imageView];
    copied.center = self.center;
    copied.rotationDegree = self.rotationDegree;
    copied.scale = self.scale;
    copied.imageViewCenter = self.imageViewCenter;
    copied.imageViewRotationDegree = self.imageViewRotationDegree;
    copied.imageViewScale = self.imageViewScale;

    
    return copied;
}

-(id)initWithCoder:(NSCoder *)decoder{
    if((self = [super init])) {
        
        self.baseView = [decoder decodeObjectForKey:@"baseView"];
        self.baseView.layer.cornerRadius = self.baseView.frameWidth/2;
        self.baseView.clipsToBounds = true;
        
        self.itemName = [decoder decodeObjectForKey:@"itemName"];
        
        NSString *phAssetLocalIdentifier = [decoder decodeObjectForKey:@"localIdentifier"];
        for (PHAsset *phAsset in PhotoManager.sharedInstance.phassets) {
            if ([phAsset.localIdentifier isEqualToString:phAssetLocalIdentifier]) {
                self.phAsset = phAsset;
            }
        }
        self.imageView = [decoder decodeObjectForKey:@"imageView"];
        
        NSString *imageURL = [decoder decodeObjectForKey:@"imageURL"];
        if (imageURL.length) {
            NSData *data = [[NSData alloc]initWithBase64EncodedString:imageURL options:NSDataBase64DecodingIgnoreUnknownCharacters];
            self.imageView.image = [UIImage imageWithData:data];
        }
        
        self.center = [[decoder decodeObjectForKey:@"center"] CGPointValue];
        self.scale = [[decoder decodeObjectForKey:@"scale"] floatValue];
        self.rotationDegree = [[decoder decodeObjectForKey:@"rotationDegree"] floatValue];
        self.imageViewCenter = [[decoder decodeObjectForKey:@"imageViewCenter"] CGPointValue];
        self.imageViewScale = [[decoder decodeObjectForKey:@"imageViewScale"] floatValue];
        self.imageViewRotationDegree = [[decoder decodeObjectForKey:@"imageViewRotationDegree"] floatValue];

    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{

    [encoder encodeObject:self.baseView forKey:@"baseView"];
    [encoder encodeObject:self.itemName forKey:@"itemName"];
    [encoder encodeObject:self.phAsset.localIdentifier forKey:@"localIdentifier"];
    NSString *imageURL = [UIImagePNGRepresentation(self.imageView.image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    [encoder encodeObject:self.imageView forKey:@"imageView"];
    [encoder encodeObject:imageURL forKey:@"imageURL"];
    [encoder encodeObject:[NSValue valueWithCGPoint:self.center] forKey:@"center"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.scale] forKey:@"scale"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.rotationDegree] forKey:@"rotation"];
    
    [encoder encodeObject:[NSValue valueWithCGPoint:self.imageViewCenter] forKey:@"imageViewCenter"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.imageViewScale] forKey:@"imageViewScale"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.imageViewRotationDegree] forKey:@"imageViewRotationDegree"];
    

}

-(void)scaleItem{
    
    self.baseView.frameWidth *= self.scale;
    self.baseView.frameHeight *= self.scale;
        
}

@end
