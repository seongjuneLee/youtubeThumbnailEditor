//
//  TikiTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "TikiTypo.h"

@implementation TikiTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"환상의 티키타카",nil);
        self.fontName = @"BMHANNA11yrsoldOTF";
        self.textColor = [UIColor whiteColor];
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 8;
        
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

+(TikiTypo*) tikiTypo{
    
    TikiTypo* tikiTypo = [[self alloc] init];
    return tikiTypo;
    
}


@end
