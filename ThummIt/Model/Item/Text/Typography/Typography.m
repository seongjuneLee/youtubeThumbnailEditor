//
//  Typography.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import "Typography.h"

@implementation Typography

- (id)init {
    if (self) {
        self.textColor = UIColor.whiteColor;
        self.borderColor = UIColor.clearColor;
        self.borderWidth = -1.0;
        self.backgroundColor = UIColor.clearColor;
        self.shadowColor = UIColor.clearColor;
        self.shadowOffset = CGSizeMake(3, 3);
        self.shadowRadius = 0;
        self.bgContentMode = UIViewContentModeScaleAspectFit;
        self.category = NSLocalizedString(@"Jolly", nil);
        self.alpha = 1;
        self.fontSize = TEXT_FONT_SIZE;
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.category forKey:@"category"];
    [encoder encodeObject:[NSNumber numberWithBool:self.isCustomTypo] forKey:@"isCustomTypo"];
    [encoder encodeObject:self.fontName forKey:@"fontName"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.fontSize] forKey:@"fontSize"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.scale] forKey:@"scale"];
    [encoder encodeObject:self.textColorPatternImageName forKey:@"textColorPatternImageName"];

    if (self.textToColor == nil) {
        if (!CGColorGetPattern(self.textColor.CGColor)) {
            [encoder encodeObject:self.textColor forKey:@"textColor"];
        } else {
            // 텍스트 전경색이 패턴이미지로 만들어진 색깔
            [encoder encodeObject:self.textColorPatternImageName forKey:@"textColorPatternImageName"];
        }
        
    } else {
        [encoder encodeObject:self.textFromColor forKey:@"textFromColor"];
        [encoder encodeObject:self.textToColor forKey:@"textToColor"];
        [encoder encodeObject:[NSNumber numberWithFloat:self.textGradientHeight] forKey:@"textGradientHeight"];
    }
    
    if (self.borderToColor == nil) {
        [encoder encodeObject:self.borderColor forKey:@"borderColor"];
        [encoder encodeObject:@(self.borderWidth) forKey:@"borderWidth"];
    } else {
        [encoder encodeObject:self.borderFromColor forKey:@"borderFromColor"];
        [encoder encodeObject:self.borderToColor forKey:@"borderToColor"];
        [encoder encodeObject:[NSNumber numberWithFloat:self.borderGradientHeight] forKey:@"borderGradientHeight"];
    }
    
    if (self.bgToColor == nil) {
        [encoder encodeObject:self.backgroundColor forKey:@"backgroundColor"];
    } else {
        [encoder encodeObject:self.bgFromColor forKey:@"bgFromColor"];
        [encoder encodeObject:self.bgToColor forKey:@"bgToColor"];
        [encoder encodeObject:[NSNumber numberWithFloat:self.bgGradientHeight] forKey:@"bgGradientHeight"];
    }
    
    if (self.shadowToColor == nil) {
        [encoder encodeObject:self.shadowColor forKey:@"shadowColor"];
    } else {
        [encoder encodeObject:self.shadowFromColor forKey:@"shadowFromColor"];
        [encoder encodeObject:self.shadowToColor forKey:@"shadowToColor"];
        [encoder encodeObject:[NSNumber numberWithFloat:self.shadowGradientHeight] forKey:@"shadowGradientHeight"];
    }
    
    [encoder encodeObject:self.bgTextAttributes forKey:@"bgTextAttributes"];


    [encoder encodeObject:[NSValue valueWithCGSize:self.shadowOffset] forKey:@"shadowOffset"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.shadowRadius] forKey:@"shadowRadius"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.alpha] forKey:@"alpha"];
    [encoder encodeObject:self.bgImageName forKey:@"bgImageName"];
    [encoder encodeObject:self.typoImageFilePath forKey:@"typoImageFilePath"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.bgWidthPadding] forKey:@"bgWidthPadding"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.bgHeightPadding] forKey:@"bgHeightPadding"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.bgCenterXDelta] forKey:@"bgCenterXDelta"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.bgCenterYDelta] forKey:@"bgCenterYDelta"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.bgContentMode] forKey:@"bgContentMode"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.borderRoundCorner] forKey:@"isRoundedCorner"];

}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        
        self.name = [decoder decodeObjectForKey:@"name"];
        self.category = [decoder decodeObjectForKey:@"category"];
        self.isCustomTypo = [[decoder decodeObjectForKey:@"isCustomTypo"] boolValue];
        self.fontName = [decoder decodeObjectForKey:@"fontName"];
        self.fontSize = [[decoder decodeObjectForKey:@"fontSize"] floatValue];
        self.scale = [[decoder decodeObjectForKey:@"scale"] floatValue];
        self.typoImageFilePath = [decoder decodeObjectForKey:@"typoImageFilePath"];

        self.textFromColor = [decoder decodeObjectForKey:@"textFromColor"];
        self.textToColor = [decoder decodeObjectForKey:@"textToColor"];
        self.textColorPatternImageName = [decoder decodeObjectForKey:@"textColorPatternImageName"];
        self.borderFromColor = [decoder decodeObjectForKey:@"borderFromColor"];
        self.borderToColor = [decoder decodeObjectForKey:@"borderToColor"];
        self.bgFromColor = [decoder decodeObjectForKey:@"bgFromColor"];
        self.bgToColor = [decoder decodeObjectForKey:@"bgToColor"];
        self.shadowFromColor = [decoder decodeObjectForKey:@"shadowFromColor"];
        self.shadowToColor = [decoder decodeObjectForKey:@"shadowToColor"];

        if (self.textToColor == nil) {
            self.textColor = [decoder decodeObjectForKey:@"textColor"];
            if (self.textColorPatternImageName) {
                self.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:self.textColorPatternImageName]];
            }
        } else {
            self.textFromColor = [decoder decodeObjectForKey:@"textFromColor"];
            self.textToColor = [decoder decodeObjectForKey:@"textToColor"];
            self.textGradientHeight = [[decoder decodeObjectForKey:@"textGradientHeight"] floatValue];
            self.textColor = [UIColor diagonalGradientFromColor:self.textFromColor toColor:self.textToColor withHeight:self.textGradientHeight];
        }
        
        if (self.borderToColor == nil) {
            self.borderColor = [decoder decodeObjectForKey:@"borderColor"];
            self.borderWidth = [[decoder decodeObjectForKey:@"borderWidth"] floatValue];
        } else {
            self.borderFromColor = [decoder decodeObjectForKey:@"borderFromColor"];
            self.borderToColor = [decoder decodeObjectForKey:@"borderToColor"];
            self.borderGradientHeight = [[decoder decodeObjectForKey:@"borderGradientHeight"] floatValue];
            self.borderColor = [UIColor diagonalGradientFromColor:self.borderFromColor toColor:self.borderToColor withHeight:self.borderGradientHeight];
        }
        
        if (self.bgToColor == nil) {
            self.backgroundColor = [decoder decodeObjectForKey:@"backgroundColor"];
        } else {
            self.bgFromColor = [decoder decodeObjectForKey:@"bgFromColor"];
            self.bgToColor = [decoder decodeObjectForKey:@"bgToColor"];
            self.bgGradientHeight = [[decoder decodeObjectForKey:@"bgGradientHeight"] floatValue];
        }
        
        if (self.shadowToColor == nil) {
            self.shadowColor = [decoder decodeObjectForKey:@"shadowColor"];
        } else {
            self.shadowFromColor = [decoder decodeObjectForKey:@"shadowFromColor"];
            self.shadowToColor = [decoder decodeObjectForKey:@"shadowToColor"];
            self.shadowGradientHeight = [[decoder decodeObjectForKey:@"shadowGradientHeight"] floatValue];
        }
        
        self.bgTextAttributes = [decoder decodeObjectForKey:@"bgTextAttributes"];

        self.shadowOffset = [[decoder decodeObjectForKey:@"shadowOffset"] CGSizeValue];
        self.shadowRadius = [[decoder decodeObjectForKey:@"shadowRadius"] floatValue];
        self.alpha = [[decoder decodeObjectForKey:@"alpha"] floatValue];
        self.bgImageName = [decoder decodeObjectForKey:@"bgImageName"];
        self.bgWidthPadding = [[decoder decodeObjectForKey:@"bgWidthPadding"] floatValue];
        self.bgHeightPadding = [[decoder decodeObjectForKey:@"bgHeightPadding"] floatValue];
        self.bgCenterXDelta = [[decoder decodeObjectForKey:@"bgCenterXDelta"] floatValue];
        self.bgCenterYDelta = [[decoder decodeObjectForKey:@"bgCenterYDelta"] floatValue];
        self.bgContentMode = [[decoder decodeObjectForKey:@"bgContentMode"] floatValue];
        self.borderRoundCorner = [[decoder decodeObjectForKey:@"isRoundedCorner"] boolValue];

    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone{
    
    Typography *copy = [[Typography allocWithZone: zone] init];
    
    copy.name = [self.name copyWithZone:zone];
    copy.category = [self.category copyWithZone:zone];
    copy.isCustomTypo = self.isCustomTypo;
    copy.fontName = [self.fontName copyWithZone:zone];
    copy.fontSize = self.fontSize;
    copy.scale = self.scale;
    
    copy.textColor = [self.textColor copyWithZone:zone];
    copy.textColorPatternImageName = [self.textColorPatternImageName copyWithZone:zone];
    copy.textFromColor = [self.textFromColor copyWithZone:zone];
    copy.textToColor = [self.textToColor copyWithZone:zone];
    copy.textGradientHeight = self.textGradientHeight;
    
    copy.borderColor = [self.borderColor copyWithZone:zone];
    copy.borderWidth = self.borderWidth;
    copy.borderFromColor = [self.borderFromColor copyWithZone:zone];
    copy.borderToColor = [self.borderToColor copyWithZone:zone];
    copy.borderGradientHeight = self.borderGradientHeight;
    
    copy.backgroundColor = [self.backgroundColor copyWithZone:zone];
    copy.bgFromColor = [self.bgFromColor copyWithZone:zone];
    copy.bgToColor = [self.bgToColor copyWithZone:zone];
    copy.borderGradientHeight = self.borderGradientHeight;
    
    copy.shadowColor = [self.shadowColor copyWithZone:zone];
    copy.shadowFromColor = [self.shadowFromColor copyWithZone:zone];
    copy.shadowToColor = [self.shadowToColor copyWithZone:zone];
    copy.shadowGradientHeight = self.shadowGradientHeight;

    copy.shadowOffset = self.shadowOffset;
    copy.shadowRadius = self.shadowRadius;
    copy.alpha = self.alpha;
    copy.bgImageName = [self.bgImageName copyWithZone:zone];
    copy.bgWidthPadding = self.bgWidthPadding;
    copy.bgHeightPadding = self.bgHeightPadding;
    copy.bgCenterXDelta = self.bgCenterXDelta;
    copy.bgCenterYDelta = self.bgCenterYDelta;
    copy.bgContentMode = self.bgContentMode;
    copy.borderRoundCorner = self.borderRoundCorner;
    copy.typoImageFilePath = [self.typoImageFilePath copyWithZone:zone];

    copy.bgTextAttributes = [self.bgTextAttributes copyWithZone:zone];

    return copy;
}



@end
