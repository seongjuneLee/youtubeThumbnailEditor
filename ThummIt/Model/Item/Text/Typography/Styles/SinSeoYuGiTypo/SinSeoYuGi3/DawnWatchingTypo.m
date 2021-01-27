//
//  DawnWatchingTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "DawnWatchingTypo.h"

@implementation DawnWatchingTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"새벽 시청 금지!!!",nil);
        self.fontName = @"NotoSansKannada-Bold";
        self.fontSize = 50;
        self.textColor = [UIColor whiteColor];
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor blackColor];
        bgTextAttribute1.borderWidth = 10;
        
        self.bgTextAttributes = @[bgTextAttribute1];
        
        self.bgImageName = @"SeoYuGiFlame";
        self.bgContentMode = UIViewContentModeScaleAspectFit;
        self.bgCenterYDelta = -30;
    }
        //이미지 조정
    return self;
}

+(DawnWatchingTypo*) dawnWatchingTypo{
    
    DawnWatchingTypo* dawnWatchingTypo = [[self alloc] init];
    return dawnWatchingTypo;
    
}


@end
