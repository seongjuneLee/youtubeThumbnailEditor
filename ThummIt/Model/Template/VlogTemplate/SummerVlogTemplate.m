//
//  SummerVlogTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "SummerVlogTemplate.h"

@implementation SummerVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"summerVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"SummerVlogTemplate";
        self.backgroundImageName = @"summerVlogFrame";
        
    }
    return self;
    
}

+(SummerVlogTemplate*)summerVlogTemplate{
    
    SummerVlogTemplate* summerVlogTemplate = [[self alloc] init];
    
    return summerVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    FullRectangle *photoFrame = [FullRectangle fullRectangle];
    photoFrame.isTemplateItem = true;
    photoFrame.isFixedPhotoFrame = true;
    photoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:photoFrame];
        
}

-(void)setUpTexts{
    
    Text *vlogText = [[Text alloc] init];
    VlogSummerTypo *vlog = [VlogSummerTypo vlogSummerTypo];
    vlogText.scale = 0.4;
    vlogText.center = CGPointMake(0.5, 0.5);
    vlogText.isTemplateItem = true;
    vlogText.indexInLayer =@"0";
    vlogText.text = @"Summer Vlog";
    vlogText.textView.text = @"Summer Vlog";
    [vlogText applyTypo:vlog];
    [self.texts addObject:vlogText];
    
}

-(void)setUpStickers{
    
    
    
}
@end
