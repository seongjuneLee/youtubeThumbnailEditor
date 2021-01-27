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
        
        self.name = NSLocalizedString(@"하고 싶은말 있는데 \n 해도 되나요?",nil);
        self.fontName = @"BMYEONSUNG-OTF";
        self.fontSize = 50;
        self.textColor = [UIColor whiteColor];
        self.shadowColor = [UIColor blackColor];
        self.shadowOffset = CGSizeMake(5, 5);
        self.bgImageName = @"talkBalloon";
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        BGTextAttribute *shadowAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 10;
        shadowAtt.shadowColor =[UIColor blackColor];
        shadowAtt.shadowOffset = CGPointMake(3, 3);
        
        self.bgTextAttributes = @[borderAtt, shadowAtt];
       //기울이기 필요
    }
    return self;
}

+(RedShoutingTypo*) redShoutingTypo{
    
    RedShoutingTypo* redShoutingTypo = [[self alloc] init];
    return redShoutingTypo;
    
}


@end
