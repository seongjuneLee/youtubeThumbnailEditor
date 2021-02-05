//
//  DinggoBingoTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/05.
//

#import "DinggoBingoTypo.h"

@implementation DinggoBingoTypo

-(id)init{
    self = [super init];
    if (self) {

        self.name = NSLocalizedString(@"bingo",nil);
        self.fontName = @"BinggraeSamanco-Bold";
        self.textColor = [UIColor colorWithRed:(128/255.0) green:(128/255.0) blue:(128/255.0) alpha:1] ;
        self.fontSize = TEXT_FONT_SIZE;

        
    }
    return self;
}

+(DinggoBingoTypo*)dinggoBingoTypo{
    
    DinggoBingoTypo* dinggoBingoTypo = [[self alloc] init];
    return dinggoBingoTypo;
    
}

@end
