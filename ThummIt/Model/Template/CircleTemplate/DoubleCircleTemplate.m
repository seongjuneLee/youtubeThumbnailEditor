//
//  DoubleCircleTemplate.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "DoubleCircleTemplate.h"

@implementation DoubleCircleTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"doubleCircleTemplatePreview";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.templateName = @"doubleCircleTemplate";
        self.backgroundColor = UIColor.blackColor;
        
    }
    return self;
    
}

+(DoubleCircleTemplate*)doubleCircleTemplate{
    
    DoubleCircleTemplate* doubleCircleTemplate = [[self alloc] init];
    return doubleCircleTemplate;
    
}

-(void)setUpMainFrames{

}

-(void)setUpPhotoFrame{
    
    PhotoFrame *firstPhotoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    PhotoFrame *secondPhotoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    firstPhotoFrame.center = CGPointMake(0.31, 0.5);
    firstPhotoFrame.scale = 0.5;
    firstPhotoFrame.isTemplateItem = true;
    firstPhotoFrame.indexInLayer = @"0";

    secondPhotoFrame.center = CGPointMake(0.75, 0.5);
    secondPhotoFrame.scale = 0.4;
    secondPhotoFrame.isTemplateItem = true;
    secondPhotoFrame.indexInLayer = @"1";

    [self.photoFrames addObject:firstPhotoFrame];
    [self.photoFrames addObject:secondPhotoFrame];

}

-(void)setUpStickers{
    
    LongRectangleSticker *rectangleSticker = [LongRectangleSticker longRectangleSticker];
    rectangleSticker.isTemplateItem = true;
    rectangleSticker.indexInLayer = @"4";
    rectangleSticker.scale = 0.47;
    rectangleSticker.center = CGPointMake(0.5, 0.78);
    rectangleSticker.tintColor = [UIColor colorWithRed:80/255.0 green:10/255.0 blue:205/255.0 alpha:1.0];
    [self.stickers addObject:rectangleSticker];

    LongRectangleSticker *rectangleSticker2 = [LongRectangleSticker longRectangleSticker];
    rectangleSticker2.isTemplateItem = true;
    rectangleSticker2.indexInLayer = @"5";
    rectangleSticker2.scale = 0.7;
    rectangleSticker2.center = CGPointMake(0.5, 0.9);
    rectangleSticker2.tintColor = [UIColor colorWithRed:80/255.0 green:10/255.0 blue:205/255.0 alpha:1.0];
    [self.stickers addObject:rectangleSticker2];

}

-(void)setUpTexts{
    
    Text *starWarsTypo = [[Text alloc] init];
    DinggoStarWarsTypo *starsWas = [DinggoStarWarsTypo dinggoStarWarsTypo];
    starWarsTypo.scale = 0.185;
    starWarsTypo.center = CGPointMake(0.11, 0.08);
    starWarsTypo.isTemplateItem = true;
    starWarsTypo.indexInLayer = @"2";
    starWarsTypo.text = @"스타월드";
    starWarsTypo.textView.text = @"스타월드";
    starWarsTypo.typo = starsWas;
    [self.texts addObject:starWarsTypo];

    Text *behindTypo = [[Text alloc] init];
    DinggoBehindTypo *behind = [DinggoBehindTypo dinggoBehindTypo];
    behindTypo.scale = 0.18;
    behindTypo.center = CGPointMake(0.11, 0.15);
    behindTypo.isTemplateItem = true;
    behindTypo.indexInLayer = @"3";
    behindTypo.text = @"[비하인드]";
    behindTypo.textView.text = @"[바하인드]";
    behindTypo.typo = behind;
    [self.texts addObject:behindTypo];

    Text *winkTypo = [[Text alloc] init];
    DinggoWinkTypo *wink = [DinggoWinkTypo dinggoWinkTypo];
    winkTypo.scale = 0.185;
    winkTypo.center = CGPointMake(0.47, 0.13);
    winkTypo.isTemplateItem = true;
    winkTypo.indexInLayer = @"4";
    winkTypo.text = @"윙크발사?!";
    winkTypo.textView.text = @"윙크발사";
    winkTypo.typo = wink;
    [self.texts addObject:winkTypo];

    Text *murdertypo = [[Text alloc] init];
    DinggoMurder *murder = [DinggoMurder dinggoMurder];
    murdertypo.scale = 0.2;
    murdertypo.center = CGPointMake(0.75, 0.12);
    murdertypo.isTemplateItem = true;
    murdertypo.indexInLayer = @"3";
    murdertypo.text = @"살인미소?!";
    murdertypo.textView.text = @"살인미소?!";
    murdertypo.typo = murder;
    [self.texts addObject:murdertypo];

    Text *binggoTypo = [[Text alloc] init];
    DinggoBingoTypo *binggo = [DinggoBingoTypo dinggoBingoTypo];
    binggoTypo.scale = 0.13;
    binggoTypo.center = CGPointMake(0.92, 0.06);
    binggoTypo.isTemplateItem = true;
    binggoTypo.indexInLayer = @"4";
    binggoTypo.text = @"bingo";
    binggoTypo.textView.text = @"bingo";
    binggoTypo.typo = binggo;
    [self.texts addObject:binggoTypo];
    
    Text *kpopTyop = [[Text alloc] init];
    DigitalTypo *kpop = [DigitalTypo digitalTypo];
    kpopTyop.scale = 0.255;
    kpopTyop.center = CGPointMake(0.35,0.75);
    kpopTyop.isTemplateItem = true;
    kpopTyop.indexInLayer = @"5";
    kpopTyop.text = @"케이팝";
    kpopTyop.textView.text = @"케이팝";
    kpopTyop.typo = kpop;
    
    Text *numberOne = [[Text alloc] init];
    DigitalTypo *yellow = [DigitalTypo digitalTypo];
    yellow.textColor = [UIColor colorWithRed:(252/255.0) green:(237/255.0) blue:(53/255.0) alpha:1] ;
    numberOne.scale = 0.255;
    numberOne.center = CGPointMake(0.64,0.75);
    numberOne.isTemplateItem = true;
    numberOne.indexInLayer = @"5";
    numberOne.text = @"넘버원";
    numberOne.textView.text = @"넘버원";
    numberOne.typo = yellow;

    [self.texts addObject:kpopTyop];
    [self.texts addObject:numberOne];


    Text *kpopTypo2 = [[Text alloc] init];
    DigitalTypo *kpop2 = [DigitalTypo digitalTypo];
    kpopTypo2.scale = 0.43;
    kpopTypo2.center = CGPointMake(0.31, 0.9);
    kpopTypo2.isTemplateItem = true;
    kpopTypo2.indexInLayer = @"6";
    kpopTypo2.text = @"승부욕그룹";
    kpopTypo2.textView.text = @"승부욕그룹";
    kpopTypo2.typo = kpop2;

    Text *girlFriend = [[Text alloc] init];
    DigitalTypo *pink = [DigitalTypo digitalTypo];
    pink.textColor = [UIColor colorWithRed:(252/255.0) green:(46/255.0) blue:(108/255.0) alpha:1];
    girlFriend.scale = 0.36;
    girlFriend.center = CGPointMake(0.72, 0.9);
    girlFriend.isTemplateItem = true;
    girlFriend.indexInLayer = @"6";
    girlFriend.text = @"남자친구";
    girlFriend.textView.text = @"남자친구";
    girlFriend.typo = pink;

    [self.texts addObject:kpopTypo2];
    [self.texts addObject:girlFriend];


}


@end
