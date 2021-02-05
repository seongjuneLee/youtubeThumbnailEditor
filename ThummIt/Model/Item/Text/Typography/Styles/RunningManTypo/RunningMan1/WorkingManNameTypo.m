//
//  WorkingManNameTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WorkingManNameTypo.h"

@implementation WorkingManNameTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"블루문",nil);
        self.fontName = @"BMDoHyeon-OTF";
        self.textColor = [UIColor colorWithRed:39/255.0 green:238/255.0 blue:244/255.0 alpha:1.0];
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 7;
        self.bgTextAttributes = @[borderAtt];
      
    }
    return self;
}

+(WorkingManNameTypo*) workingManNameTypo{
    
    WorkingManNameTypo* workingManNameTypo = [[self alloc] init];
    return workingManNameTypo;
    
}


@end
