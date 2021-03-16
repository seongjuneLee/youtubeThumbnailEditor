//
//  DingoSmileTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/05.
//

#import "DinggoSmileTypo.h"

@implementation DinggoSmileTypo

-(id)init{
    self = [super init];
    if (self) {

        self.name = NSLocalizedString(@"일단 웃어~!!!",nil);
        self.fontName = @"BinggraeSamanco-Bold";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1] ;
        self.fontSize = TEXT_FONT_SIZE;
        self.bgImageName = @"DinggoTalkBox";
        self.bgHeightPadding = 10;        
        self.canChangeColor = true;
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 5;
        
        NSMutableArray *shadowAttributes = [self makeShadowWithColor:[UIColor colorWithRed:44/255.0f green:252/255.0f blue:220/255.0f alpha:1] fromOffset:CGPointMake(1, 1) toOffset:CGPointMake(2.4, 2.4)];
        
        [self.bgTextAttributes addObjectsFromArray:@[borderAtt]];
        [self.bgTextAttributes addObjectsFromArray:shadowAttributes];
        
    }
    return self;
}

+(DinggoSmileTypo*)dinggoSmileTypo{
    
    DinggoSmileTypo* dinggoSmileTypo = [[self alloc] init];
    return dinggoSmileTypo;
    
}

@end
