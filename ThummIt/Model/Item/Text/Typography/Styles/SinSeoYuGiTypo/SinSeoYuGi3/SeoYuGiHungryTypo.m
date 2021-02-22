//
//  SeoYuGiHungryTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "SeoYuGiHungryTypo.h"

@implementation SeoYuGiHungryTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"공복 주의",nil);
        self.fontName = @"BMDoHyeon-OTF";
        self.textColor = [UIColor colorWithRed:249/255.0f green:34/255.0f blue:42/255.0 alpha:1 ];
        self.fontSize = TEXT_FONT_SIZE;
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 12;

        NSMutableArray *shadowAttributes = [self makeShadowWithColor:[UIColor colorWithRed:50/255.0f green:50/255.0f blue:50/255.0f alpha:1] fromOffset:CGPointMake(4, 4) toOffset:CGPointMake(7, 5)];
        [self.bgTextAttributes addObject:borderAtt];
        [self.bgTextAttributes addObjectsFromArray:shadowAttributes];
    }
    
    return self;
}

+(SeoYuGiHungryTypo*) seoYuGiHungryTypo{
    
    SeoYuGiHungryTypo* seoYuGiHungryTypo = [[self alloc] init];
    return seoYuGiHungryTypo;
    
}

@end
