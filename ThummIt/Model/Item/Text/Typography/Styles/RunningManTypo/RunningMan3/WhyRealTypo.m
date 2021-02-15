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
        self.name = NSLocalizedString(@"아 왜 그래요 진짜!!!",nil); //italic
        self.fontName = @"NanumGothicOTFBold";
        self.textColor = [UIColor whiteColor];
        self.bgImageName = @"fireField";
        self.bgHeightPadding = 30;
        self.obliqueValue = 0.25;
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor colorWithRed:232/255.0 green:20/255.0 blue:27/255.0 alpha:1.0];
        borderAtt.borderWidth = 8;
        borderAtt.obliqueValue = 0.25;
        
        BGTextAttribute *shadowAtt1 = [[BGTextAttribute alloc] init];
        shadowAtt1.shadowColor =[UIColor colorWithRed:109/255.0 green:13/255.0 blue:14/255.0 alpha:1.0];
        shadowAtt1.shadowOffset = CGPointMake(0.5, 0.5);
        shadowAtt1.obliqueValue = 0.25;
        
        BGTextAttribute *shadowAtt2 = [[BGTextAttribute alloc] init];
        shadowAtt2.shadowColor =[UIColor colorWithRed:109/255.0 green:13/255.0 blue:14/255.0 alpha:1.0];
        shadowAtt2.shadowOffset = CGPointMake(1, 1);
        shadowAtt2.obliqueValue = 0.25;
        
        BGTextAttribute *shadowAtt3 = [[BGTextAttribute alloc] init];
        shadowAtt3.shadowColor =[UIColor colorWithRed:109/255.0 green:13/255.0 blue:14/255.0 alpha:1.0];
        shadowAtt3.shadowOffset = CGPointMake(1.5, 1.5);
        shadowAtt3.obliqueValue = 0.25;
        
        BGTextAttribute *shadowAtt4 = [[BGTextAttribute alloc] init];
        shadowAtt4.shadowColor =[UIColor colorWithRed:109/255.0 green:13/255.0 blue:14/255.0 alpha:1.0];
        shadowAtt4.shadowOffset = CGPointMake(2, 2);
        shadowAtt4.obliqueValue = 0.25;
        
        BGTextAttribute *shadowAtt5 = [[BGTextAttribute alloc] init];
        shadowAtt5.shadowColor =[UIColor colorWithRed:109/255.0 green:13/255.0 blue:14/255.0 alpha:1.0];
        shadowAtt5.shadowOffset = CGPointMake(2.5, 2.5);
        shadowAtt5.obliqueValue = 0.25;
        
        BGTextAttribute *shadowAtt6 = [[BGTextAttribute alloc] init];
        shadowAtt6.shadowColor =[UIColor colorWithRed:109/255.0 green:13/255.0 blue:14/255.0 alpha:1.0];
        shadowAtt6.shadowOffset = CGPointMake(3, 3);
        shadowAtt6.obliqueValue = 0.25;
        
        self.bgTextAttributes = @[borderAtt, shadowAtt1, shadowAtt2, shadowAtt3, shadowAtt4, shadowAtt5, shadowAtt6];
        
    }
    
    return self;
}

+(WhyRealTypo*) whyRealTypo{
    
    WhyRealTypo* whyRealTypo = [[self alloc] init];
    return whyRealTypo;
    
}



@end
