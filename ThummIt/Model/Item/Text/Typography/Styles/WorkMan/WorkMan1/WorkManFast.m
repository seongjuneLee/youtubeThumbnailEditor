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
        self.fontName = @"NanumSquareOTFB";
        self.textColor = [UIColor whiteColor];
        self.fontSize = 35;
    
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor blackColor];
        bgTextAttribute1.borderWidth = 5;
        
        BGTextAttribute *attribute1 = [[BGTextAttribute alloc] init];
        BGTextAttribute *attribute2 = [[BGTextAttribute alloc] init];
        BGTextAttribute *attribute3 = [[BGTextAttribute alloc] init];
        BGTextAttribute *attribute4 = [[BGTextAttribute alloc] init];
        BGTextAttribute *attribute5 = [[BGTextAttribute alloc] init];
        
        attribute1.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
                attribute1.shadowOffset = CGPointMake(1, 1);
        
        attribute2.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
                attribute2.shadowOffset = CGPointMake(2, 2);
        
        attribute3.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
//                attribute3.shadowOffset = CGPointMake(3, 3);
//
//        attribute4.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
//                attribute4.shadowOffset = CGPointMake(4, 4);
//
//        attribute5.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
//                attribute5.shadowOffset = CGPointMake(5, 5);
//
        
        self.bgTextAttributes = @[bgTextAttribute1,attribute1,attribute2,attribute3];
        
        

    }
    return self;
}

+(WorkManFast *)workManFast{
    WorkManFast *workManFast = [[self alloc] init];
    return workManFast;
}


@end
