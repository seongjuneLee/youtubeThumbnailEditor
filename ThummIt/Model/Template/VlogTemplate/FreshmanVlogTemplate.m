//
//  FreshmanVlogTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "FreshmanVlogTemplate.h"

@implementation FreshmanVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"freshmanVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"FreshmanVlogTemplate";
        self.backgroundImageName = @"freshmanVlogFrame";
        
    }
    return self;
    
}

+(FreshmanVlogTemplate*)freshmanVlogTemplate{
    
    FreshmanVlogTemplate* freshmanVlogTemplate = [[self alloc] init];
    
    return freshmanVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    self.photoFrames = [NSMutableArray new];
    FullRectangle *photoFrame = [FullRectangle fullRectangle];
    photoFrame.isTemplateItem = true;
    photoFrame.isFixedPhotoFrame = true;
    photoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:photoFrame];
        
}

-(void)setUpTexts{
    
    Text *firstVlogText = [[Text alloc] init];
    VlogFreshmanTypo *firstVlog = [VlogFreshmanTypo vlogFreshmanTypo];
    firstVlogText.scale = 1.2;
    firstVlogText.center = CGPointMake(0.83, 0.3);
    firstVlogText.isTemplateItem = true;
    firstVlogText.indexInLayer =@"1";
    firstVlogText.text = @"새내기의";
    firstVlogText.textView.text = @"새내기의";
    [firstVlogText applyTypo:firstVlog];
    [self.texts addObject:firstVlogText];
    
    Text *secondVlogText = [[Text alloc] init];
    VlogFreshmanTypo *secondVlog = [VlogFreshmanTypo vlogFreshmanTypo];
    secondVlogText.scale = 1.2;
    secondVlogText.center = CGPointMake(0.86, 0.5);
    secondVlogText.isTemplateItem = true;
    secondVlogText.indexInLayer =@"2";
    secondVlogText.text = @"일주일";
    secondVlogText.textView.text = @"일주일";
    [secondVlogText applyTypo:secondVlog];
    [self.texts addObject:secondVlogText];
    
    Text *thridVlogText = [[Text alloc] init];
    VlogFreshmanTypo *thirdVlog = [VlogFreshmanTypo vlogFreshmanTypo];
    thridVlogText.scale = 1.2;
    thridVlogText.center = CGPointMake(0.87, 0.7);
    thridVlogText.isTemplateItem = true;
    thridVlogText.indexInLayer =@"3";
    thridVlogText.text = @"vlog";
    thridVlogText.textView.text = @"vlog";
    [thridVlogText applyTypo:thirdVlog];
    [self.texts addObject:thridVlogText];
    
    Text *leftVlogText = [[Text alloc] init];
    VlogNewCampus *leftVlog = [VlogNewCampus vlogNewCampus];
    leftVlogText.scale = 0.42;
    leftVlogText.center = CGPointMake(0.065, 0.05);
    leftVlogText.isTemplateItem = true;
    leftVlogText.indexInLayer =@"4";
    leftVlogText.text = @"Thumm-log";
    leftVlogText.textView.text = @"Thumm-log";
    [leftVlogText applyTypo:leftVlog];
    [self.texts addObject:leftVlogText];
    
}

-(void)setUpStickers{
    
    
    
}



@end
