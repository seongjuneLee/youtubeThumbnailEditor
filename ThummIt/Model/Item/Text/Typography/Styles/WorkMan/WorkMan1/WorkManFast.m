//
//  WorkManFast.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/29.
//

#import "WorkManFast.h"

@implementation WorkManFast

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"끌어내려 빨리!!",nil);
        self.fontName = @"NanumSquareOTFEB";
        self.textColor = UIColor.whiteColor;
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = UIColor.blackColor;
        bgTextAttribute1.borderWidth = 8;
    
        BGTextAttribute *shadowAtt = [[BGTextAttribute alloc] init];
        shadowAtt.shadowColor = UIColor.blackColor;
        shadowAtt.shadowOffset = CGPointMake(1.5, 1.5);
        
        self.bgTextAttributes = @[bgTextAttribute1, shadowAtt];
        
    }
    return self;
}

+(WorkManFast *)workManFast{
    WorkManFast *workManFast = [[self alloc] init];
    return workManFast;
}


@end
