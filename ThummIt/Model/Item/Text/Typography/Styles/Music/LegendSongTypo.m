//
//  LegendSongTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "LegendSongTypo.h"

@implementation LegendSongTypo


-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"2020년 한해",nil);
        self.fontName = @"Cafe24Oneprettynight";
        self.textColor = [UIColor whiteColor];
        self.canChangeColor = true;
        
        BGTextAttribute *shadow = [[BGTextAttribute alloc] init];
        shadow.shadowOffset = CGPointMake(3, 3);
        shadow.shadowColor = [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1.0];
        
        self.bgTextAttributes = @[shadow];

    }
    return self;
}

+(LegendSongTypo*)legendSongTypo{
    LegendSongTypo* legendSongTypo = [[self alloc] init];
    
    return legendSongTypo;
    
}

@end
