//
//  VlogWebWrite.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "VlogWebWrite.h"

@implementation VlogWebWrite

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"웹 디자이너편",nil);
        self.fontName = @"BMJUAOTF";
        self.textColor = [UIColor colorWithRed:(217/255.0) green:(191/255.0) blue:(252/255.0) alpha:1];
        self.bgImageName = @"webBG.png";
        self.bgHeightPadding = 0;
        self.bgWidthPadding = -20;
    }
    return self;
}

+(VlogWebWrite *)vlogWebWrite{
    VlogWebWrite* vlogWebWrite = [[self alloc] init];
    return vlogWebWrite;
}

@end
