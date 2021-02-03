//
//  SuccessTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "SuccessTypo.h"

@implementation SuccessTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"먼저 대답하면 성공!",nil);
        self.fontName = @"AppleSDGothicNeo-Bold";
        self.fontSize = TEXT_FONT_SIZE;
        self.textFromColor = [UIColor colorWithRed:246/255.0 green:44/255.0 blue:27/255.0 alpha:1.0];
        self.textToColor = [UIColor colorWithRed:246/255.0 green:206/255.0 blue:56/255.0 alpha:1.0];
        NSDictionary *attr = @{NSFontAttributeName: [UIFont fontWithName:self.fontName size:self.fontSize]};
        CGSize stringBoundingBox = [@"먼저 대답하면 성공!" sizeWithAttributes:attr];
        self.textGradientHeight = stringBoundingBox.height + 4.5;

        self.textColor = [UIColor diagonalGradientFromColor:self.textFromColor toColor:self.textToColor withHeight:self.textGradientHeight];
        self.isChangingColorAvailable = true;
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 7;
        self.bgTextAttributes = @[borderAtt];
        
        
    }
    return self;
}

+(SuccessTypo*) successTypo{
    
    SuccessTypo* successTypo = [[self alloc] init];
    return successTypo;
    
}

@end
