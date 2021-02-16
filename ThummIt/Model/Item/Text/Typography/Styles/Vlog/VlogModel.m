//
//  VlogModel.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "VlogModel.h"

@implementation VlogModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"vlog2",nil);
        self.fontName = @"S-CoreDream-2ExtraLight";
        self.textColor = UIColor.whiteColor;
        self.fontSize = 100;
    }
    return self;
}

+(VlogModel *)vlogModel{
    VlogModel* vlogModel = [[self alloc] init];
    return vlogModel;
}

@end
