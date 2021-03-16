//
//  YellowGradientTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "YellowGradientTypo.h"

@implementation YellowGradientTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"랜덤게임.zip",nil);
        self.fontName = @"BMDoHyeon-OTF";
        self.textFromColor = [UIColor colorWithRed:248/255.0 green:233/255.0 blue:104/255.0 alpha:1.0];
        self.textToColor = [UIColor colorWithRed:233/255.0 green:174/255.0 blue:83/255.0 alpha:1.0];
        self.fontSize = 60;
        NSDictionary *attr = @{NSFontAttributeName: [UIFont fontWithName:self.fontName size:self.fontSize]};
        CGSize stringBoundingBox = [@"랜덤게임.zip" sizeWithAttributes:attr];
        
        self.textGradientHeight = stringBoundingBox.height + 15;

        self.textColor = [UIColor diagonalGradientFromColor:self.textFromColor toColor:self.textToColor withHeight:self.textGradientHeight];
        
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 5;
        
        NSMutableArray *shadowAttributes = [self makeShadowWithColor:[UIColor colorWithRed:90/255.0f green:4/255.0f blue:8/255.0f alpha:1] fromOffset:CGPointMake(2, 2) toOffset:CGPointMake(6, 6)];
        
        [self.bgTextAttributes addObjectsFromArray:@[borderAtt]];
        [self.bgTextAttributes addObjectsFromArray:shadowAttributes];
    }
    return self;
}

+(YellowGradientTypo*) yellowGradientTypo{
    
    YellowGradientTypo* yellowGradientTypo = [[self alloc] init];
    return yellowGradientTypo;
    
}


@end
