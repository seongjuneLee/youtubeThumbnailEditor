//
//  InfiniteChallenge2Template.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/29.
//

#import "InfiniteChallenge2Template.h"

@implementation InfiniteChallenge2Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"infiniteChallengePreview2";
        self.category = NSLocalizedString(@"Entertainment", nil);
        self.templateName = @"infiniteChallenge2Template";
        self.backgroundImageName = @"infiniteChallengeFrame2";
        
    }
    return self;
    
}

+(InfiniteChallenge2Template*)infiniteChallenge2Template{
    
    InfiniteChallenge2Template* infiniteChallenge2Template = [[self alloc] init];
    
    return infiniteChallenge2Template;
    
}

-(void)setUpPhotoFrame{
    

}

-(void)setUpTexts{
    
    self.texts = [NSMutableArray new];
    
    //메인 텍스트
    Text *mainTextTop = [[Text alloc] init];
    InfiniteChallengeLegeno *legeno = [InfiniteChallengeLegeno infiniteChallengeLegeno];
    mainTextTop.scale = 1.1;
    mainTextTop.center = CGPointMake(0.1, 0.7);
    mainTextTop.isTemplateItem = true;
    mainTextTop.text = @"레전드 오브 레게노";
    mainTextTop.textView.text = @"레전드 오브 레게노";
    [mainTextTop applyTypo:legeno];
    [self.texts addObject:mainTextTop];
    
    Text *mainTextBottom = [[Text alloc] init];
    InfiniteChallengeLegeno *longJourney = [InfiniteChallengeLegeno infiniteChallengeLegeno];
    longJourney.textColor = [UIColor colorWithRed:254/255.0 green:208/255.0 blue:254/255.0 alpha:1];
    mainTextBottom.scale = 1.1;
    mainTextBottom.center = CGPointMake(0.1, 0.85);
    mainTextBottom.isTemplateItem = true;
    mainTextBottom.text = @"그 대장정의 시작";
    mainTextBottom.textView.text = @"그 대장정의 시작";
    [mainTextBottom applyTypo:longJourney];
    [self.texts addObject:mainTextBottom];
    
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

}

-(void)setUpStickers{
    
    self.stickers = [NSMutableArray new];
    InfiniteChallengeSkullSticker *skullSticker = [InfiniteChallengeSkullSticker infiniteChallengeSkullSticker];
    skullSticker.scale = 0.45;
    skullSticker.isTemplateItem = true;
    skullSticker.center = CGPointMake(0.3, 0.4);
    
    [self.stickers addObject:skullSticker];
    
}
@end
