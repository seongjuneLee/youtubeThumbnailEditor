//
//  WorkManTemPlate1.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "WorkManTemplate1.h"

@implementation WorkManTemplate1

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"workMan1";
        self.previewImageName = @"workMan1Preview";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundColor = UIColor.blackColor;
        self.backgroundImageName = @"workManFrame1";
        [self setUpPhotoFrame];
        
    }
    return self;
    
}


+(WorkManTemplate1*)workManTemplate1{
    
    WorkManTemplate1* workManTemplate1 = [[self alloc] init];
    
    return workManTemplate1;
    
}

-(void)setUpPhotoFrame{
    
    self.photoFrames = [NSMutableArray new];
    PhotoFrame *photoFrame = [BasicCircle basicCircle];
    photoFrame.isTemplateItem = true;
    photoFrame.baseView.backgroundColor = UIColor.whiteColor;
    [self.photoFrames addObject:photoFrame];
    
}

@end
