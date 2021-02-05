//
//  VlogTrip.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/29.
//

#import "VlogTrip.h"

@implementation VlogTrip

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"Vlog ",nil);
        self.fontName = @"OTRecipekoreaM";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
        
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.shadowOffset = CGPointMake(0, 0);
        attribute.shadowColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        attribute.shadowRadius = 1;
        self.bgTextAttributes = @[attribute];
        
        
    }
    return self;
}


+(VlogTrip *)vlogTrip{
    VlogTrip* vlogTrip = [[self alloc] init];
    return vlogTrip;
}

@end
