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
        
        self.templateName = @"workMan1";
        self.previewImageName = @"workMantemplate1";
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
    
    self.photoFrames = [NSMutableArray new];
    FullRectangle *photoFrame = [FullRectangle fullRectangle];
    photoFrame.isTemplateItem = true;
    photoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:photoFrame];
}

-(void)setUpTexts{
        
    Text *logoText = [[Text alloc] init];
    WorkManLogo *logo = [WorkManLogo workManLogo];
    logoText.scale = 0.61;
    logoText.center = CGPointMake(0.11, 0.1);
    logoText.isTemplateItem = true;
    logoText.text = @"위크맨";
    logoText.textView.text = @"위크맨";
    [logoText applyTypo:logo];
    [self.texts addObject:logoText];
    
    Text *tagText = [[Text alloc] init];
    WorkManRightTag *tag = [WorkManRightTag workManRightTag];
    tagText.scale = 0.8;
    tagText.rotationDegree = 45;
    tagText.center = CGPointMake(0.9,0.19);
    tagText.isTemplateItem = true;
    tagText.text = @"제철알바";
    tagText.textView.text = @"제철알바";
    [tagText applyTypo:tag];
    [self.texts addObject:tagText];
    
    Text *handText = [[Text alloc] init];
    WorkManHandWrite *hand = [WorkManHandWrite workManHandWrite];
    handText.scale = 0.7;
    handText.center = CGPointMake(0.24,0.25);
    handText.isTemplateItem = true;
    handText.text = @"(무대난입)";
    handText.textView.text = @"(무대난입)";
    [handText applyTypo:hand];
    [self.texts addObject:handText];
    
    Text *talkWrite = [[Text alloc] init];
    WorkManTalkWrite *talk = [WorkManTalkWrite workManTalkWrite];
    talkWrite.scale = 0.8;
    talkWrite.center = CGPointMake(0.52,0.30);
    talkWrite.rotationDegree = 340;
    talkWrite.isTemplateItem = true;
    talkWrite.text = @"소리질러!!!!";
    talkWrite.textView.text = @"소리질러!!!!!";
    [talkWrite applyTypo:talk];
    [self.texts addObject:talkWrite];
    
    Text *redtitle = [[Text alloc] init];
    WorkManSecondTitle *secondTitle = [WorkManSecondTitle workManSecondTitle];
    redtitle.scale = 0.8;
    redtitle.center = CGPointMake(0.34,0.71);
    redtitle.isTemplateItem = true;
    redtitle.text = @"행사비 안받을게요";
    redtitle.textView.text = @"행사비 안받을게요";
    redtitle.typo = secondTitle;
    
    WorkManRedTitle *red = [WorkManRedTitle workManRedTitle];
    redtitle.typoRangeArray = (NSMutableArray *)@[@[red,@"0-3"]];
    [self.texts addObject:redtitle];
    
    
    Text *bluetitle = [[Text alloc] init];
    WorkManSecondTitle *secondTitle2 = [WorkManSecondTitle workManSecondTitle];
    bluetitle.scale = 0.8;
    bluetitle.center = CGPointMake(0.35,0.87);
    bluetitle.isTemplateItem = true;
    bluetitle.text = @"대학축제 알바 리뷰";
    bluetitle.textView.text = @"대학축제 알바 리뷰";
    bluetitle.typo = secondTitle2;
    
    WorkManRedTitle *blue = [WorkManRedTitle workManRedTitle];
    blue.textColor = [UIColor colorWithRed:(20/255.0) green:(48/255.0) blue:(209/255.0) alpha:1] ;
    bluetitle.typoRangeArray = (NSMutableArray *)@[@[blue,@"0-7"]];
    [self.texts addObject:bluetitle];
    
    Text *fastText = [[Text alloc] init];
    WorkManFast *fast = [WorkManFast workManFast];
    fastText.scale = 0.8;
    fastText.center = CGPointMake(0.8,0.55);
    fastText.isTemplateItem = true;
    fastText.text = @"끌어내려 빨리!!";
    fastText.textView.text = @"끌어내려 빨리!!";
    [fastText applyTypo:fast];
    [self.texts addObject:fastText];
    
    
    
}

-(void)setUpStickers{
    
    self.stickers = [NSMutableArray new];
    WorkManAngrySticker *angrySticker = [WorkManAngrySticker workManAngrySticker];
    angrySticker.scale = 0.4;
    angrySticker.rotationDegree = -5;
    angrySticker.isTemplateItem = true;
    angrySticker.center = CGPointMake(0.79, 0.365);
    
    [self.stickers addObject:angrySticker];
    
}

@end
