//
//  ChristmasCircleTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import "ChristmasCircleTemplate.h"

@implementation ChristmasCircleTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"christmasTemplate";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.templateName = @"christmasCircleTemplate";
        self.backgroundColor = [UIColor colorWithRed:222.0/255.0 green:229.0/255.0 blue:205.0/255.0 alpha:1.0];
        self.backgroundImageName = @"";
        [self setUpPhotoFrame];
        
    }
    return self;
    
}

+(ChristmasCircleTemplate*)christmasCircleTemplate{
    
    ChristmasCircleTemplate* christmasCircleTemplate = [[self alloc] init];
    
    return christmasCircleTemplate;
    
}

-(void)setUpPhotoFrame{
    
    self.photoFrames = [NSMutableArray new];
    PhotoFrame *firstPhotoFrame = [ChristmasCircle christmasCircle];
    firstPhotoFrame.isTemplateItem = true;
    firstPhotoFrame.baseView.backgroundColor = UIColor.whiteColor;
    firstPhotoFrame.center = CGPointMake(0.32, 0.5);
    
    [self.photoFrames addObject:firstPhotoFrame];

    
}

-(void)setUpTexts{
    
}
@end
