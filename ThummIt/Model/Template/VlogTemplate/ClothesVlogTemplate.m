//
//  SixToFourTemplate.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "ClothesVlogTemplate.h"

@implementation ClothesVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"sixToFourVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"sixToFourVlogTemplate";
        self.backgroundImageName = @"sixToFourVlogFrame";
        
    }
    return self;
    
}

+(ClothesVlogTemplate*)sixToFourVlogTemplate{
    
    ClothesVlogTemplate* sixToFourVlogTemplate = [[self alloc] init];

    return sixToFourVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    PhotoFrame *photoFrame1 = [ClothesTemplateRect1 clothesTemplateRect1];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isFixedPhotoFrame = true;
    photoFrame1.center = CGPointMake(0.275, 0.5);
    [self.photoFrames addObject:photoFrame1];
    
    PhotoFrame *photoFrame2 = [ClothesTemplateRect2 clothesTemplateRect2];
    photoFrame2.isTemplateItem = true;
    photoFrame2.isFixedPhotoFrame = true;
    photoFrame2.center = CGPointMake(0.775, 0.5);
    [self.photoFrames addObject:photoFrame2];
    
}

-(void)setUpTexts{
    
    //VLOG
    Text *vlogText = [[Text alloc] init];
    VlogMyeongjoTypo *myeongjo = [VlogMyeongjoTypo vlogMyeongjoTypo];
    vlogText.scale = 0.25;
    vlogText.center = CGPointMake(0.5, 0.5);
    vlogText.isTemplateItem = true;
    vlogText.indexInLayer = @"0";
    vlogText.text = @"VLOG";
    vlogText.textView.text = vlogText.text;
    vlogText.typo = myeongjo;
    [self.texts addObject:vlogText];
    
}

@end
