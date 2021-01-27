//
//  WhyRealTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "WhyRealTypo.h"

@implementation WhyRealTypo


-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"아 왜 그래요 진짜!!!",nil);
        self.fontName = @"NanumGothicOTFBold";
        self.textColor = [UIColor whiteColor];
        self.fontSize = 30;
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        BGTextAttribute *shadowAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor colorWithRed:232/255.0 green:20/255.0 blue:27/255.0 alpha:1.0];
        borderAtt.borderWidth = 8;
        shadowAtt.shadowColor =[UIColor colorWithRed:109/255.0 green:13/255.0 blue:14/255.0 alpha:1.0];
        shadowAtt.shadowOffset = CGPointMake(3, 3);
        self.bgTextAttributes = @[borderAtt, shadowAtt];
        
        self.bgImageName = @"fireField";
        self.bgContentMode = UIViewContentModeScaleAspectFit;
        self.bgCenterYDelta = -5;
    }
    //기울이기,이미지위치 조정
    return self;
}

+(WhyRealTypo*) whyRealTypo{
    
    WhyRealTypo* whyRealTypo = [[self alloc] init];
    return whyRealTypo;
    
}



@end
