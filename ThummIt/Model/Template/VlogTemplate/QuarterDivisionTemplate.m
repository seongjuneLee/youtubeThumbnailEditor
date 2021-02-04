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
        self.backgroundImageName = @"";
        
    }
    return self;
    
}

+(QuarterDivisionTemplate*)quarterDivisionTemplate{
    
    QuarterDivisionTemplate* quarterDivisionTemplate = [[self alloc] init];
    
    return quarterDivisionTemplate;
    
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
    firstPhotoFrame.isFixedPhotoFrame = true;
    secondPhotoFrame.isFixedPhotoFrame = true;
    thirdPhotoFrame.isFixedPhotoFrame = true;
    fourthPhotoFrame.isFixedPhotoFrame = true;
    firstPhotoFrame.center = CGPointMake(0.25, 0.25);
    secondPhotoFrame.center = CGPointMake(0.75, 0.25);
    thirdPhotoFrame.center = CGPointMake(0.25, 0.75);
    fourthPhotoFrame.center = CGPointMake(0.75, 0.75);
    [self.photoFrames addObject:firstPhotoFrame];
    [self.photoFrames addObject:secondPhotoFrame];
    [self.photoFrames addObject:thirdPhotoFrame];
    [self.photoFrames addObject:fourthPhotoFrame];

}

-(void)setUpTexts{
    
    Text *trapezoidText = [[Text alloc] init];
    TrapezoidTypo *trapezoid = [TrapezoidTypo trapezoidTypo];
    trapezoidText.center = CGPointMake(0.5, 0.5);
    trapezoidText.rotationDegree = -3;
    trapezoidText.isTemplateItem = true;
    trapezoidText.text = @"WEEKLY VLOG";
    trapezoidText.indexInLayer = @"0";
    [trapezoidText applyTypo:trapezoid];
    [self.texts addObject:trapezoidText];
    
}

@end
