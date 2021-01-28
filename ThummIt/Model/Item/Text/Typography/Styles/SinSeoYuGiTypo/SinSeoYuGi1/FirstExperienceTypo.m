//
//  FirstExperienceTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "FirstExperienceTypo.h"

@implementation FirstExperienceTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"첫 경험!",nil);
        self.fontName = @"NotoSansKannada-Bold";
        self.fontSize = 50;
        self.textColor = [UIColor colorWithRed:253/255.0f green:242/255.0f blue:95/255.0 alpha:1 ];
       
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        BGTextAttribute *shadowAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor colorWithRed:133/255.0f green:54/255.0f blue:16/255.0f alpha:1];
        borderAtt.borderWidth = 10;
        shadowAtt.shadowColor =[UIColor colorWithRed:208/255.0f green:68/255.0f blue:25/255.0f alpha:1];
        shadowAtt.shadowOffset = CGPointMake(3, 3);
        
        self.bgTextAttributes = @[borderAtt, shadowAtt];
    }
        //기울이기
    return self;
}

+(FirstExperienceTypo*) firstExperienceTypo{
    
    FirstExperienceTypo* firstExperienceTypo = [[self alloc] init];
    return firstExperienceTypo;
    
}
@end
