//
//  DinggoStarWarsTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/05.
//

#import "DinggoStarWarsTypo.h"

@implementation DinggoStarWarsTypo

-(id)init{
    self = [super init];
    if (self) {

        self.name = NSLocalizedString(@"스타월드",nil);
        self.fontName = @"BMDoHyeon-OTF";
        self.fontSize = TEXT_FONT_SIZE;
        self.textFromColor = [UIColor colorWithRed:251/255.0 green:203/255.0 blue:46/255.0 alpha:1.0];
        self.textToColor = [UIColor colorWithRed:253/255.0 green:245/255.0 blue:54/255.0 alpha:1.0];
        NSDictionary *attr = @{NSFontAttributeName: [UIFont fontWithName:self.fontName size:self.fontSize]};
        CGSize stringBoundingBox = [@"스타월드" sizeWithAttributes:attr];
        self.textGradientHeight = stringBoundingBox.height + 6;

        self.textColor = [UIColor diagonalGradientFromColor:self.textFromColor toColor:self.textToColor withHeight:self.textGradientHeight];
        self.cannotChangeColor = true;
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 5;
        
        
        self.bgTextAttributes = @[borderAtt];;
    }
    return self;
}

+(DinggoStarWarsTypo*)dinggoStarWarsTypo{
    
    DinggoStarWarsTypo* dinggoStarWarsTypo = [[self alloc] init];
    return dinggoStarWarsTypo;
    
}


@end
