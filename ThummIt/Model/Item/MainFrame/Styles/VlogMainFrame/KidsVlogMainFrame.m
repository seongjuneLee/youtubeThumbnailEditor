//
//  KidsVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "KidsVlogMainFrame.h"

@implementation KidsVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"kidsVlogFrame";
        self.backgroundImageName = @"kidsVlogFrame";
}
    return self;
}

+(KidsVlogMainFrame*) kidsVlogMainFrame{

KidsVlogMainFrame* kidsVlogMainFrame = [[self alloc] init];
    
return kidsVlogMainFrame;
    
}

@end
