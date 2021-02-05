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
        self.textColor = [UIColor whiteColor];    
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor blackColor];
        bgTextAttribute1.borderWidth = 5;
        
        BGTextAttribute *attribute1 = [[BGTextAttribute alloc] init];
        BGTextAttribute *attribute2 = [[BGTextAttribute alloc] init];
        
        attribute1.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
                attribute1.shadowOffset = CGPointMake(1, 1);
        
        attribute2.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
                attribute2.shadowOffset = CGPointMake(2, 2);
        
        self.bgTextAttributes = @[bgTextAttribute1,attribute1,attribute2];
        
        

    }
    return self;
}

+(WorkManFast *)workManFast{
    WorkManFast *workManFast = [[self alloc] init];
    return workManFast;
}


@end
