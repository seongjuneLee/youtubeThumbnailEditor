//
//  UIColor+patternArchive.h
//  Vlogr
//
//  Created by 이성준 on 24/09/2019.
//  Copyright © 2019 TaejunLee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (patternArchive)

- (void)setAssociatedObject:(UIImage*)newObject;
- (UIImage*)associatedObject;
- (id)initWithCoderAssociatedObject:(NSCoder *)aDecoder;
- (void)encodeWithCoderAssociatedObject:(NSCoder *)aCoder;

@end

NS_ASSUME_NONNULL_END
