//
//  WebDesignerVlogTemPlate.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "WebDesignerVlogTemPlate.h"

@implementation WebDesignerVlogTemPlate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"webDesignerVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"webDesignerVlogTemPlate";
        self.backgroundImageName = @"webDesignerVlogFrame";
        
    }
    return self;
    
}

+(WebDesignerVlogTemPlate*)webDesignerVlogTemPlate{
    
    WebDesignerVlogTemPlate* webDesignerVlogTemPlate = [[self alloc] init];
    
    return webDesignerVlogTemPlate;
    
}

-(void)setUpPhotoFrame{
    
    FullRectangle *photoFrame = [FullRectangle fullRectangle];
    photoFrame.isTemplateItem = true;
    photoFrame.isFixedPhotoFrame = true;
    photoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:photoFrame];
        
}

-(void)setUpTexts{
    
    Text *tagText = [[Text alloc] init];
    VlogCompany *tagvlog = [VlogCompany vlogCompany];
    tagText.scale = 0.5;
    tagText.center = CGPointMake(0.14, 0.11);
    tagText.isTemplateItem = true;
    tagText.indexInLayer =@"0";
    tagText.text = @"회사 Vlog";
    tagText.textView.text = @"회사 Vlog";
    [tagText applyTypo:tagvlog];
    [self.texts addObject:tagText];
    
    Text *undertagText = [[Text alloc] init];
    VlogWebWrite *undertagvlog = [VlogWebWrite vlogWebWrite];
    undertagText.scale = 0.5;
    undertagText.center = CGPointMake(0.15, 0.9);
    undertagText.isTemplateItem = true;
    undertagText.indexInLayer =@"1";
    undertagText.text = @"웹 디자이너편";
    undertagText.textView.text = @"웹 디자이너편";
    [undertagText applyTypo:undertagvlog];
    [self.texts addObject:undertagText];
    
    Text *fistTitleVlog = [[Text alloc] init];
    VlogDesiner *fistTitle = [VlogDesiner vlogDesiner];
    fistTitleVlog.scale = 0.4;
    fistTitleVlog.center = CGPointMake(0.06, 0.41);
    fistTitleVlog.isTemplateItem = true;
    fistTitleVlog.indexInLayer =@"2";
    fistTitleVlog.text = @"웹";
    fistTitleVlog.textView.text = @"웹";
    [fistTitleVlog applyTypo:fistTitle];
    [self.texts addObject:fistTitleVlog];
    
    Text *secondTitleVlog = [[Text alloc] init];
    VlogDesiner *secondTitle = [VlogDesiner vlogDesiner];
    secondTitleVlog.scale = 0.4;
    secondTitleVlog.center = CGPointMake(0.22, 0.58);
    secondTitleVlog.isTemplateItem = true;
    secondTitleVlog.indexInLayer =@"3";
    secondTitleVlog.text = @"디자이너는";
    secondTitleVlog.textView.text = @"디자이너는";
    [secondTitleVlog applyTypo:secondTitle];
    
    VlogDesiner *white = [VlogDesiner vlogDesiner];
    white.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1] ;
    secondTitleVlog.typoRangeArray = (NSMutableArray *)@[@[white,@"4-1"]];
    
    [self.texts addObject:secondTitleVlog];
    
    Text *thirdTitleVlog = [[Text alloc] init];
    VlogDesiner *thirdTitle = [VlogDesiner vlogDesiner];
    thirdTitle.textColor =[UIColor whiteColor];
    thirdTitleVlog.scale = 0.4;
    thirdTitleVlog.center = CGPointMake(0.17, 0.75);
    thirdTitleVlog.isTemplateItem = true;
    thirdTitleVlog.indexInLayer =@"4";
    thirdTitleVlog.text = @"뭐 하지?";
    thirdTitleVlog.textView.text = @"뭐 하지?";
    [thirdTitleVlog applyTypo:thirdTitle];
    [self.texts addObject:thirdTitleVlog];
    
}

-(void)setUpStickers{
    
    
    
}


@end
