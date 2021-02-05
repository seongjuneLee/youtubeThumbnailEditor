//
//  DingoSmileTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/05.
//

#import "DinggoSmileTypo.h"

@implementation DinggoSmileTypo

-(id)init{
    self = [super init];
    if (self) {

        self.name = NSLocalizedString(@"일단 웃어~!!!",nil);
        self.fontName = @"BinggraeSamanco-Bold";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1] ;
        self.fontSize = TEXT_FONT_SIZE;
        self.bgImageName = @"DinggoTalkBox";
        self.bgHeightPadding = 50;
        self.bgWidthPadding = 100;
        
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 5;
        
        BGTextAttribute *attribute1 = [[BGTextAttribute alloc] init];
        BGTextAttribute *attribute2 = [[BGTextAttribute alloc] init];
        
        attribute1.shadowColor = [UIColor colorWithRed:44/255.0 green:252/255.0 blue:220/255.0 alpha:1.0];
                attribute1.shadowOffset = CGPointMake(1, 1);
        
        attribute2.shadowColor = [UIColor colorWithRed:44/255.0 green:252/255.0 blue:220/255.0 alpha:1.0];
                attribute2.shadowOffset = CGPointMake(2, 2);
        
        self.bgTextAttributes = @[borderAtt,attribute1,attribute2];
    }
    return self;
}

+(DinggoSmileTypo*)dinggoSmileTypo{
    
    DinggoSmileTypo* dinggoSmileTypo = [[self alloc] init];
    return dinggoSmileTypo;
    
}

@end
