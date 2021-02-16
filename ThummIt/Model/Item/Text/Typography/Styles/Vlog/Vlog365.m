//
//  Vlog365.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/29.
//

#import "Vlog365.h"

@implementation Vlog365

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"D-365 ",nil);
        self.fontName = @"NeoDunggeunmoPro-Regular";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
        self.fontSize = 80;
    }
    return self;
}

+(Vlog365 *)vlog365{
    Vlog365* vlog365 = [[self alloc] init];
    return vlog365;
}

@end
