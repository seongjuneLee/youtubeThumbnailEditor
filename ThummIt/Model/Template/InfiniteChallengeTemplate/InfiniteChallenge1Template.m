//
//  InfiniteChallenge1Template.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "InfiniteChallenge1Template.h"

@implementation InfiniteChallenge1Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"infiniteChallengePreview1";
        self.category = NSLocalizedString(@"Entertainment", nil);
        self.templateName = @"infiniteChallenge1Template";
        
    }
    return self;
    
}

+(InfiniteChallenge1Template*)infiniteChallenge1Template{
    
    InfiniteChallenge1Template* infiniteChallenge1Template = [[self alloc] init];
    return infiniteChallenge1Template;
    
}

-(void)setUpMainFrames{
    
    InfiniteChallenge1MainFrame *mainFrame = [InfiniteChallenge1MainFrame infiniteChallenge1MainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isFixedPhotoFrame = true;
    fullRectPhotoFrame.relativeCenter = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:fullRectPhotoFrame];

}

-(void)setUpTexts{
    
    //방탈출
    Text *escapeRoomText = [[Text alloc] init];
    InfiniteChallengeEscapeRoom *escapeRoom = [InfiniteChallengeEscapeRoom infiniteChallengeEscapeRoom];
    escapeRoomText.scale = 0.48;
    escapeRoomText.relativeCenter = CGPointMake(0.5, 0.85);
    escapeRoomText.isTemplateItem = true;
    escapeRoomText.indexInLayer =@"0";
    escapeRoomText.text = @"방탈출";
    escapeRoomText.textView.text = escapeRoomText.text;
    escapeRoomText.typo = escapeRoom;
    [self.texts addObject:escapeRoomText];
    
    //로고
    Text *logoText = [[Text alloc] init];
    InfiniteChallengeLogo *logo = [InfiniteChallengeLogo infiniteChallengeLogo];
    logoText.scale = 0.1;
    logoText.relativeCenter = CGPointMake(0.875, 0.15);
    logoText.isTemplateItem = true;
    logoText.indexInLayer =@"1";
    logoText.text = @"백만도전";
    logoText.textView.text = logoText.text;
    logoText.typo = logo;
    [self.texts addObject:logoText];
    
    //자막
    Text *memberText = [[Text alloc] init];
    InfiniteChallengeOrangeTypo *orange = [InfiniteChallengeOrangeTypo infiniteChallengeOrangeTypo];
    memberText.scale = 0.15;
    memberText.relativeCenter = CGPointMake(0.345, 0.55);
    memberText.isTemplateItem = true;
    memberText.indexInLayer =@"2";
    memberText.text = @"멤버들";
    memberText.textView.text = memberText.text;
    memberText.typo = orange;

    Text *withText = [[Text alloc] init];
    InfiniteChallengeWhiteTypo *white = [InfiniteChallengeWhiteTypo infiniteChallengeWhiteTypo];
    withText.scale = 0.165;
    withText.relativeCenter = CGPointMake(0.495, 0.55);
    withText.isTemplateItem = true;
    withText.indexInLayer =@"3";
    withText.text = @"과 함께";
    withText.textView.text = memberText.text;
    withText.typo = white;
    
    Text *secreteText = [[Text alloc] init];
    InfiniteChallengeBlueTypo *blue = [InfiniteChallengeBlueTypo infiniteChallengeBlueTypo];
    secreteText.scale = 0.105;
    secreteText.relativeCenter = CGPointMake(0.635, 0.55);
    secreteText.isTemplateItem = true;
    secreteText.indexInLayer =@"4";
    secreteText.text = @"비밀";
    secreteText.textView.text = memberText.text;
    secreteText.typo = blue;

    Text *eulText = [[Text alloc] init];
    InfiniteChallengeWhiteTypo *white2 = [InfiniteChallengeWhiteTypo infiniteChallengeWhiteTypo];

    eulText.scale = 0.06;
    eulText.relativeCenter = CGPointMake(0.71, 0.55);
    eulText.isTemplateItem = true;
    eulText.indexInLayer =@"5";
    eulText.text = @"을";
    eulText.textView.text = memberText.text;
    eulText.typo = white2;

    Text *digingText = [[Text alloc] init];
    InfiniteChallengeBlackTypo *black = [InfiniteChallengeBlackTypo infiniteChallengeBlackTypo];
    digingText.scale = 0.23;
    digingText.relativeCenter = CGPointMake(0.86, 0.55);
    digingText.isTemplateItem = true;
    digingText.indexInLayer =@"6";
    digingText.text = @"파헤쳐라!";
    digingText.textView.text = memberText.text;
    digingText.typo = black;

    
    [self.texts addObject:memberText];
    [self.texts addObject:secreteText];
    [self.texts addObject:withText];
    [self.texts addObject:eulText];
    [self.texts addObject:digingText];

}

-(void)setUpStickers{
    
    InfiniteChallengeSkullSticker *skullSticker = [InfiniteChallengeSkullSticker infiniteChallengeSkullSticker];
    skullSticker.indexInLayer =@"7";
    skullSticker.scale = 0.09;
    skullSticker.isTemplateItem = true;
    skullSticker.relativeCenter = CGPointMake(0.19, 0.32);
    
    [self.stickers addObject:skullSticker];
    
}

@end
