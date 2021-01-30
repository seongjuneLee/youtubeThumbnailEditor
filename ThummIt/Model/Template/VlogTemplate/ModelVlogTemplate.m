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
        
    }
    return self;
    
}

+(ModelVlogTemplate*)modelVlogTemplate{
    
    ModelVlogTemplate* modelVlogTemplate = [[self alloc] init];
    
    return modelVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isFixedPhotoFrame = true;
    fullRectPhotoFrame.center = CGPointMake(0.5, 0.5);
    fullRectPhotoFrame.baseView.backgroundColor = UIColor.lightGrayColor;
    [self.photoFrames addObject:fullRectPhotoFrame];
    
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth = screenWidth * 0.19;
    
    PhotoFrame *photoFrame1 = [[PhotoFrame alloc] init];
    photoFrame1.isTemplateItem = true;
    photoFrame1.backgroundImageName = @"polaroidPhotoFrame";
    photoFrame1.baseView.backgroundColor = UIColor.whiteColor;
    photoFrame1.baseView.frameSize = CGSizeMake(frameWidth, frameWidth);
    photoFrame1.rotationDegree = degreesToRadians(350);
    photoFrame1.center = CGPointMake(0.23, 0.21);
    [self.photoFrames addObject:photoFrame1];
    
    
    PhotoFrame *photoFrame2 = [[PhotoFrame alloc] init];
    photoFrame2.isTemplateItem = true;
    photoFrame2.backgroundImageName = @"polaroidPhotoFrame";
    photoFrame2.baseView.backgroundColor = UIColor.whiteColor;
    photoFrame2.baseView.frameSize = CGSizeMake(frameWidth, frameWidth);
    photoFrame2.rotationDegree = degreesToRadians(10);
    photoFrame2.center = CGPointMake(0.13, 0.43);
    [self.photoFrames addObject:photoFrame2];
    
    PhotoFrame *photoFrame3 = [[PhotoFrame alloc] init];
    photoFrame3.isTemplateItem = true;
    photoFrame3.backgroundImageName = @"polaroidPhotoFrame";
    photoFrame3.baseView.backgroundColor = UIColor.whiteColor;
    photoFrame3.baseView.frameSize = CGSizeMake(frameWidth, frameWidth);
    photoFrame3.rotationDegree = degreesToRadians(350);
    photoFrame3.center = CGPointMake(0.18, 0.75);
    [self.photoFrames addObject:photoFrame3];
    
}

-(void)setUpTexts{
    
    //피팅 모델의
    Text *modelText = [[Text alloc] init];
    VlogModel *base = [VlogModel vlogModel];
    modelText.scale = 0.88;
    modelText.center = CGPointMake(0.82, 0.44);
    modelText.isTemplateItem = true;
    modelText.text = @"피팅 모델의\n여름 일상\n브이로그";
    modelText.textView.text = modelText.text;
    
    VlogModel *fitting = [VlogModel vlogModel];
    fitting.textColor = [UIColor colorWithRed:(208/255.0) green:(145/255.0) blue:(116/255.0) alpha:1];
    VlogModel *thirdLine = [VlogModel vlogModel];
    thirdLine.fontSize += 16;
    
    modelText.typoRangeArray = (NSMutableArray *)@[@[fitting,@"0-2"], @[thirdLine,@"13-4"]];
    [modelText applyTypo:base];
    [self.texts addObject:modelText];
    //폰트 크기가 range가 적용 안됨
}

-(void)setUpStickers{
    

}

@end
