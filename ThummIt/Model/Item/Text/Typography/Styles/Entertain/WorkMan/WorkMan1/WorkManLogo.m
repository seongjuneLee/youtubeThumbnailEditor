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

        self.name = NSLocalizedString(@"위크맨",nil);
        self.fontName = @"BMDoHyeon-OTF";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(0/255.0) blue:(0/255.0) alpha:1] ;
        self.fontSize = 80;
        self.canChangeColor = true;
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor colorWithRed:255/255.0f green:248/255.0f blue:61/255.0f alpha:1];
        
        bgTextAttribute1.borderWidth = 12;
        
        
        self.bgTextAttributes = @[bgTextAttribute1];
    }
    return self;
}

+(WorkManLogo*)workManLogo{
    
    WorkManLogo* workManLogo = [[self alloc] init];
    return workManLogo;
    
}

@end
