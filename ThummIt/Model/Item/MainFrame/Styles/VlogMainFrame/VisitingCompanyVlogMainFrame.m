//
//  VisitingCompanyVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "VisitingCompanyVlogMainFrame.h"

@implementation VisitingCompanyVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"visitingCompanyVlogFrame";
        self.backgroundImageName = @"visitingCompanyVlogFrame";
    //    self.cannotChangeColor = true;
    }
    return self;
}

+(VisitingCompanyVlogMainFrame*) visitingCompanyVlogMainFrame{

VisitingCompanyVlogMainFrame *visitingCompanyVlogMainFrame = [[self alloc] init];
    
return visitingCompanyVlogMainFrame;
    
}

@end
