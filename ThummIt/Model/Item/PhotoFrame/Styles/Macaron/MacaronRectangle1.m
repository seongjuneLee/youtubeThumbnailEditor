//
//  MacaronRectangle1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/14.
//

#import "MacaronRectangle1.h"

@implementation MacaronRectangle1

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

    self.baseView.frameSize = CGSizeMake(screenWidth * 0.54, screenHeight);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(MacaronRectangle1*)macaronRectangle1{
    
    MacaronRectangle1* macaronRectangle1 = [[self alloc] init];
    return macaronRectangle1;
    
}


@end
