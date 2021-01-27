//
//  WorkManLogo2.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "WorkManLogo2.h"

@implementation WorkManLogo2

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"워크맨",nil);
        self.fontName = @"BMDoHyeon-OTF";
        self.textColor = [UIColor colorWithRed:(20/255.0) green:(48/255.0) blue:(209/255.0) alpha:1] ;
        self.fontSize = 25;
    }
    return self;
}

+(WorkManLogo2 *)workManLogo2{
    WorkManLogo2 *workManLogo2 = [[self alloc] init];
        return workManLogo2;
}


@end
