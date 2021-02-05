//
//  LookBookVlogTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "LookBookVlogTemplate.h"

@implementation LookBookVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"lookBookVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"LookBookVlogTemplate";
        self.backgroundImageName = @"lookBookVlogFrame";
        
    }
    return self;
    
}

+(LookBookVlogTemplate*)lookBookVlogTemplate{
    
    LookBookVlogTemplate* lookBookVlogTemplate = [[self alloc] init];
    
    return lookBookVlogTemplate;
    
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
    VlogLookbookTypo *vlog = [VlogLookbookTypo vlogLookbookTypo];
    vlogText.scale = 0.27;
    vlogText.center = CGPointMake(0.77, 0.43);
    vlogText.isTemplateItem = true;
    vlogText.indexInLayer =@"0";
    vlogText.text = @"룩북\n브이로그";
    vlogText.textView.text = @"룩북\n브이로그";
    [vlogText applyTypo:vlog];
    
    [self.texts addObject:vlogText];
    
}

-(void)setUpStickers{
    
}

@end
