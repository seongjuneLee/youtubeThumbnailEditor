//
//  VlogBarunGothicTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "VlogBarunGothicTypo.h"

@implementation VlogBarunGothicTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"Vlog",nil);
        self.fontName = @"NanumBarunGothicOTFBold";
        self.textColor = UIColor.whiteColor;
        self.fontSize = 40;
        
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.shadowOffset = CGPointMake(0, 0);
        attribute.shadowColor = UIColor.blackColor;
        attribute.shadowRadius = 3;
        self.bgTextAttributes = @[attribute];
    }
    return self;
}

+(VlogBarunGothicTypo*)vlogBarunGothicTypo{
    
    VlogBarunGothicTypo* vlogBarunGothicTypo = [[self alloc] init];
    return vlogBarunGothicTypo;
    
}


@end
