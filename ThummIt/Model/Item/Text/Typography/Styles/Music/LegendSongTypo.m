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
        self.name = NSLocalizedString(@"2020년 한해동안 많은 사랑을 받았던 명곡",nil);
        self.fontName = @"Cafe24Oneprettynight";
        self.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
        self.canChangeColor = true;
        self.obliqueValue = 0.0;
    }
    return self;
}

+(LegendSongTypo*)legendSongTypo{
    LegendSongTypo* legendSongTypo = [[self alloc] init];
    
    return legendSongTypo;
    
}

@end
