//
//  BGTextAttribute.m
//  Vlogr
//
//  Created by iMac on 16/10/2019.
//  Copyright © 2019 TaejunLee. All rights reserved.
//

#import "BGTextAttribute.h"
#import <TTTAttributedLabel/TTTAttributedLabel.h>

@implementation BGTextAttribute

- (id)init {
    if (self) {
   
        self.offset = CGPointMake(0, 0);
        self.scale = 1;
        
        self.textColor = UIColor.whiteColor;
        self.borderColor = UIColor.clearColor;
        self.borderWidth = 0;
        
        self.shadowColor = UIColor.clearColor;
        self.shadowOffset = CGPointMake(0, 0);
        self.shadowRadius = 0;
        
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    
    //Encode properties, other class variables, etc
    [encoder encodeObject:[NSValue valueWithCGPoint:self.offset] forKey:@"offset"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.scale] forKey:@"scale"];
    if (!CGColorGetPattern(self.textColor.CGColor)) {
        [encoder encodeObject:self.textColor forKey:@"textColor"];
    } else {
        [encoder encodeObject:self.textColorPatternImageName forKey:@"textColorPatternImageName"];
    }
    [encoder encodeObject:self.borderColor forKey:@"borderColor"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.borderWidth] forKey:@"borderWidth"];
    [encoder encodeObject:self.shadowColor forKey:@"shadowColor"];
    [encoder encodeObject:[NSValue valueWithCGPoint:self.shadowOffset] forKey:@"shadowOffset"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.shadowRadius] forKey:@"shadowRadius"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.borderRadius] forKey:@"borderRadius"];
    
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        
        self.offset = [[decoder decodeObjectForKey:@"offset"] CGPointValue];
        self.scale = [[decoder decodeObjectForKey:@"scale"] floatValue];
        self.textColor = [decoder decodeObjectForKey:@"textColor"];
        self.textColorPatternImageName = [decoder decodeObjectForKey:@"textColorPatternImageName"];
        if (self.textColorPatternImageName) {
            self.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:self.textColorPatternImageName]];
        }
        self.borderColor = [decoder decodeObjectForKey:@"borderColor"];
        self.borderWidth = [[decoder decodeObjectForKey:@"borderWidth"] floatValue];
        self.shadowColor = [decoder decodeObjectForKey:@"shadowColor"];
        self.shadowOffset = [[decoder decodeObjectForKey:@"shadowOffset"] CGPointValue];
        self.shadowRadius = [[decoder decodeObjectForKey:@"shadowRadius"] floatValue];
        self.borderRadius = [[decoder decodeObjectForKey:@"borderRadius"] floatValue];
        
    }
    return self;
}


-(id)copyWithZone:(NSZone *)zone{
    
    BGTextAttribute *copy = [[BGTextAttribute allocWithZone: zone] init];
    
    copy.offset = self.offset;
    copy.scale = self.scale;
    copy.textColor = [self.textColor copyWithZone:zone];
    copy.textColorPatternImageName = [self.textColorPatternImageName copyWithZone:zone];
    copy.borderColor = [self.borderColor copyWithZone:zone];
    copy.borderWidth = self.borderWidth;
    copy.shadowColor = [self.shadowColor copyWithZone:zone];
    copy.shadowOffset = self.shadowOffset;
    copy.shadowRadius = self.shadowRadius;
    copy.borderRadius = self.borderRadius;
    
    return copy;
}

-(NSMutableAttributedString*)toAttributedStringWithText:(NSString*)text{
    return [self getAttributedText:text];
}

- (NSMutableAttributedString *)getAttributedText:(NSString*)text{

    if (text == nil || [text isEqualToString:@""]){
        text = RANDOM_TEXT;
    }
    
    NSMutableAttributedString* mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSRange range = NSMakeRange(0, text.length);
    // attributedString에 여러 속성 설정
    [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:self.textColor range:range];
    [mutableAttributedString addAttribute:NSStrokeColorAttributeName value:self.borderColor range:range];
    [mutableAttributedString addAttribute:NSStrokeWidthAttributeName value:@(self.borderWidth) range:range];
    
    NSShadow* shadow = [[NSShadow alloc] init];
    shadow.shadowColor = self.shadowColor;
    shadow.shadowOffset = CGSizeMake(self.shadowOffset.x,self.shadowOffset.y);
    shadow.shadowBlurRadius = self.shadowRadius;
    [mutableAttributedString addAttribute:NSShadowAttributeName value:shadow range:range];

    [mutableAttributedString.mutableString replaceOccurrencesOfString:RANDOM_TEXT withString:@"" options:NSCaseInsensitiveSearch range:range];
    
    return mutableAttributedString;

}

@end
