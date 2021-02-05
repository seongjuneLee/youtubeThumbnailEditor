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
        self.backgroundImageName = @"WorkManFrame1";
    }
    return self;
    
}

+(WorkManTemplate1*)workManTemplate1{
    
    WorkManTemplate1* workManTemplate1 = [[self alloc] init];
    return workManTemplate1;
    
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
    logoText.scale = 0.13;
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
    tagText.rotationDegree = 45;
    tagText.center = CGPointMake(0.93,0.15);
    tagText.isTemplateItem = true;
    tagText.indexInLayer = @"1";
    tagText.text = @"제철알바";
    tagText.textView.text = @"제철알바";
    tagText.typo = tag;
    [self.texts addObject:tagText];
    
    Text *handText = [[Text alloc] init];
    WorkManHandWrite *hand = [WorkManHandWrite workManHandWrite];
    handText.scale = 0.21;
    handText.center = CGPointMake(0.21,0.225);
    handText.isTemplateItem = true;
    handText.indexInLayer = @"2";
    handText.text = @"(무대난입)";
    handText.textView.text = @"(무대난입)";
    handText.typo = hand;
    [self.texts addObject:handText];
    
    Text *talkWrite = [[Text alloc] init];
    WorkManTalkWrite *talk = [WorkManTalkWrite workManTalkWrite];
    talkWrite.scale = 0.2;
    talkWrite.center = CGPointMake(0.42,0.28);
    talkWrite.rotationDegree = 330;
    talkWrite.isTemplateItem = true;
    talkWrite.indexInLayer = @"3";
    talkWrite.text = @"소리질러!!!!";
    talkWrite.textView.text = @"소리질러!!!!!";
    talkWrite.typo = talk;
    [self.texts addObject:talkWrite];
    
    Text *redtitle = [[Text alloc] init];
    WorkManSecondTitle *secondTitle = [WorkManSecondTitle workManSecondTitle];
    redtitle.scale = 0.6;
    redtitle.center = CGPointMake(0.33,0.72);
    redtitle.isTemplateItem = true;
    redtitle.indexInLayer = @"4";
    redtitle.text = @"행사비 안받을게요";
    redtitle.textView.text = @"행사비 안받을게요";
    redtitle.typo = secondTitle;
    
    WorkManRedTitle *red = [WorkManRedTitle workManRedTitle];
    redtitle.typoRangeArray = (NSMutableArray *)@[@[red,@"0-3"]];
    [self.texts addObject:redtitle];
    
    
    Text *bluetitle = [[Text alloc] init];
    WorkManSecondTitle *secondTitle2 = [WorkManSecondTitle workManSecondTitle];
    bluetitle.scale = 0.62;
    bluetitle.center = CGPointMake(0.34,0.87);
    bluetitle.isTemplateItem = true;
    bluetitle.indexInLayer = @"5";
    bluetitle.text = @"대학축제 알바 리뷰";
    bluetitle.textView.text = @"대학축제 알바 리뷰";
    bluetitle.typo = secondTitle2;
    
    WorkManRedTitle *blue = [WorkManRedTitle workManRedTitle];
    blue.textColor = [UIColor colorWithRed:(20/255.0) green:(48/255.0) blue:(209/255.0) alpha:1] ;
    bluetitle.typoRangeArray = (NSMutableArray *)@[@[blue,@"0-7"]];
    [self.texts addObject:bluetitle];
    
    Text *fastText = [[Text alloc] init];
    WorkManFast *fast = [WorkManFast workManFast];
    fastText.scale = 0.35;
    fastText.rotationDegree = -2;
    fastText.center = CGPointMake(0.77,0.55);
    fastText.isTemplateItem = true;
    fastText.indexInLayer = @"6";
    fastText.text = @"끌어내려 빨리!!";
    fastText.textView.text = @"끌어내려 빨리!!";
    fastText.typo = fast;
    [self.texts addObject:fastText];
    
}

-(void)setUpStickers{
    
    AngrySticker1 *angrySticker = [AngrySticker1 angrySticker1];
    angrySticker.scale = 0.17;
    angrySticker.rotationDegree = -10;
    angrySticker.indexInLayer = @"7";
    angrySticker.isTemplateItem = true;
    angrySticker.center = CGPointMake(0.89, 0.4);
    
    [self.stickers addObject:angrySticker];
    
}

@end
