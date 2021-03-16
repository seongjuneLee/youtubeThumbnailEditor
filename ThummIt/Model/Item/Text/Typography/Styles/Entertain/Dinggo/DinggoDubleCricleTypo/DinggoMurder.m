//
//  DinggoMurder.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/05.
//

#import "DinggoMurder.h"

@implementation DinggoMurder

-(id)init{
    self = [super init];
    if (self) {

        self.name = NSLocalizedString(@"살인미소?!",nil);
        self.fontName = @"NeoDunggeunmoPro-Regular";
        self.textColor = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:1] ;
        self.fontSize = 100;
        self.canChangeColor = true;
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor colorWithRed:(249/255.0) green:(242/255.0) blue:(84/255.0) alpha:1];
       
        bgTextAttribute1.borderWidth = 12;
       
        
        self.bgTextAttributes = @[bgTextAttribute1];

        
    }
    return self;
}

+(DinggoMurder*)dinggoMurder{
    
    DinggoMurder* dinggoMurder = [[self alloc] init];
    return dinggoMurder;
    
}

@end
