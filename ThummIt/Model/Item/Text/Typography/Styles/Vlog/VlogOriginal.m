//
//  VlogOriginal.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "VlogOriginal.h"

@implementation VlogOriginal

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"YouTube Originals",nil);
        self.fontName = @"Swagger";
        self.textColor = UIColor.whiteColor;

    }
    return self;
}

+(VlogOriginal *)vlogOriginal{
    VlogOriginal* vlogOriginal = [[self alloc] init];
    return vlogOriginal;
}

@end
