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
        
        self.templateName = @"runningMan1Template";
        self.previewImageName = @"runningManPreview1";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundImageName = @"runningMan1Frame";
    }
    return self;
    
}

+(RunningMan1Template*)runningMan1Template{
    
    RunningMan1Template* runningMan1Template = [[self alloc] init];
    
    return runningMan1Template;
    
}

-(void)setUpTexts{
    //(식은땀)
    Text *text1 = [[Text alloc] init];
    DDamTypo *runningManLogo = [DDamTypo ddamTypo];
    text1.text = @"(식은땀)";
    text1.textView.text = text1.text;
    
    [text1 applyTypo:runningManLogo];
    [text1 resize];
    [text1.textView setNeedsDisplay];
    text1.center = CGPointMake(0.73, 0.25);
    text1.isTemplateItem = true;
    [self.texts addObject:text1];
    
    //하고싶은말 있는데
    Text *text2 = [[Text alloc] init];
    RedShoutingTypo *redshoutingTypo1 = [RedShoutingTypo redShoutingTypo];
    text2.text = @"하고싶은말 있는데\n해도 되나요?";
    text2.textView.text = text2.text;
    [text2.textView setNeedsDisplay];
    text2.scale =1;
    text2.center = CGPointMake(0.8, 0.8);
    
    [text2 applyTypo:redshoutingTypo1];
    [text2 resize];

    text2.isTemplateItem = true;
    [self.texts addObject:text2];
    
    
    //이 형은 룰을
    Text *text3 = [[Text alloc] init];
    RedShoutingTypo *redshoutingTypo2 = [RedShoutingTypo redShoutingTypo];
    text3.text = @"이 형은 룰을\n아예 모르네?";
    text3.textView.text = text3.text;
    
    [text3 applyTypo:redshoutingTypo2];
    [text3 resize];
    [text3.textView setNeedsDisplay];
    text3.center = CGPointMake(0.7, 0.5);
    text3.isTemplateItem = true;
    [self.texts addObject:text3];
    
    //랜덤게임
    Text *text4 = [[Text alloc] init];
    YellowGradientTypo *yellowGradientTypo = [YellowGradientTypo yellowGradientTypo];
    text4.text = @"랜덤게임.zip";
    text4.textView.text = text4.text;
    
    [text4 applyTypo:yellowGradientTypo];
    [text4 resize];
    [text4.textView setNeedsDisplay];
    text4.center = CGPointMake(0.7, 0.5);
    text4.isTemplateItem = true;
    [self.texts addObject:text4];
    
    //워킹맨블루
    Text *text5 = [[Text alloc] init];
    WorkingManNameTypo *workingManNameTypo = [WorkingManNameTypo workingManNameTypo];
    text5.text = @"워킹맨";
    text5.textView.text = text5.text;
    
    [text5 applyTypo:workingManNameTypo];
    [text5 resize];
    [text5.textView setNeedsDisplay];
    text5.center = CGPointMake(0.7, 0.5);
    text5.isTemplateItem = true;
    [self.texts addObject:text5];
    
    //워킹맨로고
    Text *text6 = [[Text alloc] init];
    RunningManLogoTypo *runningManLogoTypo = [RunningManLogoTypo runningManLogoTypo];
    text6.text = @"워킹맨";
    text6.textView.text = text6.text;
    
    [text6 applyTypo:runningManLogoTypo];
    [text6 resize];
    [text6.textView setNeedsDisplay];
    text6.center = CGPointMake(0.7, 0.5);
    text6.isTemplateItem = true;
    [self.texts addObject:text6];
    
    
    
    
}

-(void)setUpPhotoFrame{
    
    
}

@end
