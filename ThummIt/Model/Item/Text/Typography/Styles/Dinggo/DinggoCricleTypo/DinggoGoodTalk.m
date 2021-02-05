//
//  DinggoGoodTalk.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/05.
//

#import "DinggoGoodTalk.h"

@implementation DinggoGoodTalk

-(id)init{
    self = [super init];
    if (self) {

        self.name = NSLocalizedString(@"띵언가들",nil);
        self.fontName = @"NEXONLv2GothicOTFRegular";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1] ;
        self.fontSize = TEXT_FONT_SIZE;
        
    }
    return self;
}

+(DinggoGoodTalk*)dinggoGoodTalk{
    
    DinggoGoodTalk* dinggoGoodTalk = [[self alloc] init];
    return dinggoGoodTalk;
    
}

@end
