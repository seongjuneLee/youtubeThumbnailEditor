//
//  RunningMan3Template.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "RunningMan3Template.h"

@implementation RunningMan3Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"runningMan3Template";
        self.previewImageName = @"runningManPreview3";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundImageName = @"runningMan3Frame";
        
    }
    return self;
    
}

+(RunningMan3Template*)runningMan3Template{
    
    RunningMan3Template* runningMan3Template = [[self alloc] init];
    
    return runningMan3Template;
    
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
