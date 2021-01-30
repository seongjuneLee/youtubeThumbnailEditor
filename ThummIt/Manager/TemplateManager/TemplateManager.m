//
//  TemplateManager.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "TemplateManager.h"

@implementation TemplateManager


+ (TemplateManager *)sharedInstance {
    static TemplateManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TemplateManager alloc] init];
        [sharedInstance templateDatas];
    });
    
    return sharedInstance;
}


-(NSArray *)templateDatas{
    
    Template *circleTemplate = [CircleTemplate circleTemplate];
    Template *doubleCircleTemplate = [DoubleCircleTemplate doubleCircleTemplate];
    
    Template *runningMan1Template = [RunningMan1Template runningMan1Template];
    Template *runningMan2Template = [RunningMan2Template runningMan2Template];
    Template *runningMan3Template = [RunningMan3Template runningMan3Template];
    
    Template *sinseoyugi1Template = [SinSeoYuGi1Template sinSeoYuGi1Template];
    Template *sinseoyugi2Template = [SinSeoYuGi2Template sinSeoYuGi2Template];
    Template *sinseoyugi3Template = [SinSeoYuGi3Template sinSeoYuGi3Template];

    Template *workManTemplate1 = [WorkManTemplate1 workManTemplate1];
    Template *workManTemplate2 = [WorkManTemplate2 workManTemplate2];
    Template *workManTemplate3 = [WorkManTemplate3 workManTemplate3];
    
    Template *infiniteChallenge1Template = [InfiniteChallenge1Template infiniteChallenge1Template];
    Template *infiniteChallenge2Template = [InfiniteChallenge2Template infiniteChallenge2Template];
    Template *infiniteChallenge3Template = [InfiniteChallenge3Template infiniteChallenge3Template];
    
    Template * craftVlogTemplate= [CraftVlogTemplate craftVlogTemplate];
    Template * lookBookVlogTemplate= [LookBookVlogTemplate lookBookVlogTemplate];
    Template * stayingHomeVlogTemplate= [StayingHomeVlogTemplate stayingHomeVlogTemplate];
    Template * babyVlogTemplate= [BabyVlogTemplate babyVlogTemplate];
    Template * summerVlogTemplate= [SummerVlogTemplate summerVlogTemplate];
    Template * dogVlogTemPlate= [DogVlogTemPlate dogVlogTemPlate];
    Template * freshmanVlogTemplate= [FreshmanVlogTemplate freshmanVlogTemplate];
    Template * studentVlogTemplate= [StudentVlogTemplate studentVlogTemplate];
    Template * webDesignerVlogTemPlate= [WebDesignerVlogTemPlate webDesignerVlogTemPlate];
    

    NSArray *entertainTemplates = @[circleTemplate, doubleCircleTemplate, sinseoyugi1Template, sinseoyugi2Template, sinseoyugi3Template, runningMan1Template, runningMan2Template, runningMan3Template, infiniteChallenge1Template, infiniteChallenge2Template, infiniteChallenge3Template, workManTemplate1, workManTemplate2, workManTemplate3];

    NSArray *entertainTemplatePreviewImages = @[circleTemplate.previewImageName, doubleCircleTemplate.previewImageName, sinseoyugi1Template.previewImageName,runningMan1Template.previewImageName, infiniteChallenge1Template.previewImageName, infiniteChallenge2Template.previewImageName, workManTemplate1.previewImageName, workManTemplate2.previewImageName, workManTemplate3.previewImageName];

    
    Template *twoDivisionTemplate = [TwoDivisionTemplate twoDivisionTemplate];
    Template *quarterDivisionTemplate = [QuarterDivisionTemplate quarterDivisionTemplate];
    NSArray *vlogTemplates = @[twoDivisionTemplate,quarterDivisionTemplate,craftVlogTemplate,lookBookVlogTemplate,stayingHomeVlogTemplate,babyVlogTemplate,summerVlogTemplate,dogVlogTemPlate,freshmanVlogTemplate,studentVlogTemplate,webDesignerVlogTemPlate];
    NSArray *vlogTemplatePreviewImages =  @[twoDivisionTemplate.previewImageName,quarterDivisionTemplate.previewImageName,craftVlogTemplate.previewImageName,lookBookVlogTemplate.previewImageName,stayingHomeVlogTemplate.previewImageName,babyVlogTemplate.previewImageName,summerVlogTemplate.previewImageName,dogVlogTemPlate.previewImageName,freshmanVlogTemplate.previewImageName,studentVlogTemplate.previewImageName,webDesignerVlogTemPlate.previewImageName];
    self.templatePreviewImages = @[entertainTemplatePreviewImages, vlogTemplatePreviewImages];
    NSArray *templates = @[entertainTemplates, vlogTemplates];
    return templates;

    
}


@end
