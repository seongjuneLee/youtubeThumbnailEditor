//
//  VlogDog.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "VlogDog.h"

@implementation VlogDog


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"vlog3",nil);
        self.fontName = @"NotoSansMyanmar-Regular";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
        self.fontSize = 30;
        
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.shadowOffset = CGPointMake(0, 0);
        attribute.shadowColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        attribute.shadowRadius = 3;
        self.bgTextAttributes = @[attribute];
    }
    return self;
}


+(VlogDog *)vlogDog{
    VlogDog* vlogDog = [[self alloc] init];
    return vlogDog;
}

@end
