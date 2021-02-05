//
//  VlogVisitingCompanyTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "VlogVisitingCompanyTypo.h"

@implementation VlogVisitingCompanyTypo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"회사탐방 브이로그",nil);
        self.fontName = @"KOTRA_BOLD-Bold";
        self.textColor = UIColor.whiteColor;
        
    }
    return self;
}

+(VlogVisitingCompanyTypo *)vlogVisitingCompanyTypo{
    VlogVisitingCompanyTypo* vlogVisitingCompanyTypo = [[self alloc] init];
    return vlogVisitingCompanyTypo;
}

@end
