//
//  VerticalHalfRectangle.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/18.
//

#import "VerticalHalfRectangle.h"

@implementation VerticalHalfRectangle

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"VerticalHalfRectangle";
        [self makeBaseView];
        
    }
    return self;
    
}

-(void)makeBaseView{
    [super makeBaseView];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float circleViewWidth = screenWidth/2;
    self.baseView.frameSize = CGSizeMake(circleViewWidth, circleViewWidth * 9/8);
    self.baseView.backgroundColor = UIColor.whiteColor;
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(VerticalHalfRectangle*)verticalHalfRectangle{
    
    VerticalHalfRectangle* verticalHalfRectangle = [[self alloc] init];
    return verticalHalfRectangle;
    
}

@end
