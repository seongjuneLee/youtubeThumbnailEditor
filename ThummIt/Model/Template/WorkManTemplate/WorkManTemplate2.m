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
        
        self.templateName = @"WorkManTemplate2";
        self.previewImageName = @"workManPreview2";
        self.category = NSLocalizedString(@"Entertain", nil);
        
    }
    return self;
    
}

+(WorkManTemplate2*)workManTemplate2{
    
    WorkManTemplate2* workManTemplate2 = [[self alloc] init];
    return workManTemplate2;
    
}

-(void)setUpMainFrames{
    
    WorkMan2MainFrame *mainFrame = [WorkMan2MainFrame workMan2MainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    FullRectangle *photoFrame = [FullRectangle fullRectangle];
    photoFrame.isTemplateItem = true;
    photoFrame.isFixedPhotoFrame = true;
    photoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:photoFrame];
    
}

-(void)setUpTexts{
    
    Text *logoText = [[Text alloc] init];
    WorkManLogo *logo = [WorkManLogo workManLogo];
    logoText.scale = 0.12;
    logoText.center = CGPointMake(0.095, 0.1);
    logoText.isTemplateItem = true;
    logoText.indexInLayer = @"0";
    logoText.text = @"위크맨";
    logoText.textView.text = @"위크맨";
    logoText.typo = logo;
    [self.texts addObject:logoText];
    
    Text *yellowTitle = [[Text alloc] init];
    WorkmanYelloewTitle *yellow = [WorkmanYelloewTitle workmanYelloewTitle];
    yellow.textColor = [UIColor colorWithRed:(238/255.0) green:(230/255.0) blue:(50/255.0) alpha:1];
    yellowTitle.scale = 0.255;
    yellowTitle.center = CGPointMake(0.5, 0.69);
    yellowTitle.isTemplateItem = true;
    yellowTitle.indexInLayer = @"1";
    yellowTitle.text = @"유튜브";
    yellowTitle.textView.text = @"유튜브";
    yellowTitle.typo = yellow;
    [self.texts addObject:yellowTitle];
    
    Text *whiteTitle = [[Text alloc] init];
    WorkmanYelloewTitle *secondTitle2 = [WorkmanYelloewTitle workmanYelloewTitle];
    whiteTitle.scale = 0.355;
    whiteTitle.center = CGPointMake(0.5,0.87);
    whiteTitle.isTemplateItem = true;
    whiteTitle.indexInLayer = @"2";
    whiteTitle.text = @"비하인드";
    whiteTitle.textView.text = @"비하인드";
    whiteTitle.typo = secondTitle2;
    [self.texts addObject:whiteTitle];

    
    Text *handText = [[Text alloc] init];
    WorkManHandWrite *hand = [WorkManHandWrite workManHandWrite];
    handText.scale = 0.125;
    handText.center = CGPointMake(0.145,0.230);
    handText.isTemplateItem = true;
    handText.indexInLayer = @"3";
    handText.text = @"(당황)";
    handText.textView.text = @"(당황)";
    handText.typo = hand;
    [self.texts addObject:handText];
    
    Text *whyText = [[Text alloc] init];
    WorkManFast *why = [WorkManFast workManFast];
    whyText.scale = 0.13;
    whyText.rotationDegree = degreesToRadians(-20);
    whyText.center = CGPointMake(0.34,0.44);
    whyText.isTemplateItem = true;
    whyText.indexInLayer = @"4";
    whyText.text = @"네?!?";
    whyText.textView.text = @"네?!?";
    whyText.typo = why;
    [self.texts addObject:whyText];
    
    Text *howText = [[Text alloc] init];
    WorkManFast *how = [WorkManFast workManFast];
    howText.scale = 0.41;
    howText.rotationDegree = degreesToRadians(10);
    howText.center = CGPointMake(0.7,0.3);
    howText.isTemplateItem = true;
    howText.indexInLayer = @"5";
    howText.text = @"이렇게 하는거 맞죠?";
    howText.textView.text = @"이렇게 하는거 맞죠?";
    howText.typo = how;
    [self.texts addObject:howText];
    
}

-(void)setUpStickers{
    
    WorkManStartleSticker *startleSticker = [WorkManStartleSticker workManStartleSticker];
    startleSticker.indexInLayer = @"6";
    startleSticker.scale = 0.08;
    startleSticker.isTemplateItem = true;
    startleSticker.center = CGPointMake(0.31, 0.19);
    
    [self.stickers addObject:startleSticker];
    
}

@end
