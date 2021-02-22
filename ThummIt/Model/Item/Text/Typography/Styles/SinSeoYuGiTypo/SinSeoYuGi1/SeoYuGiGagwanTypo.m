//
//  SeoYuGiGagwanTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "SeoYuGiGagwanTypo.h"

@implementation SeoYuGiGagwanTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"가관이네..",nil);
        self.fontName = @"NotoSansKannada-Bold";
        self.textColor = [UIColor colorWithRed:253/255.0f green:242/255.0f blue:95/255.0 alpha:1];
        self.obliqueValue = 0.18;
        self.fontSize = 80;

        
        BGTextAttribute *borderAtt1 = [[BGTextAttribute alloc] init];
        borderAtt1.borderColor = [UIColor colorWithRed:253/255.0f green:242/255.0f blue:95/255.0 alpha:1];
        borderAtt1.borderWidth = 2;
        borderAtt1.obliqueValue = 0.18;
        
        BGTextAttribute *borderAtt2 = [[BGTextAttribute alloc] init];
        borderAtt2.borderColor = [UIColor colorWithRed:133/255.0f green:54/255.0f blue:16/255.0f alpha:1];
        borderAtt2.borderWidth = 14;
        borderAtt2.obliqueValue = 0.18;
                
        NSMutableArray *shadowAttributes = [self makeShadowWithColor:[UIColor colorWithRed:208/255.0f green:68/255.0f blue:52/255.0f alpha:1] fromOffset:CGPointMake(4, 4) toOffset:CGPointMake(9, 9)];
        
        [self.bgTextAttributes addObjectsFromArray:@[borderAtt1, borderAtt2]];
        [self.bgTextAttributes addObjectsFromArray:shadowAttributes];
    }
        //기울이기
    return self;
}

+(SeoYuGiGagwanTypo*) seoYuGiGagwanTypo{
    
    SeoYuGiGagwanTypo* seoYuGiGagwanTypo = [[self alloc] init];
    return seoYuGiGagwanTypo;
    
}
@end
