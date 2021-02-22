//
//  TikiTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "TikiTypo.h"

@implementation TikiTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"환상의 티키타카",nil);
        self.fontName = @"BMHANNA11yrsoldOTF";
        self.textColor = [UIColor whiteColor];
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 8;
        
        NSMutableArray *shadowAttributes = [self makeShadowWithColor:[UIColor blackColor] fromOffset:CGPointMake(3, 3) toOffset:CGPointMake(5, 5)];
        
        [self.bgTextAttributes addObjectsFromArray:@[borderAtt]];
        [self.bgTextAttributes addObjectsFromArray:shadowAttributes];
    }
    return self;
}

+(TikiTypo*) tikiTypo{
    
    TikiTypo* tikiTypo = [[self alloc] init];
    return tikiTypo;
    
}


@end
