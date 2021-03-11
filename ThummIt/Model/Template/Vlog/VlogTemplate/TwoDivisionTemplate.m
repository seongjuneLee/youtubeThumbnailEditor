//
//  TwoDivisionTemplate.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "TwoDivisionTemplate.h"

@implementation TwoDivisionTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"twoDivisionPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"twoDivisionTemplate";
        
    }
    return self;
    
}

+(TwoDivisionTemplate*)twoDivisionTemplate{
    
    TwoDivisionTemplate* twoDivisionTemplate = [[self alloc] init];
    
    return twoDivisionTemplate;
    
}

-(void)setUpMainFrames{

}

-(void)setUpPhotoFrame{

    VerticalHalfRectangle *firstPhotoFrame = [VerticalHalfRectangle verticalHalfRectangle];
    VerticalHalfRectangle *secondPhotoFrame = [VerticalHalfRectangle verticalHalfRectangle];
    firstPhotoFrame.isTemplateItem = true;
    secondPhotoFrame.isTemplateItem = true;
    firstPhotoFrame.isBasePhotoFrame = true;
    secondPhotoFrame.isBasePhotoFrame = true;
    firstPhotoFrame.scale = 0.5;
    secondPhotoFrame.scale = 0.5;
    firstPhotoFrame.relativeCenter = CGPointMake(0.25, 0.5);
    secondPhotoFrame.relativeCenter = CGPointMake(0.75, 0.5);
    [self.photoFrames addObject:firstPhotoFrame];
    [self.photoFrames addObject:secondPhotoFrame];
}

-(void)setUpTexts{
    
    Text *leftVlogText = [[Text alloc] init];
    VlogNewCampus *leftVlog = [VlogNewCampus vlogNewCampus];
    leftVlogText.scale = 0.6;
    leftVlogText.relativeCenter = CGPointMake(0.5, 0.5);
    leftVlogText.isTemplateItem = true;
    leftVlogText.indexInLayer =@"0";
    leftVlogText.text = @"Summer Trip";
    leftVlogText.textView.text = @"Summer Trip";
    leftVlogText.typo = leftVlog;
    [self.texts addObject:leftVlogText];
    

}

@end
