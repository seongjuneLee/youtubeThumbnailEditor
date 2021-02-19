//
//  SeoYuGiDawnWatchingTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "SeoYuGiDawnWatchingTypo.h"

@implementation SeoYuGiDawnWatchingTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"새벽 시청 금지!!!",nil);
        self.fontName = @"NotoSansKannada-Bold";
        self.bgImageName = @"seoYuGiFlame";
        self.textColor = [UIColor whiteColor];
        self.bgHeightPadding = 290;
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor whiteColor];
        bgTextAttribute1.borderWidth = 2;
        
        BGTextAttribute *bgTextAttribute2 = [[BGTextAttribute alloc] init];
        bgTextAttribute2.borderColor = [UIColor blackColor];
        bgTextAttribute2.borderWidth = 21;
        
        self.bgTextAttributes = @[bgTextAttribute1, bgTextAttribute2];
        
    }
    
    return self;
}

+(SeoYuGiDawnWatchingTypo*) seoYuGiDawnWatchingTypo{
    
    SeoYuGiDawnWatchingTypo* seoYuGiDawnWatchingTypo = [[self alloc] init];
    return seoYuGiDawnWatchingTypo;
    
}


@end
