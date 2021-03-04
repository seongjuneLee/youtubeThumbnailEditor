//
//  DinggoBehindTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/05.
//

#import "DinggoBehindTypo.h"

@implementation DinggoBehindTypo

-(id)init{
    self = [super init];
    if (self) {

        self.name = NSLocalizedString(@"[비하인드]",nil);
        self.fontName = @"NeoDunggeunmoPro-Regular";
        self.textColor = [UIColor colorWithRed:(249/255.0) green:(242/255.0) blue:(84/255.0) alpha:1] ;
        self.fontSize = 50;
        self.obliqueValue = 0.18;
        self.canChangeColor = true;
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor blackColor];
       
        bgTextAttribute1.borderWidth = 7;
        bgTextAttribute1.obliqueValue = 0.18;
        
        
        
        self.bgTextAttributes = @[bgTextAttribute1];

        
    }
    return self;
}

+(DinggoBehindTypo*)dinggoBehindTypo{
    
    DinggoBehindTypo* dinggoBehindTypo = [[self alloc] init];
    return dinggoBehindTypo;
    
}

@end
