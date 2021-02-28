//
//  WorkManYoutube.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/02.
//

#import "WorkManYoutube.h"

@implementation WorkManYoutube

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@">> 유튜브",nil);
        self.fontName = @"BMDoHyeon-OTF";
        self.textColor = [UIColor colorWithRed:(20/255.0) green:(48/255.0) blue:(209/255.0) alpha:1] ;
        self.canChangeColor = true;
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor whiteColor];
        bgTextAttribute1.borderWidth = 5;
        
        self.bgTextAttributes = @[bgTextAttribute1];
    }
    return self;
}

+(WorkManYoutube *)workManYoutube{
    WorkManYoutube *workManYoutube = [[self alloc] init];
        return workManYoutube;
}

@end
