//
//  QuarterDivisionTemplate.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "QuarterDivisionTemplate.h"
@implementation QuarterDivisionTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"quarterDivisionPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"quarterDivisionTemplate";
        
    }
    return self;
    
}

+(QuarterDivisionTemplate*)quarterDivisionTemplate{
    
    QuarterDivisionTemplate* quarterDivisionTemplate = [[self alloc] init];
    
    return quarterDivisionTemplate;
    
}

-(void)setUpMainFrames{
    
}

-(void)setUpPhotoFrame{
    
    QuarterRectangle *firstPhotoFrame = [QuarterRectangle quarterRectangle];
    QuarterRectangle *secondPhotoFrame = [QuarterRectangle quarterRectangle];
    QuarterRectangle *thirdPhotoFrame = [QuarterRectangle quarterRectangle];
    QuarterRectangle *fourthPhotoFrame = [QuarterRectangle quarterRectangle];
    firstPhotoFrame.isTemplateItem = true;
    secondPhotoFrame.isTemplateItem = true;
    thirdPhotoFrame.isTemplateItem = true;
    fourthPhotoFrame.isTemplateItem = true;
    firstPhotoFrame.isBasePhotoFrame = true;
    secondPhotoFrame.isBasePhotoFrame = true;
    thirdPhotoFrame.isBasePhotoFrame = true;
    fourthPhotoFrame.isBasePhotoFrame = true;
    firstPhotoFrame.relativeCenter = CGPointMake(0.25, 0.25);
    secondPhotoFrame.relativeCenter = CGPointMake(0.75, 0.25);
    thirdPhotoFrame.relativeCenter = CGPointMake(0.25, 0.75);
    fourthPhotoFrame.relativeCenter = CGPointMake(0.75, 0.75);
    [self.photoFrames addObject:firstPhotoFrame];
    [self.photoFrames addObject:secondPhotoFrame];
    [self.photoFrames addObject:thirdPhotoFrame];
    [self.photoFrames addObject:fourthPhotoFrame];

}

-(void)setUpTexts{
    
    Text *trapezoidText = [[Text alloc] init];
    TrapezoidTypo *trapezoid = [TrapezoidTypo trapezoidTypo];
    trapezoidText.relativeCenter = CGPointMake(0.5, 0.5);
    trapezoidText.rotationDegree = degreesToRadians(-3);
    trapezoidText.scale = 0.35;
    trapezoidText.isTemplateItem = true;
    trapezoidText.text = @"WEEKLY VLOG";
    trapezoidText.indexInLayer = @"0";
    trapezoidText.typo = trapezoid;
    [self.texts addObject:trapezoidText];
    
}

@end
