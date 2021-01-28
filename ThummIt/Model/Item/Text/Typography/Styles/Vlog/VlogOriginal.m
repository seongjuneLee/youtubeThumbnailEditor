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
        self.name = NSLocalizedString(@"youtube originals ",nil);
        self.fontName = @"Swagger";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
        self.fontSize = 40;

    }
    return self;
}


+(VlogOriginal *)vlogOriginal{
    VlogOriginal* vlogOriginal = [[self alloc] init];
    return vlogOriginal;
}

@end
