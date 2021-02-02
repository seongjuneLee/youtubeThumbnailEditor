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
        self.backgroundImageName = @"workManFrame2";
        
    }
    return self;
    
}

+(WorkManTemplate2*)workManTemplate2{
    
    WorkManTemplate2* workManTemplate2 = [[self alloc] init];
    return workManTemplate2;
    
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
    logoText.scale = 0.61;
    logoText.center = CGPointMake(0.11, 0.1);
    logoText.isTemplateItem = true;
    logoText.indexInLayer = @"0";
    logoText.text = @"위크맨";
    logoText.textView.text = @"위크맨";
    [logoText applyTypo:logo];
    [self.texts addObject:logoText];
    
    Text *yellowTitle = [[Text alloc] init];
    WorkmanYelloewTitle *yellow = [WorkmanYelloewTitle workmanYelloewTitle];
    yellowTitle.scale = 1.5;
    yellowTitle.center = CGPointMake(0.5, 0.67);
    yellowTitle.isTemplateItem = true;
    yellowTitle.indexInLayer = @"1";
    yellowTitle.text = @"유튜브";
    yellowTitle.textView.text = @"유튜브";
    [yellowTitle applyTypo:yellow];
    WorkmanYelloewTitle *yellowcolor = [WorkmanYelloewTitle workmanYelloewTitle];
    yellowcolor.textColor = [UIColor colorWithRed:(238/255.0) green:(230/255.0) blue:(50/255.0) alpha:(1)] ;
    yellowTitle.typoRangeArray = (NSMutableArray *)@[@[yellowcolor,@"0-3"]];
    
    [self.texts addObject:yellowTitle];
    
    Text *whiteTitle = [[Text alloc] init];
    WorkmanYelloewTitle *secondTitle2 = [WorkmanYelloewTitle workmanYelloewTitle];
    whiteTitle.scale = 1.5;
    whiteTitle.center = CGPointMake(0.5,0.87);
    whiteTitle.isTemplateItem = true;
    whiteTitle.indexInLayer = @"2";
    whiteTitle.text = @"비하인드";
    whiteTitle.textView.text = @"비하인드";
    whiteTitle.typo = secondTitle2;
    [whiteTitle applyTypo:secondTitle2];
    [self.texts addObject:whiteTitle];

    
    Text *handText = [[Text alloc] init];
    WorkManHandWrite *hand = [WorkManHandWrite workManHandWrite];
    handText.scale = 0.7;
    handText.center = CGPointMake(0.17,0.245);
    handText.isTemplateItem = true;
    handText.indexInLayer = @"3";
    handText.text = @"(당황)";
    handText.textView.text = @"(당황)";
    [handText applyTypo:hand];
    [self.texts addObject:handText];
    
    Text *whyText = [[Text alloc] init];
    WorkManFast *why = [WorkManFast workManFast];
    whyText.scale = 0.8;
    whyText.rotationDegree = -20;
    whyText.center = CGPointMake(0.34,0.44);
    whyText.isTemplateItem = true;
    whyText.indexInLayer = @"4";
    whyText.text = @"네?!?";
    whyText.textView.text = @"네?!?";
    [whyText applyTypo:why];
    [self.texts addObject:whyText];
    
    Text *howText = [[Text alloc] init];
    WorkManFast *how = [WorkManFast workManFast];
    howText.scale = 0.85;
    howText.rotationDegree = 10;
    howText.center = CGPointMake(0.7,0.3);
    howText.isTemplateItem = true;
    howText.indexInLayer = @"5";
    howText.text = @"이렇게 하는거 맞죠?";
    howText.textView.text = @"이렇게 하는거 맞죠?";
    [howText applyTypo:how];
    [self.texts addObject:howText];
    
}

-(void)setUpStickers{
    
    WorkManFiveFingerSticker *fingerSticker = [WorkManFiveFingerSticker workManFiveFingerSticker];
    fingerSticker.indexInLayer = @"6";
    fingerSticker.scale = 0.45;
    fingerSticker.isTemplateItem = true;
    fingerSticker.center = CGPointMake(0.37, 0.305);
    
    [self.stickers addObject:fingerSticker];
    
}

@end
