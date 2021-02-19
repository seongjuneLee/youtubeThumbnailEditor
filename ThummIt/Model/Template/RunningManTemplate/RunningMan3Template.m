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
        self.mainFrameImageName = @"runningMan3Frame";
        
    }
    return self;
    
}

+(RunningMan3Template*)runningMan3Template{
    
    RunningMan3Template* runningMan3Template = [[self alloc] init];
    return runningMan3Template;
    
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isFixedPhotoFrame = true;
    fullRectPhotoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:fullRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //로고
    Text *logoText = [[Text alloc] init];
    RunningManLogoTypo *logo = [RunningManLogoTypo runningManLogoTypo];
    logoText.indexInLayer =@"0";
    logoText.text = @"러닝맨";
    logoText.textView.text = logoText.text;
    logoText.scale = 0.4;
    logoText.center = CGPointMake(0.23, 0.78);
    logoText.isTemplateItem = true;
    logoText.typo = logo;
    [self.texts addObject:logoText];
    
    //Rule
    Text *ruleText = [[Text alloc] init];
    RuleTypo *rule = [RuleTypo ruleTypo];
    ruleText.indexInLayer =@"1";
    ruleText.text = @"Rule";
    ruleText.textView.text = ruleText.text;
    ruleText.scale = 0.096;
    ruleText.center = CGPointMake(0.5, 0.7);
    ruleText.isTemplateItem = true;
    ruleText.typo = rule;
    [self.texts addObject:ruleText];
    
    //문제를 듣고
    Text *matterText = [[Text alloc] init];
    MatterTypo *matter = [MatterTypo matterTypo];
    matterText.indexInLayer =@"2";
    matterText.text = @"문제를 듣고";
    matterText.textView.text = matterText.text;
    matterText.scale = 0.24;
    matterText.center = CGPointMake(0.66, 0.66);
    matterText.isTemplateItem = true;
    matterText.typo = matter;
    [self.texts addObject:matterText];
    
    //먼저 대답하면 성공!
    Text *successText = [[Text alloc] init];
    SuccessTypo *successs = [SuccessTypo successTypo];
    successText.indexInLayer =@"3";
    successText.text = @"먼저 대답하면 성공!";
    successText.textView.text = successText.text;
    successText.scale = 0.385;
    successText.center = CGPointMake(0.735, 0.74);
    successText.isTemplateItem = true;
    successText.typo = successs;
    [self.texts addObject:successText];
    
    //아 왜그래요 진짜!!
    Text *whyRealText = [[Text alloc] init];
    WhyRealTypo *whyReal = [WhyRealTypo whyRealTypo];
    whyRealText.indexInLayer =@"4";
    whyRealText.text = @"아 왜 그래요 진짜!!";
    whyRealText.textView.text = whyRealText.text;
    whyRealText.scale = 0.42;
    whyRealText.center = CGPointMake(0.27, 0.34);
    whyRealText.isTemplateItem = true;
    whyRealText.typo = whyReal;
    [self.texts addObject:whyRealText];
    
}

-(void)setUpStickers{
    
    RunningManQuSticker *runningManQuSticker = [RunningManQuSticker runningManQuSticker];
    runningManQuSticker.indexInLayer =@"5";
    runningManQuSticker.scale = 0.17;
    runningManQuSticker.isTemplateItem = true;
    runningManQuSticker.center = CGPointMake(0.68, 0.23);
    [self.stickers addObject:runningManQuSticker];
    
}

@end
