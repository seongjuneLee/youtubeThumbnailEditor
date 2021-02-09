//
//  CircleTemplate.m
//  Thummit
//
//  Created by 이성준 on 2020/12/15.
//

#import "CircleTemplate.h"

@implementation CircleTemplate
-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"circleTemplate";
        self.previewImageName = @"circleTemplatePreview";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundColor = UIColor.blackColor;
        self.backgroundImageName = @"";
        
    }
    return self;
    
}

+(CircleTemplate*)circleTemplate{
    
    CircleTemplate* circleTemplate = [[self alloc] init];
    
    return circleTemplate;
    
}

-(void)setUpPhotoFrame{
    
    PhotoFrame *photoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    photoFrame.isTemplateItem = true;
    photoFrame.indexInLayer = @"0";
    photoFrame.scale = 0.48;
    photoFrame.center = CGPointMake(0.34, 0.53);
    [self.photoFrames addObject:photoFrame];
    
}

-(void)setUpTexts{
    
    Text *smileTypo = [[Text alloc] init];
    DinggoSmileTypo *smile = [DinggoSmileTypo dinggoSmileTypo];
    smileTypo.scale = 0.345;
    smileTypo.center = CGPointMake(0.75, 0.5);
    smileTypo.isTemplateItem = true;
    smileTypo.indexInLayer = @"1";
    smileTypo.text = @"일단 웃어~!!!";
    smileTypo.textView.text = smileTypo.text;
    smileTypo.typo = smile;
    [self.texts addObject:smileTypo];
    
    Text *bigEditTypo = [[Text alloc] init];
    DinggoBigEdit *bigEdit = [DinggoBigEdit dinggoBigEdit];
    bigEditTypo.scale = 0.65;
    bigEditTypo.center = CGPointMake(0.5, 0.85);
    bigEditTypo.isTemplateItem = true;
    bigEditTypo.indexInLayer = @"2";
    bigEditTypo.text = @"통편집을 피하는 법";
    bigEditTypo.textView.text = @"통편집을 피하는 법";
    bigEditTypo.typo = bigEdit;
    [self.texts addObject:bigEditTypo];
    
    Text *binggoTypo = [[Text alloc] init];
    DinggoBingoTypo *binggo = [DinggoBingoTypo dinggoBingoTypo];
    binggoTypo.scale = 0.13;
    binggoTypo.center = CGPointMake(0.92, 0.06);
    binggoTypo.isTemplateItem = true;
    binggoTypo.indexInLayer = @"3";
    binggoTypo.text = @"bingo";
    binggoTypo.textView.text = @"bingo";
    binggoTypo.typo = binggo;
    [self.texts addObject:binggoTypo];
    
    Text *potatoTypo = [[Text alloc] init];
    DinggoPotatoTypo *potato = [DinggoPotatoTypo dinggoPotatoTypo];
    potatoTypo.scale = 0.2;
    potatoTypo.center = CGPointMake(0.34, 0.15);
    potatoTypo.isTemplateItem = true;
    potatoTypo.indexInLayer = @"4";
    potatoTypo.text = @"(감자신)";
    potatoTypo.textView.text = @"(감자신)";
    potatoTypo.typo = potato;
    [self.texts addObject:potatoTypo];
    
    Text *gookTalk = [[Text alloc] init];
    DinggoGoodTalk *goodtaking = [DinggoGoodTalk dinggoGoodTalk];
    gookTalk.scale = 0.15;
    gookTalk.rotationDegree = -10;
    gookTalk.center = CGPointMake(0.1, 0.13);
    gookTalk.isTemplateItem = true;
    gookTalk.rotationDegree = -5;
    gookTalk.indexInLayer = @"5";
    gookTalk.text = @"띵언가들";
    gookTalk.textView.text = @"띵언가들";
    gookTalk.typo = goodtaking;
    [self.texts addObject:gookTalk];
    
    
    
    
    
}

@end
