//
//  WhiteYellowGradientTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WhiteYellowGradientTypo.h"

@implementation WhiteYellowGradientTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"애드립 모음집",nil);
        self.fontName = @"BMHANNA11yrsoldOTF";
        self.fontSize = 50;
        self.textFromColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        self.textToColor = [UIColor colorWithRed:249/255.0 green:203/255.0 blue:50/255.0 alpha:1.0];
        NSDictionary *attr = @{NSFontAttributeName: [UIFont fontWithName:self.fontName size:self.fontSize]};
        CGSize stringBoundingBox = [@"애드립 모음집" sizeWithAttributes:attr];
        self.textGradientHeight = stringBoundingBox.height + 6;

        self.textColor = [UIColor diagonalGradientFromColor:self.textFromColor toColor:self.textToColor withHeight:self.textGradientHeight];
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        BGTextAttribute *shadowAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 8;
        shadowAtt.shadowColor =[UIColor blackColor];
        shadowAtt.shadowOffset = CGPointMake(5, 5);
        shadowAtt.shadowRadius = 2.0;
        self.bgTextAttributes = @[borderAtt, shadowAtt];
    }
    return self;
}

+(WhiteYellowGradientTypo*) whiteYellowGradientTypo{
    
    WhiteYellowGradientTypo* whiteYellowGradientTypo = [[self alloc] init];
    return whiteYellowGradientTypo;
    
}


@end
