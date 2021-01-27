//
//  BabarimanTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "BabarimanTypo.h"

@implementation BabarimanTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"상체 탈의한 썰.ssul",nil);
        self.fontName = @"ELANDNiceM";
        self.fontSize = 50;
        self.textColor = [UIColor whiteColor];
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        BGTextAttribute *bgTextAttribute2 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor colorWithRed:84/255.0f green:8/255.0f blue:8/255.0f alpha:1];
        bgTextAttribute2.borderColor = [UIColor colorWithRed:145/255.0f green:69/255.0f blue:34/255.0f alpha:1];
        bgTextAttribute1.borderWidth = 10;
        bgTextAttribute2.borderWidth = 18;
       
        self.bgTextAttributes = @[bgTextAttribute1 , bgTextAttribute2];
    }
    
    return self;
}

+(BabarimanTypo*) babarimanTypo{
    
    BabarimanTypo* babarimanTypo = [[self alloc] init];
    return babarimanTypo;
    
}

@end
