//
//  FullRectangle.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "FullRectangle.h"

@implementation FullRectangle

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"FullRectangle";
        [self makeBaseView];
        
    }
    return self;
    
}

-(void)makeBaseView{
    [super makeBaseView];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth = screenWidth;
    self.baseView.frameSize = CGSizeMake(frameWidth, frameWidth * 9/16);
    self.baseView.backgroundColor = UIColor.whiteColor;
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(FullRectangle*)verticalHalfRectangle{
    
    FullRectangle* fullRectangle = [[self alloc] init];
    return fullRectangle;
    
}

@end
