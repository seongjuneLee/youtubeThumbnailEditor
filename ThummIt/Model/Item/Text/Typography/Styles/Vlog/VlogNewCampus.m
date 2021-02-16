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
        self.name = NSLocalizedString(@"Thmm-log",nil);
        self.fontName = @"SangSangAnt";
        self.textColor = [UIColor colorWithRed:(219.0/255.0) green:(236.0/255.0) blue:(166.0/255.0) alpha:1];
        self.fontSize = 100;
        
    }
    return self;
}


+(VlogNewCampus *)vlogNewCampus{
    VlogNewCampus* vlogNewCampus = [[self alloc] init];
    return vlogNewCampus;
}
@end
