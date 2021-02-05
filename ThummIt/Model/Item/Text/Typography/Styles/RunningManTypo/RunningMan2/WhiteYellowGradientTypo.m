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
        self.textFromColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        self.textToColor = [UIColor colorWithRed:249/255.0 green:203/255.0 blue:50/255.0 alpha:1.0];
        NSDictionary *attr = @{NSFontAttributeName: [UIFont fontWithName:self.fontName size:self.fontSize]};
        CGSize stringBoundingBox = [@"애드립 모음집" sizeWithAttributes:attr];
        self.textGradientHeight = stringBoundingBox.height + 6;

        self.textColor = [UIColor diagonalGradientFromColor:self.textFromColor toColor:self.textToColor withHeight:self.textGradientHeight];
        self.cannotChangeColor = true;
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 5;
        
        BGTextAttribute *shadowAtt1 = [[BGTextAttribute alloc] init];
        shadowAtt1.shadowColor =[UIColor blackColor];
        shadowAtt1.shadowOffset = CGPointMake(1, 1);
        
        BGTextAttribute *shadowAtt2 = [[BGTextAttribute alloc] init];
        shadowAtt2.shadowColor =[UIColor blackColor];
        shadowAtt2.shadowOffset = CGPointMake(2, 2);
        
        BGTextAttribute *shadowAtt3 = [[BGTextAttribute alloc] init];
        shadowAtt3.shadowColor =[UIColor blackColor];
        shadowAtt3.shadowOffset = CGPointMake(3, 3);
        
        BGTextAttribute *shadowAtt4 = [[BGTextAttribute alloc] init];
        shadowAtt4.shadowColor =[UIColor blackColor];
        shadowAtt4.shadowOffset = CGPointMake(4, 4);
        
        BGTextAttribute *shadowAtt5 = [[BGTextAttribute alloc] init];
        shadowAtt5.shadowColor =[UIColor blackColor];
        shadowAtt5.shadowOffset = CGPointMake(5, 5);
        
        self.bgTextAttributes = @[borderAtt, shadowAtt1, shadowAtt2, shadowAtt3, shadowAtt4, shadowAtt5];
        
    }
    return self;
}

+(WhiteYellowGradientTypo*) whiteYellowGradientTypo{
    
    WhiteYellowGradientTypo* whiteYellowGradientTypo = [[self alloc] init];
    return whiteYellowGradientTypo;
    
}


@end
