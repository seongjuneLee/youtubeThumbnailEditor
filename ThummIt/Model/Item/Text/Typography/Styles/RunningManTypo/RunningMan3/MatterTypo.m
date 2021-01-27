//
//  MatterTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "MatterTypo.h"

@implementation MatterTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"문제를 듣고",nil);
        self.fontName = @"NanumSquareOTFEB";
        self.fontSize = 50;
        self.textColor = [UIColor whiteColor];
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 10;
        self.bgTextAttributes = @[borderAtt];
    }
    return self;
}

+(MatterTypo*) matterTypo{
    
    MatterTypo* matterTypo = [[self alloc] init];
    return matterTypo;
    
}
@end
