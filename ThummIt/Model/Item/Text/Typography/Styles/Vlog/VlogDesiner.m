//
//  VlogDesiner.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "VlogDesiner.h"

@implementation VlogDesiner

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"디자이너",nil);
        self.fontName = @"AppleSDGothicNeo-UltraLight";
        self.textColor = [UIColor colorWithRed:(100/255.0) green:(29/255.0) blue:(60/255.0) alpha:1];
        self.fontSize = 100;
        
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        
        attribute.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
                attribute.shadowOffset = CGPointMake(2, 2);
        
        
        self.bgTextAttributes = @[attribute];
        
    }
    return self;

}

+(VlogDesiner *)vlogDesiner{
    VlogDesiner* vlogDesiner = [[self alloc] init];
    return vlogDesiner;
}


@end
