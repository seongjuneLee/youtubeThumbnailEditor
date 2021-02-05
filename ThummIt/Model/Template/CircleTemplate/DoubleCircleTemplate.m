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
        self.backgroundImageName = @"";
        
    }
    return self;
    
}

+(DoubleCircleTemplate*)doubleCircleTemplate{
    
    DoubleCircleTemplate* doubleCircleTemplate = [[self alloc] init];
    return doubleCircleTemplate;
    
}

-(void)setUpPhotoFrame{
    
    PhotoFrame *firstPhotoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    PhotoFrame *secondPhotoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    firstPhotoFrame.center = CGPointMake(0.31, 0.5);
    firstPhotoFrame.scale = 0.5;
    firstPhotoFrame.isTemplateItem = true;

    secondPhotoFrame.center = CGPointMake(0.75, 0.5);
    secondPhotoFrame.scale = 0.4;
    secondPhotoFrame.isTemplateItem = true;
    firstPhotoFrame.indexInLayer = @"0";
    secondPhotoFrame.indexInLayer = @"1";

    [self.photoFrames addObject:firstPhotoFrame];
    [self.photoFrames addObject:secondPhotoFrame];

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
    behindTypo.scale = 0.15;
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
    DinggoKpopTypo *kpop = [DinggoKpopTypo dinggoKpopTypo];
    kpopTyop.scale = 0.58;
    kpopTyop.center = CGPointMake(0.5,0.75);
    kpopTyop.isTemplateItem = true;
    kpopTyop.indexInLayer = @"5";
    kpopTyop.text = @"케이팝 넘버원";
    kpopTyop.textView.text = @"케이팝 넘버원";
    kpopTyop.typo = kpop;
    
    DinggoKpopTypo *yellow = [DinggoKpopTypo dinggoKpopTypo];
    yellow.textColor = [UIColor colorWithRed:(252/255.0) green:(237/255.0) blue:(53/255.0) alpha:1] ;
    kpopTyop.typoRangeArray = (NSMutableArray *)@[@[yellow,@"4-3"]];
    [self.texts addObject:kpopTyop];


    Text *kpopTypo2 = [[Text alloc] init];
    DinggoKpopTypo *kpop2 = [DinggoKpopTypo dinggoKpopTypo];
    kpopTypo2.scale = 0.82;
    kpopTypo2.center = CGPointMake(0.5, 0.9);
    kpopTypo2.isTemplateItem = true;
    kpopTypo2.indexInLayer = @"6";
    kpopTypo2.text = @"승부욕 그룹 납자친구";
    kpopTypo2.textView.text = @"승부욕 그룹 남자친구";
    kpopTypo2.typo = kpop2;

    DinggoKpopTypo *pink = [DinggoKpopTypo dinggoKpopTypo];
    pink.textColor = [UIColor colorWithRed:(252/255.0) green:(46/255.0) blue:(108/255.0) alpha:1] ;
    kpopTypo2.typoRangeArray = (NSMutableArray *)@[@[pink,@"7-4"]];
    [self.texts addObject:kpopTypo2];


}


@end
