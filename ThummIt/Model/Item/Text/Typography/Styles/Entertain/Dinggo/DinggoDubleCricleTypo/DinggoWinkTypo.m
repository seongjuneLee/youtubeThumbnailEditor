//
//  DinggoWinkTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/05.
//

#import "DinggoWinkTypo.h"

@implementation DinggoWinkTypo

-(id)init{
    self = [super init];
    if (self) {

        self.name = NSLocalizedString(@"윙크발사?!",nil);
        self.fontName = @"NeoDunggeunmoPro-Regular";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1] ;
        self.fontSize = 100;
        self.canChangeColor = true;
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor blackColor];
       
        bgTextAttribute1.borderWidth = 10;
       
        
        self.bgTextAttributes = @[bgTextAttribute1];

        
    }
    return self;
}

+(DinggoWinkTypo*)dinggoWinkTypo{
    
    DinggoWinkTypo* dinggoWinkTypo = [[self alloc] init];
    return dinggoWinkTypo;
    
}

@end
