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
    }
    return self;
    
}

+(RunningMan1Template*)runningMan1Template{
    
    RunningMan1Template* runningMan1Template = [[self alloc] init];
    return runningMan1Template;
    
}

-(void)setUpMainFrames{
    
    RunningMan1MainFrame *mainFrame = [RunningMan1MainFrame runningMan1MainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    PhotoFrame *photoFrame1 = [ThreeFifthsRectangle threeFifthsRectangle];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isFixedPhotoFrame = true;
    photoFrame1.relativeCenter = CGPointMake(0.3, 0.5);
    [self.photoFrames addObject:photoFrame1];
    
    PhotoFrame *photoFrame2 = [TwoFifthRectangle twoFifthRectangle];
    photoFrame2.isTemplateItem = true;
    photoFrame2.isFixedPhotoFrame = true;
    photoFrame2.relativeCenter = CGPointMake(0.8, 0.5);
    [self.photoFrames addObject:photoFrame2];
    
}

-(void)setUpTexts{

    //로고
    Text *logoText = [[Text alloc] init];
    RunningManLogoTypo *logo = [RunningManLogoTypo runningManLogoTypo];
    logoText.indexInLayer =@"0";
    logoText.text = @"러닝맨";
    logoText.textView.text = logoText.text;
    logoText.scale = 0.09;
    logoText.relativeCenter = CGPointMake(0.09, 0.13);
    logoText.isTemplateItem = true;
    logoText.typo = logo;
    [self.texts addObject:logoText];

    //랜덤게임.zip
    Text *randomGameText = [[Text alloc] init];
    YellowGradientTypo *yellowGradientTypo = [YellowGradientTypo yellowGradientTypo];
    randomGameText.indexInLayer =@"1";
    randomGameText.text = @"랜덤게임.zip";
    randomGameText.textView.text = randomGameText.text;
    randomGameText.scale = 0.5;
    randomGameText.relativeCenter = CGPointMake(0.25, 0.89);
    randomGameText.isTemplateItem = true;
    randomGameText.typo = yellowGradientTypo;
    [self.texts addObject:randomGameText];

    //러닝맨
    Text *learningManText = [[Text alloc] init];
    WorkingManNameTypo *workingManNameTypo = [WorkingManNameTypo workingManNameTypo];
    learningManText.indexInLayer =@"2";
    learningManText.text = @"러닝맨";
    learningManText.textView.text = learningManText.text;
    learningManText.scale = 0.19;
    learningManText.relativeCenter = CGPointMake(0.1, 0.74);
    learningManText.isTemplateItem = true;
    learningManText.typo = workingManNameTypo;
    [self.texts addObject:learningManText];

    //(식은땀)
    Text *ddamText = [[Text alloc] init];
    DDamTypo *ddam = [DDamTypo ddamTypo];
    ddamText.indexInLayer =@"3";
    ddamText.text = @"(식은땀)";
    ddamText.textView.text = ddamText.text;
    ddamText.scale = 0.24;
    ddamText.relativeCenter = CGPointMake(0.71, 0.21);
    ddamText.isTemplateItem = true;
    ddamText.typo = ddam;
    [self.texts addObject:ddamText];

    //하고싶은말 있는데
    Text *redshoutingText1 = [[Text alloc] init];
    RedShoutingTypo *redshoutingTypo1 = [RedShoutingTypo redShoutingTypo];
    redshoutingText1.indexInLayer =@"4";
    redshoutingText1.text = @"하고싶은말 있는데\n해도 되나요?";
    redshoutingText1.textView.text = redshoutingText1.text;
    redshoutingText1.scale = 0.3;
    redshoutingText1.rotationDegree = degreesToRadians(-5);
    redshoutingText1.relativeCenter = CGPointMake(0.77, 0.72);
    redshoutingText1.isTemplateItem = true;
    redshoutingText1.typo = redshoutingTypo1;
    [self.texts addObject:redshoutingText1];

    //이 형은 룰을
    Text *redshoutingText2 = [[Text alloc] init];
    RedShoutingTypo *redshoutingTypo2 = [RedShoutingTypo redShoutingTypo];
    redshoutingText2.indexInLayer =@"5";
    redshoutingText2.text = @"이 형은 룰을\n아예 모르네";
    redshoutingText2.textView.text = redshoutingText2.text;
    redshoutingText2.scale = 0.17;
    redshoutingText2.rotationDegree = degreesToRadians(355);
    redshoutingText2.relativeCenter = CGPointMake(0.35, 0.52);
    redshoutingText2.isTemplateItem = true;
    redshoutingText2.typo = redshoutingTypo2;
    [self.texts addObject:redshoutingText2];
    
}

-(void)setUpStickers{
        
    RunningManExcSticker *runningManExcSticker1 = [RunningManExcSticker runningManExcSticker];
    runningManExcSticker1.indexInLayer =@"6";
    runningManExcSticker1.scale = 0.1;
    runningManExcSticker1.isTemplateItem = true;
    runningManExcSticker1.relativeCenter = CGPointMake(0.33, 0.28);
    [self.stickers addObject:runningManExcSticker1];

    RunningManExcSticker *runningManExcSticker2 = [RunningManExcSticker runningManExcSticker];
    runningManExcSticker2.indexInLayer =@"7";
    runningManExcSticker2.scale = 0.1;
    runningManExcSticker2.isTemplateItem = true;
    runningManExcSticker2.relativeCenter = CGPointMake(0.38, 0.28);
    [self.stickers addObject:runningManExcSticker2];

}

@end
