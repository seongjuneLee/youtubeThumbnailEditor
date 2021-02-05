//
//  DinggoPotatoTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/05.
//

#import "DinggoPotatoTypo.h"

@implementation DinggoPotatoTypo

-(id)init{
    self = [super init];
    if (self) {

        self.name = NSLocalizedString(@"(감자신)",nil);
        self.fontName = @"appleSDGothicNeo-Bold";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1] ;
        self.fontSize = TEXT_FONT_SIZE;
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        BGTextAttribute *bgTextAttribute2 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor blackColor];
        bgTextAttribute2.borderColor = [UIColor colorWithRed:(238/255.0) green:(200/255.0) blue:(87/255.0) alpha:1];
        bgTextAttribute1.borderWidth = 10;
        bgTextAttribute2.borderWidth = 16;
       
        self.bgTextAttributes = @[bgTextAttribute1 , bgTextAttribute2];
        
    }
    return self;
}

+(DinggoPotatoTypo*)dinggoPotatoTypo{
    
    DinggoPotatoTypo* dinggoPotatoTypo = [[self alloc] init];
    return dinggoPotatoTypo;
    
}


@end
