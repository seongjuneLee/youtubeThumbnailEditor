//
//  digitalTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/05.
//

#import "DigitalTypo.h"

@implementation DigitalTypo

-(id)init{
    self = [super init];
    if (self) {

        self.name = NSLocalizedString(@"케이팝",nil);
        self.fontName = @"NeoDunggeunmoPro-Regular";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1] ;
        self.fontSize = TEXT_FONT_SIZE;
        self.bgHeightPadding = -26;
        self.bgWidthPadding = -50;
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor blackColor];
       
        bgTextAttribute1.borderWidth = 6;
       
        
        self.bgTextAttributes = @[bgTextAttribute1];

        
    }
    return self;
}

+(DigitalTypo*)digitalTypo{
    
    DigitalTypo* digitalTypo = [[self alloc] init];
    return digitalTypo;
    
}


@end
