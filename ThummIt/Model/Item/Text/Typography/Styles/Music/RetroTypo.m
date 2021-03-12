//
//  RetroTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/12.
//

#import "RetroTypo.h"

@implementation RetroTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"RETRO",nil);
        self.fontName = @"RetroStereoWide";
        
        self.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"retroGC"]];
        self.textColorPatternImageName = @"retroGC";
        self.canChangeColor = true;
        self.obliqueValue = 0.0;
        self.fontInterval = 5.0;
        self.fontSize = 70;

    }
    return self;
}

+(RetroTypo *)retroTypo{
    RetroTypo *retroTypo = [[self alloc] init];
    return retroTypo;
    
}

@end
