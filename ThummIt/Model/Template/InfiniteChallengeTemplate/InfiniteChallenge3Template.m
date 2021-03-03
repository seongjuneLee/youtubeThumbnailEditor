//
//  InfiniteChallenge3Template.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/29.
//

#import "InfiniteChallenge3Template.h"

@implementation InfiniteChallenge3Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"infiniteChallengePreview3";
        self.category = NSLocalizedString(@"Entertainment", nil);
        self.templateName = @"infiniteChallenge3Template";
        
    }
    return self;
    
}

+(InfiniteChallenge3Template*)infiniteChallenge3Template{
    
    InfiniteChallenge3Template* infiniteChallenge3Template = [[self alloc] init];
    
    return infiniteChallenge3Template;
    
}

-(void)setUpMainFrames{

}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isFixedPhotoFrame = true;
    fullRectPhotoFrame.relativeCenter = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:fullRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //로고
    Text *logoText = [[Text alloc] init];
    InfiniteChallengeLogo *logo = [InfiniteChallengeLogo infiniteChallengeLogo];
    logoText.scale = 0.4;
    logoText.relativeCenter = CGPointMake(0.17, 0.08);
    logoText.isTemplateItem = true;
    logoText.text = @"백만도전";
    logoText.textView.text = logoText.text;
    logoText.typo = logo;
    [self.texts addObject:logoText];

    //빨리!!
    Text *yellowText = [[Text alloc] init];
    InfiniteChallengeYellowSpeechBoxYellow *yellowSpeechBoxYellow = [InfiniteChallengeYellowSpeechBoxYellow infiniteChallengeYellowSpeechBoxYellow];
    yellowText.scale = 0.8;
    yellowText.relativeCenter = CGPointMake(0.2, 0.5);
    yellowText.rotationDegree = degreesToRadians(8);
    yellowText.isTemplateItem = true;
    yellowText.text = @"빨리!!";
    yellowText.textView.text = yellowText.text;
    yellowText.typo = yellowSpeechBoxYellow;
    [self.texts addObject:yellowText];
    
    //저한테 왜 그러세요..?
    Text *skyBlueText = [[Text alloc] init];
    InfiniteChallengeSkyBlueBox *skyBlueBox = [InfiniteChallengeSkyBlueBox infiniteChallengeSkyBlueBox];
    skyBlueText.scale = 0.55;
    skyBlueText.relativeCenter = CGPointMake(0.8, 0.57);
    skyBlueText.isTemplateItem = true;
    skyBlueText.text = @"저한테 왜 그러세요..?";
    skyBlueText.textView.text = skyBlueText.text;
    skyBlueText.typo = skyBlueBox;
    [self.texts addObject:skyBlueText];
    
    //당황
    Text *embarrassedText = [[Text alloc] init];
    InfiniteChallengeCloudBox *cloudBox = [InfiniteChallengeCloudBox infiniteChallengeCloudBox];
    embarrassedText.scale = 0.45;
    embarrassedText.relativeCenter = CGPointMake(0.65, 0.5);
    embarrassedText.isTemplateItem = true;
    embarrassedText.text = @"당황";
    embarrassedText.textView.text = embarrassedText.text;
    embarrassedText.typo = cloudBox;
    [self.texts addObject:embarrassedText];
    
}
@end
