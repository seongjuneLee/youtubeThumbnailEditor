//
//  VlogStudentTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "VlogStudentTypo.h"

@implementation VlogStudentTypo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"복학생",nil);
        self.fontName = @"NanumSquareOTFEB";
        self.textColor = [UIColor colorWithRed:(224/255.0) green:(230/255.0) blue:(190/255.0) alpha:1];
        self.obliqueValue = 0.17;
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:1];
        
        bgTextAttribute1.borderWidth = 10;
        bgTextAttribute1.obliqueValue = 0.17;
        
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        
        attribute.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
                attribute.shadowOffset = CGPointMake(1, 1);
        attribute.obliqueValue = 0.17;
        
        
        self.bgTextAttributes = @[bgTextAttribute1,attribute];
    }
    return self;
}

+(VlogStudentTypo *)vlogStudentTypo{
    VlogStudentTypo* vlogStudentTypo = [[self alloc] init];
    return vlogStudentTypo;
}

@end
