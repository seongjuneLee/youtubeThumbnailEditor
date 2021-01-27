//
//  CircleTemplate.m
//  Thummit
//
//  Created by 이성준 on 2020/12/15.
//

#import "CircleTemplate.h"

@implementation CircleTemplate
-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"circleTemplate";
        self.previewImageName = @"circleImage";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundColor = UIColor.blackColor;
        self.backgroundImageName = @"";
        [self setUpPhotoFrame];
        
    }
    return self;
    
}

+(CircleTemplate*)circleTemplate{
    
    CircleTemplate* circleTemplate = [[self alloc] init];
    
    return circleTemplate;
    
}

-(void)setUpPhotoFrame{
    
    self.photoFrames = [NSMutableArray new];
    PhotoFrame *photoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    photoFrame.isTemplateItem = true;
    photoFrame.baseView.backgroundColor = UIColor.whiteColor;
    [self.photoFrames addObject:photoFrame];
    
    
}


@end
