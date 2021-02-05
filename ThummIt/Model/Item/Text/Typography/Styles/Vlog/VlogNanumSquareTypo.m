//
//  VlogNanumSquareTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/29.
//

#import "VlogNanumSquareTypo.h"

@implementation VlogNanumSquareTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"Square",nil);
        self.fontName = @"NanumSquareOTFEB";
        self.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];

        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.shadowOffset = CGPointMake(0, 0);
        attribute.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
        attribute.shadowRadius = 5;
        
        self.bgTextAttributes = @[attribute];
    }
    return self;
}

+(VlogNanumSquareTypo*)vlogNanumSquareTypo{
    
    VlogNanumSquareTypo* vlogNanumSquareTypo = [[self alloc] init];
    return vlogNanumSquareTypo;
    
}

@end
