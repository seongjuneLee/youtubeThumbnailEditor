//
//  VlogMomTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "VlogMomTypo.h"

@implementation VlogMomTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"맘 Vlog",nil); //italic
        self.fontName = @"BMDoHyeon-OTF";
        self.textColor = [UIColor colorWithRed:246/255.0 green:101/255.0 blue:113/255.0 alpha:1];
        self.obliqueValue = 0.17;
        self.fontSize = 50;
        self.canChangeColor = true;
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.borderColor = UIColor.blackColor;
        attribute.borderWidth = 15;
        attribute.obliqueValue = 0.17;
        
        self.bgTextAttributes = @[attribute];
        
    }
    return self;
}

+(VlogMomTypo*)vlogMomTypo{
    
    VlogMomTypo* vlogMomTypo = [[self alloc] init];
    return vlogMomTypo;
    
}

@end
