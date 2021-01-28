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
        self.backgroundImageName = @"infiniteChallengeLogoFrame";
        
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
    
    Text *escapeRoomText = [[Text alloc] init];
    InfiniteChallengeEscapeRoom *escapeRoom = [InfiniteChallengeEscapeRoom infiniteChallengeEscapeRoom];
    escapeRoomText.center = CGPointMake(0.5, 0.9);
    escapeRoomText.isTemplateItem = true;
    escapeRoomText.text = @"방탈출";
    escapeRoomText.textView.text = @"방탈출";
    [escapeRoomText applyTypo:escapeRoom];
    [self.texts addObject:escapeRoomText];
    
    
}

@end
