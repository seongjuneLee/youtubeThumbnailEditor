//
//  VisitingCompanyTemplate.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "VisitingCompanyVlogTemplate.h"

@implementation VisitingCompanyVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"visitingCompanyPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"visitingCompanyVlogTemplate";
        
    }
    return self;
    
}

+(VisitingCompanyVlogTemplate*)visitingCompanyVlogTemplate{
    
    VisitingCompanyVlogTemplate* visitingCompanyVlogTemplate = [[self alloc] init];
    
    return visitingCompanyVlogTemplate;
    
}

-(void)setUpMainFrames{
    
    VisitingCompanyVlogMainFrame *mainFrame = [VisitingCompanyVlogMainFrame visitingCompanyVlogMainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isBasePhotoFrame = true;
    fullRectPhotoFrame.relativeCenter = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:fullRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //YouTube Originals
    Text *originalsText = [[Text alloc] init];
    VlogOriginal *originals = [VlogOriginal vlogOriginal];
    originalsText.scale = 0.28;
    originalsText.relativeCenter = CGPointMake(0.17, 0.1);
    originalsText.isTemplateItem = true;
    originalsText.indexInLayer = @"0";
    originalsText.text = @"YouTube Originals";
    originalsText.textView.text = originalsText.text;
    originalsText.typo = originals;
    [self.texts addObject:originalsText];
    
    //MAKING FILM
    Text *makingFilmText = [[Text alloc] init];
    VlogMakingFilmTypo *makingFilm = [VlogMakingFilmTypo vlogMakingFilmTypo];
    makingFilmText.scale = 0.145;
    makingFilmText.relativeCenter = CGPointMake(0.885, 0.43);
    makingFilmText.isTemplateItem = true;
    makingFilmText.indexInLayer = @"1";
    makingFilmText.text = @"MAKING\nFILM";
    makingFilmText.textView.text = makingFilmText.text;
    makingFilmText.typo = makingFilm;
    [self.texts addObject:makingFilmText];
    
    //은우의
    Text *eunwooText = [[Text alloc] init]; //타이포 변경
    VlogVisitingCompanyTypo *eunwoo = [VlogVisitingCompanyTypo vlogVisitingCompanyTypo];
    eunwoo.borderWidth = 3;
    eunwoo.borderColor = UIColor.whiteColor;
    eunwooText.scale = 0.33;
    eunwooText.relativeCenter = CGPointMake(0.175, 0.665);
    eunwooText.isTemplateItem = true;
    eunwooText.indexInLayer = @"2";
    eunwooText.text = @"은우의";
    eunwooText.textView.text = eunwooText.text;
    eunwooText.typo = eunwoo;
    [self.texts addObject:eunwooText];
    
    //회사탐방 VLOG
    Text *visitingCompanyText = [[Text alloc] init];
    VlogVisitingCompanyTypo *visitingCompany = [VlogVisitingCompanyTypo vlogVisitingCompanyTypo];
    visitingCompanyText.scale = 0.715;
    visitingCompanyText.relativeCenter = CGPointMake(0.365, 0.86);
    visitingCompanyText.isTemplateItem = true;
    visitingCompanyText.indexInLayer = @"3";
    visitingCompanyText.text = @"회사탐방VLOG";
    visitingCompanyText.textView.text = visitingCompanyText.text;
    visitingCompanyText.typo = visitingCompany;
    [self.texts addObject:visitingCompanyText];
    
}

-(void)setUpStickers{

    VlogVideoSticker *vlogVideoSticker = [VlogVideoSticker vlogVideoSticker];
    vlogVideoSticker.indexInLayer = @"4";
    vlogVideoSticker.scale = 0.2;
    vlogVideoSticker.isTemplateItem = true;
    vlogVideoSticker.relativeCenter = CGPointMake(0.895, 0.2);
    [self.stickers addObject:vlogVideoSticker];
    
}

@end
