//
//  MacaronRectangle2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/14.
//

#import "MacaronRectangle2.h"

@implementation MacaronRectangle2

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"TwoFifthPhotoFrame";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = screenWidth * 9/16;

    self.baseView.frameSize = CGSizeMake(screenWidth * 0.46, screenHeight * 0.5);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(MacaronRectangle2*)macaronRectangle2{
    
    MacaronRectangle2* macaronRectangle2 = [[self alloc] init];
    return macaronRectangle2;
    
}

@end
