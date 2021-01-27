//
//  RunningMan1.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "RunningMan1Template.h"

@implementation RunningMan1Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"runningMan1";
        self.previewImageName = @"runningMan1Preview";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundColor = UIColor.blackColor;
        self.backgroundImageName = @"runningMan1Frame";
        
    }
    return self;
    
}

+(RunningMan1Template*)runningMan1Template{
    
    RunningMan1Template* runningMan1Template = [[self alloc] init];
    
    return runningMan1Template;
    
}

-(void)setUpTexts{
    
    Text *runningText = [[Text alloc] init];
    DDamTypo *runningManLogo = [DDamTypo ddamTypo];
    runningText.text = @"(식은땀)";
    runningText.textView.text = runningText.text;
    
    [runningText applyTypo:runningManLogo];
    [runningText resize];
    [runningText.textView setNeedsDisplay];
    runningText.center = CGPointMake(0.7, 0.3);
    runningText.isTemplateItem = true;
    [self.texts addObject:runningText];
    
}

-(void)setUpPhotoFrame{
    
    
}

@end
