//
//  WorkManFirstTitle.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WorkManRedTitle.h"

@implementation WorkManRedTitle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"행사비",nil);
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor colorWithRed:(204/255.0) green:(22/255.0) blue:(29/255.0) alpha:(1)];
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        BGTextAttribute *bgTextAttribute2 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor whiteColor];
        bgTextAttribute2.borderColor = [UIColor blackColor];
        bgTextAttribute1.borderWidth = 10;
        bgTextAttribute2.borderWidth = 16;
       
        self.bgTextAttributes = @[bgTextAttribute1 , bgTextAttribute2];
        
        
    }
    return self;
}

+(WorkManRedTitle *)workManRedTitle{
    WorkManRedTitle *workManRedTitle = [[self alloc] init];
    return workManRedTitle;
}

@end
