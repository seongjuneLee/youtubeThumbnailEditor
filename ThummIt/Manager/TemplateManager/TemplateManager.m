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
    
    //entertain
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

    NSArray *entertainTemplatePreviewImages = @[circleTemplate.previewImageName, doubleCircleTemplate.previewImageName, sinseoyugi1Template.previewImageName, sinseoyugi2Template.previewImageName, sinseoyugi3Template.previewImageName, runningMan1Template.previewImageName, runningMan2Template.previewImageName, runningMan3Template.previewImageName, infiniteChallenge1Template.previewImageName, infiniteChallenge2Template.previewImageName, infiniteChallenge3Template.previewImageName, workManTemplate1.previewImageName, workManTemplate2.previewImageName, workManTemplate3.previewImageName];

    //vlog
    Template *twoDivisionTemplate = [TwoDivisionTemplate twoDivisionTemplate];
    Template *quarterDivisionTemplate = [QuarterDivisionTemplate quarterDivisionTemplate];
    Template *visitingCompanyVlogTemplate = [VisitingCompanyVlogTemplate visitingCompanyVlogTemplate];
    Template *italyTripVlogTemplate = [ItalyTripVlogTemplate italyTripVlogTemplate];
    Template *grwmVlogTemplate = [GrwmVlogTemplate grwmVlogTemplate];
    Template *sixToFourVlogTemplate = [SixToFourVlogTemplate sixToFourVlogTemplate];
    Template *cookingVlogTemplate = [CookingVlogTemplate cookingVlogTemplate];
    Template *dailyVlogTemplate = [DailyVlogTemplate dailyVlogTemplate];
    Template *cebuVlogTemplate = [CebuVlogTemplate cebuVlogTemplate];
    Template *macaronVlogTemplate = [MacaronVlogTemplate macaronVlogTemplate];
    Template *modelVlogTemplate = [ModelVlogTemplate modelVlogTemplate];
    Template *kidsVlogTemplate = [KidsVlogTemplate kidsVlogTemplate];
    Template *holidayVlogTemplate = [HolidayVlogTemplate holidayVlogTemplate];
    
//     NSArray *vlogTemplates = @[twoDivisionTemplate,quarterDivisionTemplate, visitingCompanyVlogTemplate, italyTripVlogTemplate, grwmVlogTemplate, sixToFourVlogTemplate, cookingVlogTemplate, dailyVlogTemplate, cebuVlogTemplate, macaronVlogTemplate, modelVlogTemplate, kidsVlogTemplate, holidayVlogTemplate];
    
//     NSArray *vlogTemplatePreviewImages = @[twoDivisionTemplate.previewImageName,quarterDivisionTemplate.previewImageName, visitingCompanyVlogTemplate.previewImageName, italyTripVlogTemplate.previewImageName, grwmVlogTemplate.previewImageName, sixToFourVlogTemplate.previewImageName, cookingVlogTemplate.previewImageName, dailyVlogTemplate.previewImageName, cebuVlogTemplate.previewImageName, macaronVlogTemplate.previewImageName, modelVlogTemplate.previewImageName, kidsVlogTemplate.previewImageName, holidayVlogTemplate.previewImageName];
    
    NSArray *vlogTemplates = @[twoDivisionTemplate,quarterDivisionTemplate,craftVlogTemplate,lookBookVlogTemplate,stayingHomeVlogTemplate,babyVlogTemplate,summerVlogTemplate,dogVlogTemPlate,freshmanVlogTemplate,studentVlogTemplate,webDesignerVlogTemPlate];
    NSArray *vlogTemplatePreviewImages =  @[twoDivisionTemplate.previewImageName,quarterDivisionTemplate.previewImageName,craftVlogTemplate.previewImageName,lookBookVlogTemplate.previewImageName,stayingHomeVlogTemplate.previewImageName,babyVlogTemplate.previewImageName,summerVlogTemplate.previewImageName,dogVlogTemPlate.previewImageName,freshmanVlogTemplate.previewImageName,studentVlogTemplate.previewImageName,webDesignerVlogTemPlate.previewImageName];
    self.templatePreviewImages = @[entertainTemplatePreviewImages, vlogTemplatePreviewImages];
    NSArray *templates = @[entertainTemplates, vlogTemplates];
    
    return templates;
    
}


@end
