//
//  UIColor+patternArchive.m
//  Vlogr
//
//  Created by 이성준 on 24/09/2019.
//  Copyright © 2019 TaejunLee. All rights reserved.
//

#import "UIColor+patternArchive.h"
#import <objc/runtime.h>

@implementation UIColor (patternArchive)

static char STRING_KEY; // global 0 initialization is fine here, no
// need to change it since the value of the
// variable is not used, just the address

- (UIImage*)associatedObject
{
    return objc_getAssociatedObject(self,&STRING_KEY);
}

- (void)setAssociatedObject:(UIImage*)newObject
{
    objc_setAssociatedObject(self,&STRING_KEY,newObject,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)encodeWithCoderAssociatedObject:(NSCoder *)aCoder
{
    if (CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor))==kCGColorSpaceModelPattern)
    {
        UIImage *i = [self associatedObject];
        NSData *imageData = UIImagePNGRepresentation(i);
        [aCoder encodeObject:imageData forKey:@"associatedObjectKey"];
//        self = [UIColor clearColor];
        [self initWithCGColor:UIColor.clearColor.CGColor];
    } else {
        
        // Call default implementation, Swizzled
        [self encodeWithCoderAssociatedObject:aCoder];
    }
}

- (id)initWithCoderAssociatedObject:(NSCoder *)aDecoder
{
    if([aDecoder containsValueForKey:@"associatedObjectKey"])
    {
        NSData *imageData = [aDecoder decodeObjectForKey:@"associatedObjectKey"];
        UIImage *i = [UIImage imageWithData:imageData];
        self = [UIColor colorWithPatternImage:i];
        [self setAssociatedObject:i];
        return self;
    }
    else
    {
        // Call default implementation, Swizzled
        return [self initWithCoderAssociatedObject:aDecoder];
    }
}

@end
