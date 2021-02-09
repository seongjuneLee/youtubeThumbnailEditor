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
        self.indexInLayer = @"";
        self.scale = 0.4;
    }
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    Item * copied = [[self.class alloc] init];
    copied.center = self.center;
    copied.rotationDegree = self.rotationDegree;
    copied.scale = self.scale;
    copied.indexInLayer = self.indexInLayer;
    
    return copied;
}
-(void)scaleItem{
    
    float width = UIScreen.mainScreen.bounds.size.width;
    float scale = width/self.baseView.frameWidth;
    NSLog(@"self.scale %f",self.scale);
    NSLog(@"scale * self.scale %f",scale * self.scale);
    NSLog(@"self.baseView frame %@",NSStringFromCGRect(self.baseView.frame));
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scale * self.scale, scale * self.scale);
    self.baseView.transform = CGAffineTransformConcat(self.baseView.transform, scaleTransform);
    
}
-(void)loadView{
    
}

-(id)initWithCoder:(NSCoder *)decoder{
    if((self = [super init])) {
        
        
        self.backgroundImageView = [decoder decodeObjectForKey:@"backgroundImageView"];
        self.backgroundImageName = [decoder decodeObjectForKey:@"backgroundImageName"];
        self.backgroundImageView.image = [[UIImage imageNamed:self.backgroundImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.itemName = [decoder decodeObjectForKey:@"itemName"];
        self.indexInLayer = [decoder decodeObjectForKey:@"indexInLayer"];
        self.center = [[decoder decodeObjectForKey:@"center"] CGPointValue];
        self.scale = [[decoder decodeObjectForKey:@"scale"] floatValue];
        self.rotationDegree = [[decoder decodeObjectForKey:@"rotationDegree"] floatValue];
        self.isTemplateItem = self.isTemplateItem;
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{

    [encoder encodeObject:self.itemName forKey:@"itemName"];
    [encoder encodeObject:self.indexInLayer forKey:@"indexInLayer"];
    [encoder encodeObject:self.backgroundImageView forKey:@"backgroundImageView"];
    [encoder encodeObject:self.backgroundImageName forKey:@"backgroundImageName"];
    [encoder encodeObject:[NSValue valueWithCGPoint:self.baseView.center] forKey:@"center"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.scale] forKey:@"scale"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.rotationDegree] forKey:@"rotationDegree"];
    

}

@end
