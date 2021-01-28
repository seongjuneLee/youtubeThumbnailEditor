//
//  WorkManTemplate2.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "WorkManTemplate2.h"

@implementation WorkManTemplate2

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"workMan2";
        self.previewImageName = @"workMan2Preview";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundColor = UIColor.blackColor;
        self.backgroundImageName = @"workManFrame2";
        
    }
    return self;
    
}



+(WorkManTemplate2*)workManTemplate2{
    
    WorkManTemplate2* workManTemplate2 = [[self alloc] init];
    
    return workManTemplate2;
    
}

-(void)setUpPhotoFrame{
    
    self.photoFrames = [NSMutableArray new];
    PhotoFrame *photoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    photoFrame.isTemplateItem = true;
    photoFrame.baseView.backgroundColor = UIColor.whiteColor;
    [self.photoFrames addObject:photoFrame];
    
}

-(void)setUpTexts{
    
}
@end
