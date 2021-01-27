//
//  WorkManLogo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WorkManLogo.h"

@implementation WorkManLogo

-(id)init{
    self = [super init];
    if (self) {

        self.name = NSLocalizedString(@"워크맨",nil);
        self.fontName = @"BMDoHyeon-OTF";
        self.textColor = [UIColor colorWithRed:(181/255.0) green:(217/255.0) blue:(255/255.0) alpha:1] ;
        self.borderColor = [UIColor yellowColor];
        self.fontSize = TEXT_FONT_SIZE;
    }
    return self;
}

+(WorkManLogo*)workManLogo{
    
    WorkManLogo* workManLogo = [[self alloc] init];
    return workManLogo;
    
}

@end
