//
//  RedShountingTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "RedShoutingTypo.h"

@implementation RedShoutingTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"하고 싶은말 있는데\n해도 되나요?",nil); // italic
        self.fontName = @"BMYEONSUNG-OTF";
        self.textColor = UIColor.whiteColor;
        self.bgImageName = @"talkBalloon";
        self.bgHeightPadding = 70;
        self.bgWidthPadding = 70;
        
        BGTextAttribute *boldAtt = [[BGTextAttribute alloc] init];
        boldAtt.borderColor = [UIColor whiteColor];
        boldAtt.borderWidth = 2;
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 8;
        
        BGTextAttribute *shadowAtt1 = [[BGTextAttribute alloc] init];
        shadowAtt1.shadowColor =[UIColor blackColor];
        shadowAtt1.shadowOffset = CGPointMake(1, 1);
        
        BGTextAttribute *shadowAtt2 = [[BGTextAttribute alloc] init];
        shadowAtt2.shadowColor =[UIColor blackColor];
        shadowAtt2.shadowOffset = CGPointMake(1.5, 1.5);
        
        BGTextAttribute *shadowAtt3 = [[BGTextAttribute alloc] init];
        shadowAtt3.shadowColor =[UIColor blackColor];
        shadowAtt3.shadowOffset = CGPointMake(2, 2);
        
        BGTextAttribute *shadowAtt4 = [[BGTextAttribute alloc] init];
        shadowAtt4.shadowColor =[UIColor blackColor];
        shadowAtt4.shadowOffset = CGPointMake(2.5, 2.5);
        
        self.bgTextAttributes = @[boldAtt, borderAtt, shadowAtt1, shadowAtt2, shadowAtt3, shadowAtt4];
    }
    return self;
}

+(RedShoutingTypo*) redShoutingTypo{
    
    RedShoutingTypo* redShoutingTypo = [[self alloc] init];
    return redShoutingTypo;
    
}


@end
