//
//  VlogStudy.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/29.
//

#import "VlogStudy.h"

@implementation VlogStudy

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"Study With Me",nil);
        self.fontName = @"Fraunces-9ptBlack";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
    }
    return self;
}

+(VlogStudy *)vlogStudy{
    VlogStudy* vlogStudy = [[self alloc] init];
    return vlogStudy;
}

@end
