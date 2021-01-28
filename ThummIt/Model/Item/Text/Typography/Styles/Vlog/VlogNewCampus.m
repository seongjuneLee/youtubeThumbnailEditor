//
//  VlogNewCampus.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "VlogNewCampus.h"

@implementation VlogNewCampus

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"새내기의",nil);
        self.fontName = @"SangSangAnt";
        self.textColor = [UIColor colorWithRed:(219/255.0) green:(236/255.0) blue:(166/255.0) alpha:1];
        self.fontSize = 30;
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor colorWithRed:114/255.0f green:145/255.0f blue:72/255.0f alpha:1];
        
        bgTextAttribute1.borderWidth = 10;
        
        
        self.bgTextAttributes = @[bgTextAttribute1];
    }
    return self;
}


+(VlogNewCampus *)vlogNewCampus{
    VlogNewCampus* vlogNewCampus = [[self alloc] init];
    return vlogNewCampus;
}
@end