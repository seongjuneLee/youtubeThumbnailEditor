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
        self.backgroundImageName = @"infiniteChallengeFrame1";
        
    }
    return self;
    
}

+(InfiniteChallenge1Template*)infiniteChallenge1Template{
    
    InfiniteChallenge1Template* infiniteChallenge1Template = [[self alloc] init];
    return infiniteChallenge1Template;
    
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isFixedPhotoFrame = true;
    fullRectPhotoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:fullRectPhotoFrame];

}

-(void)setUpTexts{
    
    //방탈출
    Text *escapeRoomText = [[Text alloc] init];
    InfiniteChallengeEscapeRoom *escapeRoom = [InfiniteChallengeEscapeRoom infiniteChallengeEscapeRoom];
    escapeRoomText.scale = 0.4;
    escapeRoomText.center = CGPointMake(0.5, 0.85);
    escapeRoomText.isTemplateItem = true;
    escapeRoomText.indexInLayer =@"0";
    escapeRoomText.text = @"방탈출";
    escapeRoomText.textView.text = escapeRoomText.text;
    [escapeRoomText applyTypo:escapeRoom];
    [self.texts addObject:escapeRoomText];
    
    //로고
    Text *logoText = [[Text alloc] init];
    InfiniteChallengeLogo *logo = [InfiniteChallengeLogo infiniteChallengeLogo];
    logoText.scale = 0.13;
    logoText.center = CGPointMake(0.875, 0.15);
    logoText.isTemplateItem = true;
    logoText.indexInLayer =@"1";
    logoText.text = @"백만도전";
    logoText.textView.text = logoText.text;
    [logoText applyTypo:logo];
    [self.texts addObject:logoText];
    
    //자막
    Text *subTitleText = [[Text alloc] init];
    
    InfiniteChallengeWhiteTypo *white = [InfiniteChallengeWhiteTypo infiniteChallengeWhiteTypo];
    subTitleText.scale = 0.69;
    subTitleText.center = CGPointMake(0.62, 0.55);
    subTitleText.isTemplateItem = true;
    subTitleText.indexInLayer =@"2";
    subTitleText.text = @"멤버들과 함께 비밀을 파헤쳐라!";
    subTitleText.textView.text = subTitleText.text;
    
    InfiniteChallengeOrangeTypo *orange = [InfiniteChallengeOrangeTypo infiniteChallengeOrangeTypo];
    InfiniteChallengeBlueTypo *blue = [InfiniteChallengeBlueTypo infiniteChallengeBlueTypo];
    InfiniteChallengeBlackTypo *black = [InfiniteChallengeBlackTypo infiniteChallengeBlackTypo];

    subTitleText.typoRangeArray = (NSMutableArray *)@[@[orange,@"0-3"], @[blue,@"8-2"], @[black,@"12-5"]];
    
    [subTitleText applyTypo:white];
    [self.texts addObject:subTitleText];

}

-(void)setUpStickers{
    
    InfiniteChallengeSkullSticker *skullSticker = [InfiniteChallengeSkullSticker infiniteChallengeSkullSticker];
    skullSticker.indexInLayer =@"3";
    skullSticker.scale = 0.19;
    skullSticker.isTemplateItem = true;
    skullSticker.center = CGPointMake(0.24, 0.4);
    
    [self.stickers addObject:skullSticker];
    
}

@end
