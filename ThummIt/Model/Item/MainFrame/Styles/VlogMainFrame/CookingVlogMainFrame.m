//
//  CookingVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "CookingVlogMainFrame.h"

@implementation CookingVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"cookingVlogFrame";
        self.backgroundImageName = @"cookingVlogFrame";
}
    return self;
}

+(CookingVlogMainFrame*) cookingVlogMainFrame{

CookingVlogMainFrame *cookingVlogMainFrame = [[self alloc] init];
    
return cookingVlogMainFrame;
    
}

@end
