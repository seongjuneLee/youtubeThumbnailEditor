//
//  StudentVlogTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "StudentVlogTemplate.h"

@implementation StudentVlogTemplate


-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"studentVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"StudentVlogTemplate";
        self.backgroundImageName = @"studentVlogFrame";
        
    }
    return self;
    
}

+(StudentVlogTemplate*)studentVlogTemplate{
    
    StudentVlogTemplate* studentVlogTemplate = [[self alloc] init];
    
    return studentVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    PhotoFrame *photoFrame1 = [[PhotoFrame alloc] init];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isFixedPhotoFrame = true;
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth = screenWidth * 0.333;
    photoFrame1.baseView.backgroundColor = UIColor.grayColor;
    photoFrame1.baseView.frameSize = CGSizeMake(frameWidth, screenWidth * 9/16);
    photoFrame1.center = CGPointMake(0.166, 0.5);
    [self.photoFrames addObject:photoFrame1];

    PhotoFrame *photoFrame2 = [[PhotoFrame alloc] init];
    photoFrame2.isTemplateItem = true;
    photoFrame2.isFixedPhotoFrame = true;
    photoFrame2.baseView.backgroundColor = UIColor.grayColor;
    photoFrame2.baseView.frameSize = CGSizeMake(frameWidth, screenWidth * 9/16);
    photoFrame2.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:photoFrame2];

    PhotoFrame *photoFrame3 = [[PhotoFrame alloc] init];
    photoFrame3.isTemplateItem = true;
    photoFrame3.isFixedPhotoFrame = true;
    photoFrame3.baseView.backgroundColor = UIColor.grayColor;
    photoFrame3.baseView.frameSize = CGSizeMake(frameWidth, screenWidth * 9/16);
    photoFrame3.center = CGPointMake(0.834, 0.5);
    [self.photoFrames addObject:photoFrame3];
  
        
}

-(void)setUpTexts{
    //italic
    
    Text *firstVlogText = [[Text alloc] init];
    VlogStudentTypo *firstVlog = [VlogStudentTypo vlogStudentTypo];
    firstVlogText.scale = 0.9;
    firstVlogText.center = CGPointMake(0.166, 0.5);
    firstVlogText.isTemplateItem = true;
    firstVlogText.indexInLayer =@"0";
    firstVlogText.text = @"수업";
    firstVlogText.textView.text = @"수업";
    [firstVlogText applyTypo:firstVlog];
    [self.texts addObject:firstVlogText];
    
    Text *secondVlogText = [[Text alloc] init];
    VlogStudentTypo *secondVlog = [VlogStudentTypo vlogStudentTypo];
    secondVlog.textColor = [UIColor colorWithRed:(228/255.0) green:(188/255.0) blue:(152/255.0) alpha:1] ;
    secondVlogText.scale = 0.9;
    secondVlogText.center = CGPointMake(0.5, 0.5);
    secondVlogText.isTemplateItem = true;
    secondVlogText.indexInLayer =@"1";
    secondVlogText.text = @"도서관";
    secondVlogText.textView.text = @"도서관";
    [secondVlogText applyTypo:secondVlog];
    
    
    [self.texts addObject:secondVlogText];
    
    Text *thirdVlogText = [[Text alloc] init];
    VlogStudentTypo *thirdVlog = [VlogStudentTypo vlogStudentTypo];
    thirdVlog.textColor = [UIColor colorWithRed:(233/255.0) green:(128/255.0) blue:(105/255.0) alpha:1] ;
    thirdVlogText.scale = 0.9;
    thirdVlogText.center = CGPointMake(0.834, 0.5);
    thirdVlogText.isTemplateItem = true;
    thirdVlogText.indexInLayer =@"2";
    thirdVlogText.text = @"학식";
    thirdVlogText.textView.text = @"학식";
    [thirdVlogText applyTypo:thirdVlog];
    
    [self.texts addObject:thirdVlogText];
    
    Text *whiteTitleVlogText = [[Text alloc] init];
    VlogStudentTypo *whiteTitleVlog = [VlogStudentTypo vlogStudentTypo];
    whiteTitleVlog.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1] ;
    whiteTitleVlogText.scale = 1.2;
    whiteTitleVlogText.center = CGPointMake(0.385, 0.9);
    whiteTitleVlogText.isTemplateItem = true;
    whiteTitleVlogText.indexInLayer =@"3";
    whiteTitleVlogText.text = @"하루종일 혼자 다녔다";
    whiteTitleVlogText.textView.text = @"하루종일 혼자 다녔다";
    [whiteTitleVlogText applyTypo:whiteTitleVlog];
    
    [self.texts addObject:whiteTitleVlogText];
    
    Text *skinVlogText = [[Text alloc] init];
    VlogStudentTypo *skinVlog = [VlogStudentTypo vlogStudentTypo];
    skinVlog.textColor = [UIColor colorWithRed:(251/255.0) green:(189/255.0) blue:(186/255.0) alpha:1] ;
    skinVlogText.scale = 0.95;
    skinVlogText.center = CGPointMake(0.18, 0.73);
    skinVlogText.isTemplateItem = true;
    skinVlogText.indexInLayer =@"4";
    skinVlogText.text = @"대학 복학생";
    skinVlogText.textView.text = @"대학 복학생";
    [skinVlogText applyTypo:skinVlog];
    
    [self.texts addObject:skinVlogText];
    
    Text *greenVlogText = [[Text alloc] init];
    VlogStudentTypo *greenVlog = [VlogStudentTypo vlogStudentTypo];
    greenVlog.textColor = [UIColor colorWithRed:(244/255.0) green:(235/255.0) blue:(168/255.0) alpha:1] ;
    greenVlogText.scale = 0.95;
    greenVlogText.center = CGPointMake(0.505, 0.73);
    greenVlogText.isTemplateItem = true;
    greenVlogText.indexInLayer =@"5";
    greenVlogText.text = @"아싸 Vlog";
    greenVlogText.textView.text = @"아싸 Vlog";
    [greenVlogText applyTypo:greenVlog];
    
    [self.texts addObject:greenVlogText];
    
}

-(void)setUpStickers{
    
    
    
}



@end
