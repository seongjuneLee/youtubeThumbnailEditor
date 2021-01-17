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
    }
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    Item * copied = [[self.class alloc] init];
    
    return copied;
}

-(id)initWithCoder:(NSCoder *)decoder{
    if((self = [super init])) {
        
        
        self.backgroundImageView = [decoder decodeObjectForKey:@"backgroundImageView"];
        self.backgroundImageName = [decoder decodeObjectForKey:@"backgroundImageName"];
        self.backgroundImageView.image = [UIImage imageNamed:self.backgroundImageName];

        self.itemName = [decoder decodeObjectForKey:@"itemName"];
        self.center = [[decoder decodeObjectForKey:@"center"] CGPointValue];
        self.scale = [[decoder decodeObjectForKey:@"scale"] floatValue];
        self.rotationDegree = [[decoder decodeObjectForKey:@"rotationDegree"] floatValue];

    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{

    [encoder encodeObject:self.itemName forKey:@"itemName"];
    [encoder encodeObject:self.backgroundImageView forKey:@"backgroundImageView"];
    [encoder encodeObject:self.backgroundImageName forKey:@"backgroundImageName"];
    [encoder encodeObject:[NSValue valueWithCGPoint:self.center] forKey:@"center"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.scale] forKey:@"scale"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.rotationDegree] forKey:@"rotationDegree"];


}

@end
