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
        self.textColor = [UIColor whiteColor];
        self.borderColor = [UIColor blackColor];
        BGTextAttribute * bgTextAttribute = [[BGTextAttribute alloc] init];
        bgTextAttribute.borderWidth = +5; //기능추가되면 구현
        self.fontSize = 30;
        self.bgImageName = @"SeoYuGiFlame";
        self.bgContentMode = UIViewContentModeScaleAspectFit;
        self.bgHeightPadding = 50;
        self.bgCenterYDelta = 0;
        
    }
 //대조작업필요
    
    return self;
}

+(DawnWatchingTypo*) dawnWatchingTypo{
    
    DawnWatchingTypo* dawnWatchingTypo = [[self alloc] init];
    return dawnWatchingTypo;
    
}


@end
