//
//  YellowGradientTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "YellowGradientTypo.h"

@implementation YellowGradientTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"랜덤게임.zip",nil);
        self.fontName = @"BMDoHyeon-OTF";
        self.fontSize = TEXT_FONT_SIZE;
        self.textFromColor = [UIColor colorWithRed:248/255.0 green:233/255.0 blue:104/255.0 alpha:1.0];
        self.textToColor = [UIColor colorWithRed:233/255.0 green:174/255.0 blue:83/255.0 alpha:1.0];
        NSDictionary *attr = @{NSFontAttributeName: [UIFont fontWithName:self.fontName size:self.fontSize]};
        CGSize stringBoundingBox = [@"랜덤게임.zip" sizeWithAttributes:attr];
        self.textGradientHeight = stringBoundingBox.height + 15;

        self.textColor = [UIColor diagonalGradientFromColor:self.textFromColor toColor:self.textToColor withHeight:self.textGradientHeight];
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 5;
        
        BGTextAttribute *shadowAtt1 = [[BGTextAttribute alloc] init];
        shadowAtt1.shadowColor =[UIColor colorWithRed:90/255.0 green:4/255.0 blue:8/255.0 alpha:1.0];
        shadowAtt1.shadowOffset = CGPointMake(1, 1);
        
        BGTextAttribute *shadowAtt2 = [[BGTextAttribute alloc] init];
        shadowAtt2.shadowColor =[UIColor colorWithRed:90/255.0 green:4/255.0 blue:8/255.0 alpha:1.0];
        shadowAtt2.shadowOffset = CGPointMake(1.5, 1.5);
        
        BGTextAttribute *shadowAtt3 = [[BGTextAttribute alloc] init];
        shadowAtt3.shadowColor =[UIColor colorWithRed:90/255.0 green:4/255.0 blue:8/255.0 alpha:1.0];
        shadowAtt3.shadowOffset = CGPointMake(2, 2);
        
        BGTextAttribute *shadowAtt4 = [[BGTextAttribute alloc] init];
        shadowAtt4.shadowColor =[UIColor colorWithRed:90/255.0 green:4/255.0 blue:8/255.0 alpha:1.0];
        shadowAtt4.shadowOffset = CGPointMake(2.5, 2.5);
        
        BGTextAttribute *shadowAtt5 = [[BGTextAttribute alloc] init];
        shadowAtt5.shadowColor =[UIColor colorWithRed:90/255.0 green:4/255.0 blue:8/255.0 alpha:1.0];
        shadowAtt5.shadowOffset = CGPointMake(3, 3);
        
        self.bgTextAttributes = @[borderAtt, shadowAtt1, shadowAtt2, shadowAtt3, shadowAtt4, shadowAtt5];
    }
    return self;
}

+(YellowGradientTypo*) yellowGradientTypo{
    
    YellowGradientTypo* yellowGradientTypo = [[self alloc] init];
    return yellowGradientTypo;
    
}


@end
