//
//  VlogSummer.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "VlogSummer.h"

@implementation VlogSummer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"C\nE\nB\nU",nil); //bold
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor colorWithRed:(235/255.0) green:(103/255.0) blue:(87/255.0) alpha:1];
        self.canChangeColor = true;
//        self.scale = 0.1;
    }
    return self;
}


+(VlogSummer *)vlogSummer{
    VlogSummer* vlogSummer = [[self alloc] init];
    return vlogSummer;
}
@end
