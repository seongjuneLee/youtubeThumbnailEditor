//
//  WorkManTemplate3.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "WorkManTemplate3.h"

@implementation WorkManTemplate3

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"workMan3";
        self.previewImageName = @"workMan3Preview";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundColor = UIColor.blackColor;
        self.backgroundImageName = @"workManFrame3";
        [self setUpPhotoFrame];
        
    }
    return self;
    
}


+(WorkManTemplate3*)workManTemplate3{
    
    WorkManTemplate3* workManTemplate3 = [[self alloc] init];
    
    return workManTemplate3;
    
}

-(void)setUpPhotoFrame{
    
    self.photoFrames = [NSMutableArray new];
    PhotoFrame *photoFrame = [BasicCircle basicCircle];
    photoFrame.isTemplateItem = true;
    photoFrame.baseView.backgroundColor = UIColor.whiteColor;
    [self.photoFrames addObject:photoFrame];
    
}

@end
