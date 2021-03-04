//
//  WorkManTemPlate1.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "WorkManTemplate1.h"

@implementation WorkManTemplate1

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"WorkManTemplate1";
        self.previewImageName = @"workManPreview1";
        self.category = NSLocalizedString(@"Entertain", nil);
    }
    return self;
    
}

+(WorkManTemplate1*)workManTemplate1{
    
    WorkManTemplate1* workManTemplate1 = [[self alloc] init];
    return workManTemplate1;
    
}

-(void)setUpMainFrames{
    
    WorkMan1MainFrame *mainFrame = [WorkMan1MainFrame workMan1MainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
    
}

-(void)setUpPhotoFrame{
    
    FullRectangle *photoFrame = [FullRectangle fullRectangle];
    photoFrame.isTemplateItem = true;
    photoFrame.center = CGPointMake(0.5, 0.5);
    photoFrame.isFixedPhotoFrame = true;
    
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
    
    Text *tagText = [[Text alloc] init];
    WorkManRightTag *tag = [WorkManRightTag workManRightTag];
    tagText.scale = 0.20;
    tagText.rotationDegree = degreesToRadians(40);
    tagText.center = CGPointMake(0.91,0.14);
    tagText.isTemplateItem = true;
    tagText.indexInLayer = @"1";
    tagText.text = @"제철알바";
    tagText.textView.text = @"제철알바";
    tagText.typo = tag;
    [self.texts addObject:tagText];
    
    Text *handText = [[Text alloc] init];
    WorkManHandWrite *hand = [WorkManHandWrite workManHandWrite];
    handText.scale = 0.2;
    handText.center = CGPointMake(0.225,0.225);
    handText.isTemplateItem = true;
    handText.indexInLayer = @"2";
    handText.text = @"(무대난입)";
    handText.textView.text = @"(무대난입)";
    handText.typo = hand;
    [self.texts addObject:handText];
    
    Text *talkWrite = [[Text alloc] init];
    WorkManTalkWrite *talk = [WorkManTalkWrite workManTalkWrite];
    talkWrite.scale = 0.255;
    talkWrite.center = CGPointMake(0.42,0.28);
    talkWrite.rotationDegree = degreesToRadians(-25);
    talkWrite.isTemplateItem = true;
    talkWrite.indexInLayer = @"3";
    talkWrite.text = @"소리질러!!!!";
    talkWrite.textView.text = @"소리질러!!!!!";
    talkWrite.typo = talk;
    [self.texts addObject:talkWrite];
    
    Text *secondTitle = [[Text alloc] init];
    WorkManSecondTitle *secondTitleTypo = [WorkManSecondTitle workManSecondTitle];
    secondTitle.scale = 0.36;
    secondTitle.center = CGPointMake(0.435,0.72);
    secondTitle.isTemplateItem = true;
    secondTitle.indexInLayer = @"4";
    secondTitle.text = @"안받을게요";
    secondTitle.textView.text = @"안받을게요";
    secondTitle.typo = secondTitleTypo;
    
    Text *redtitle = [[Text alloc] init];
    WorkManRedTitle *red = [WorkManRedTitle workManRedTitle];
    redtitle.scale = 0.225;
    redtitle.center = CGPointMake(0.145,0.72);
    redtitle.isTemplateItem = true;
    redtitle.indexInLayer = @"5";
    redtitle.text = @"행사비";
    redtitle.textView.text = @"행사비";
    redtitle.typo = red;

    [self.texts addObject:redtitle];
    [self.texts addObject:secondTitle];

    
    Text *albaText = [[Text alloc] init];
    WorkManRedTitle *blue = [WorkManRedTitle workManRedTitle];
    blue.textColor = [UIColor colorWithRed:(20/255.0) green:(48/255.0) blue:(209/255.0) alpha:1] ;
    albaText.scale = 0.45;
    albaText.center = CGPointMake(0.26,0.87);
    albaText.isTemplateItem = true;
    albaText.indexInLayer = @"6";
    albaText.text = @"대학축제 알바";
    albaText.textView.text = @"대학축제 알바";
    albaText.typo = blue;

    Text *reviewText = [[Text alloc] init];
    WorkManSecondTitle *secondTitle2 = [WorkManSecondTitle workManSecondTitle];
    reviewText.scale = 0.16;
    reviewText.center = CGPointMake(0.56,0.87);
    reviewText.isTemplateItem = true;
    reviewText.indexInLayer = @"7";
    reviewText.text = @"리뷰";
    reviewText.textView.text = @"리뷰";
    reviewText.typo = secondTitle2;
    
    
    [self.texts addObject:reviewText];
    [self.texts addObject:albaText];

    Text *fastText = [[Text alloc] init];
    WorkManFast *fast = [WorkManFast workManFast];
    fastText.scale = 0.34;
    fastText.rotationDegree = degreesToRadians(-2);
    fastText.center = CGPointMake(0.77,0.55);
    fastText.isTemplateItem = true;
    fastText.indexInLayer = @"8";
    fastText.text = @"끌어내려 빨리!!";
    fastText.textView.text = @"끌어내려 빨리!!";
    fastText.typo = fast;
    [self.texts addObject:fastText];
    
}

-(void)setUpStickers{
    
    AngrySticker1 *angrySticker = [AngrySticker1 angrySticker1];
    angrySticker.scale = 0.08;
    angrySticker.rotationDegree = degreesToRadians(-7);
    angrySticker.indexInLayer = @"9";
    angrySticker.isTemplateItem = true;
    angrySticker.center = CGPointMake(0.82, 0.31);
    
    [self.stickers addObject:angrySticker];
    
}

@end
