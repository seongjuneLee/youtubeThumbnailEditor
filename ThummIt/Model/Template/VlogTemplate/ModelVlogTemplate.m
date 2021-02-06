//
//  ModelVlogTemplate.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "ModelVlogTemplate.h"

@implementation ModelVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"modelVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"modelVlogTemplate";
        self.backgroundImageName = @"";
        self.backgroundColor = [UIColor colorWithRed:121/255.0 green:148/255.0 blue:195/255.0 alpha:1];
        
    }
    return self;
    
}

+(ModelVlogTemplate*)modelVlogTemplate{
    
    ModelVlogTemplate* modelVlogTemplate = [[self alloc] init];
    return modelVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth = screenWidth * 0.19;
    
    PhotoFrame *photoFrame1 = [[PhotoFrame alloc] init];
    photoFrame1.isTemplateItem = true;
    photoFrame1.indexInLayer = @"0";
    photoFrame1.backgroundImageName = @"polaroidPhotoFrame";
    photoFrame1.baseView.frameSize = CGSizeMake(frameWidth, frameWidth);
    photoFrame1.rotationDegree = -10;
    photoFrame1.center = CGPointMake(0.23, 0.21);
    photoFrame1.scale = 0.19;
    [self.photoFrames addObject:photoFrame1];
    
    
    PhotoFrame *photoFrame2 = [[PhotoFrame alloc] init];
    photoFrame2.isTemplateItem = true;
    photoFrame2.indexInLayer = @"1";
    photoFrame2.backgroundImageName = @"polaroidPhotoFrame";
    photoFrame2.baseView.frameSize = CGSizeMake(frameWidth, frameWidth);
    photoFrame2.rotationDegree = 10;
    photoFrame2.center = CGPointMake(0.13, 0.43);
    photoFrame2.scale = 0.2;
    [self.photoFrames addObject:photoFrame2];
    
    PhotoFrame *photoFrame3 = [[PhotoFrame alloc] init];
    photoFrame3.isTemplateItem = true;
    photoFrame3.indexInLayer = @"2";
    photoFrame3.backgroundImageName = @"polaroidPhotoFrame";
    photoFrame3.baseView.frameSize = CGSizeMake(frameWidth, frameWidth);
    photoFrame3.rotationDegree = -10;
    photoFrame3.center = CGPointMake(0.18, 0.75);
    photoFrame3.scale = 0.2;
    [self.photoFrames addObject:photoFrame3];
    
}

-(void)setUpTexts{
    
    //피팅 모델의
    Text *modelText = [[Text alloc] init];
    VlogModel *base = [VlogModel vlogModel];
    modelText.scale = 0.29;
    modelText.center = CGPointMake(0.82, 0.44);
    modelText.isTemplateItem = true;
    modelText.indexInLayer = @"3";
    modelText.text = @"피팅 모델의\n여름 일상";
    modelText.textView.text = modelText.text;
    
    VlogModel *fitting = [VlogModel vlogModel];
    fitting.textColor = [UIColor colorWithRed:(208/255.0) green:(145/255.0) blue:(116/255.0) alpha:1];
    
    modelText.typoRangeArray = (NSMutableArray *)@[@[fitting,@"0-2"]];
    modelText.typo = base;
    [self.texts addObject:modelText];
    
    //브이로그
    Text *vlogText = [[Text alloc] init];
    VlogModel *vlog = [VlogModel vlogModel];
    vlogText.scale = 0.34;
    vlogText.center = CGPointMake(0.82, 0.64);
    vlogText.isTemplateItem = true;
    vlogText.indexInLayer = @"4";
    vlogText.text = @"브이로그";
    vlogText.textView.text = vlogText.text;
    vlog.fontSize += 16;
    
    vlogText.typo = vlog;
    [self.texts addObject:vlogText];
    
}

-(void)setUpStickers{
    
}

@end
