//
//  DinggoBigEdit.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/05.
//

#import "DinggoBigEdit.h"

@implementation DinggoBigEdit

-(id)init{
    self = [super init];
    if (self) {

        self.name = NSLocalizedString(@"통편집을 피하는 법",nil);
        self.fontName = @"NEXONLv2GothicOTFBold";
        self.fontSize = 50;
        self.textFromColor = [UIColor colorWithRed:246/255.0 green:0/255.0 blue:27/255.0 alpha:1.0];
        self.textToColor = [UIColor colorWithRed:245/255.0 green:253/255.0 blue:27/255.0 alpha:1.0];
        NSDictionary *attr = @{NSFontAttributeName: [UIFont fontWithName:self.fontName size:self.fontSize]};
        CGSize stringBoundingBox = [@"통편집을 피하는 법" sizeWithAttributes:attr];
        self.textGradientHeight = stringBoundingBox.height + 7.8;

        self.textColor = [UIColor diagonalGradientFromColor:self.textFromColor toColor:self.textToColor withHeight:self.textGradientHeight];
        
        self.obliqueValue = 0.2;
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        BGTextAttribute *borderAtt1 = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 6;
        borderAtt1.borderColor = [UIColor whiteColor];
        borderAtt1.borderWidth = 14;
        borderAtt.obliqueValue = 0.2;
        borderAtt1.obliqueValue = 0.2;
        
        self.bgTextAttributes = @[borderAtt,borderAtt1];
        

    }
    return self;
}

+(DinggoBigEdit*)dinggoBigEdit{
    
    DinggoBigEdit* dinggoBigEdit = [[self alloc] init];
    return dinggoBigEdit;
    
}

@end
