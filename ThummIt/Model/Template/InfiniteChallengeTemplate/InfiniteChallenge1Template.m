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
    
    self.photoFrames = [NSMutableArray new];
    FullRectangle *photoFrame = [FullRectangle fullRectangle];
    photoFrame.isTemplateItem = true;
    photoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:photoFrame];

}

-(void)setUpTexts{
    
    self.texts = [NSMutableArray new];
    
    //방탈출
    Text *escapeRoomText = [[Text alloc] init];
    InfiniteChallengeEscapeRoom *escapeRoom = [InfiniteChallengeEscapeRoom infiniteChallengeEscapeRoom];
    escapeRoomText.scale = 1.1;
    escapeRoomText.center = CGPointMake(0.5, 0.85);
    escapeRoomText.isTemplateItem = true;
    escapeRoomText.text = @"방탈출";
    escapeRoomText.textView.text = @"방탈출";
    [escapeRoomText applyTypo:escapeRoom];
    [self.texts addObject:escapeRoomText];
    
    //로고
    Text *logoText = [[Text alloc] init];
    InfiniteChallengeLogo *logo = [InfiniteChallengeLogo infiniteChallengeLogo];
    logoText.scale = 0.7;
    logoText.center = CGPointMake(0.89, 0.15);
    logoText.isTemplateItem = true;
    logoText.text = @"백만도전";
    logoText.textView.text = @"백만도전";
    [logoText applyTypo:logo];
    [logoText resize];
    [logoText.textView setNeedsDisplay];
    [self.texts addObject:logoText];
    
    //자막
    Text *subTitleText = [[Text alloc] init];
    
    InfiniteChallengeWhiteTypo *white = [InfiniteChallengeWhiteTypo infiniteChallengeWhiteTypo];
    subTitleText.scale = 0.55;
    subTitleText.center = CGPointMake(0.65, 0.55);
    subTitleText.isTemplateItem = true;
    subTitleText.text = @"멤버들과 함께 비밀을 파헤쳐라!";
    subTitleText.textView.text = @"멤버들과 함께 비밀을 파헤쳐라!";
    
    InfiniteChallengeOrangeTypo *orange = [InfiniteChallengeOrangeTypo infiniteChallengeOrangeTypo];
    InfiniteChallengeBlueTypo *blue = [InfiniteChallengeBlueTypo infiniteChallengeBlueTypo];
    InfiniteChallengeBlackTypo *black = [InfiniteChallengeBlackTypo infiniteChallengeBlackTypo];
    subTitleText.typoRangeArray = (NSMutableArray *)@[@[orange,@"0-3"], @[blue,@"8-2"], @[black,@"12-5"]];
    
    [subTitleText applyTypo:white];
    [self.texts addObject:subTitleText];

}

-(void)setUpStickers{
    
    self.stickers = [NSMutableArray new];
    InfiniteChallengeSkullSticker *skullSticker = [InfiniteChallengeSkullSticker infiniteChallengeSkullSticker];
    skullSticker.baseView.backgroundColor = [UIColor orangeColor];
    skullSticker.scale = 0.5;
    skullSticker.isTemplateItem = true;
    skullSticker.center = CGPointMake(0.3, 0.4);
    
    [self.stickers addObject:skullSticker];
    
}

@end
