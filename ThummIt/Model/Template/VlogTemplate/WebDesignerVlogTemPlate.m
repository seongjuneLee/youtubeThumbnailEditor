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
    tagText.scale = 0.17;
    tagText.center = CGPointMake(0.15, 0.11);
    tagText.isTemplateItem = true;
    tagText.indexInLayer =@"0";
    tagText.text = @"회사 Vlog";
    tagText.textView.text = @"회사 Vlog";
    tagText.typo = tagvlog;
    [self.texts addObject:tagText];
    
    Text *undertagText = [[Text alloc] init];
    VlogWebWrite *undertagvlog = [VlogWebWrite vlogWebWrite];
    undertagText.scale = 0.26;
    undertagText.center = CGPointMake(0.155, 0.91);
    undertagText.isTemplateItem = true;
    undertagText.indexInLayer =@"1";
    undertagText.text = @"웹 디자이너편";
    undertagText.textView.text = @"웹 디자이너편";
    undertagText.typo = undertagvlog;
    [self.texts addObject:undertagText];
    
    Text *titleVlog = [[Text alloc] init];
    VlogDesiner *title = [VlogDesiner vlogDesiner];
    titleVlog.scale = 0.44;
    titleVlog.center = CGPointMake(0.23, 0.55);
    titleVlog.isTemplateItem = true;
    titleVlog.indexInLayer =@"3";
    titleVlog.text = @"웹\n디자이너는\n뭐 하지?";
    titleVlog.textView.text = titleVlog.text;
    titleVlog.textAlignment = NSTextAlignmentLeft;
    titleVlog.typo = title;
    
    VlogDesiner *white = [VlogDesiner vlogDesiner];
    white.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1] ;
    titleVlog.typoRangeArray = (NSMutableArray *)@[@[white,@"6-7"]];
    [self.texts addObject:titleVlog];
    
}

-(void)setUpStickers{
    
}

@end
