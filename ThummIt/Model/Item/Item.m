//
//  Item.m
//  Thummit
//
//  Created by 이성준 on 2020/12/17.
//

#import "Item.h"
#import "PhotoManager.h"
#import "SaveManager.h"
#import "UIImage+Additions.h"
@implementation Item

-(id)init{
    
    self = [super init];
    if (self) {
        self.indexInLayer = @"";
        self.scale = 1.0;
        self.relativeCenter = CGPointMake(0.5, 0.5);
    }
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    Item * copied = [[self.class alloc] init];
    copied.rotationDegree = self.rotationDegree;
    copied.scale = self.scale;
    copied.indexInLayer = self.indexInLayer;
    copied.center = self.baseView.center;
    copied.relativeCenter = self.relativeCenter;

    return copied;
}
-(void)setItemCenterAndScale{
    CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(self.rotationDegree);
    if (!self.isBasePhotoFrame) {
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(self.scale, self.scale);
        self.baseView.transform = CGAffineTransformConcat(rotationTransform, scaleTransform);
    } else {
        self.baseView.transform = rotationTransform;
    }
    self.baseView.center = self.center;
    
}

-(id)initWithCoder:(NSCoder *)decoder{
    if((self = [super init])) {        
        self.backgroundImageName = [decoder decodeObjectForKey:@"backgroundImageName"];
        self.backgroundImageView.image = [[UIImage imageNamed:self.backgroundImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.itemName = [decoder decodeObjectForKey:@"itemName"];
        self.indexInLayer = [decoder decodeObjectForKey:@"indexInLayer"];
        self.center = [[decoder decodeObjectForKey:@"center"] CGPointValue];
        self.scale = [[decoder decodeObjectForKey:@"scale"] floatValue];
        self.rotationDegree = [[decoder decodeObjectForKey:@"rotationDegree"] floatValue];
        self.relativeCenter = [[decoder decodeObjectForKey:@"relativeCenter"] CGPointValue];
        self.canChangeColor = [[decoder decodeObjectForKey:@"canChangeColor"] boolValue];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{

    [encoder encodeObject:self.itemName forKey:@"itemName"];
    [encoder encodeObject:self.indexInLayer forKey:@"indexInLayer"];
    [encoder encodeObject:self.backgroundImageName forKey:@"backgroundImageName"];
    [encoder encodeObject:[NSValue valueWithCGPoint:self.baseView.center] forKey:@"center"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.scale] forKey:@"scale"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.rotationDegree] forKey:@"rotationDegree"];
    [encoder encodeObject:[NSValue valueWithCGPoint:self.relativeCenter] forKey:@"relativeCenter"];
    [encoder encodeObject:[NSNumber numberWithBool:self.canChangeColor] forKey:@"canChangeColor"];
}

@end
