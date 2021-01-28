//
//  RunningMan2Template.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "RunningMan2Template.h"

@implementation RunningMan2Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"runningMan2Template";
        self.previewImageName = @"runningManPreview2";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundImageName = @"runningMan2Frame";

        
    }
    return self;
    
}

+(RunningMan2Template*)runningMan2Template{
    
    RunningMan2Template* runningMan2Template = [[self alloc] init];
    
    return runningMan2Template;
    
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
