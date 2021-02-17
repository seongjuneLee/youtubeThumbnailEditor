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
    
    //TV entertain
    
    Template *runningMan1Template = [RunningMan1Template runningMan1Template];
    Template *runningMan2Template = [RunningMan2Template runningMan2Template];
    Template *runningMan3Template = [RunningMan3Template runningMan3Template];
    
    Template *sinseoyugi1Template = [SinSeoYuGi1Template sinSeoYuGi1Template];
    Template *sinseoyugi2Template = [SinSeoYuGi2Template sinSeoYuGi2Template];
    Template *sinseoyugi3Template = [SinSeoYuGi3Template sinSeoYuGi3Template];
    
    Template *infiniteChallenge1Template = [InfiniteChallenge1Template infiniteChallenge1Template];
    Template *infiniteChallenge2Template = [InfiniteChallenge2Template infiniteChallenge2Template];
//    Template *infiniteChallenge3Template = [InfiniteChallenge3Template infiniteChallenge3Template]; // 다음 업데이트에 추가

    NSArray *tvEntertainTemplates = @[sinseoyugi1Template, sinseoyugi2Template, sinseoyugi3Template, runningMan1Template, runningMan2Template, runningMan3Template, infiniteChallenge1Template, infiniteChallenge2Template];

    NSArray *tvEntertainTemplatePreviewImages = @[ sinseoyugi1Template.previewImageName,sinseoyugi2Template.previewImageName,sinseoyugi3Template.previewImageName,runningMan1Template.previewImageName,runningMan2Template.previewImageName,runningMan3Template.previewImageName ,infiniteChallenge1Template.previewImageName, infiniteChallenge2Template.previewImageName];
    
    // youtube entertain
    
    Template *circleTemplate = [CircleTemplate circleTemplate];
    Template *doubleCircleTemplate = [DoubleCircleTemplate doubleCircleTemplate];
    
    Template *workManTemplate1 = [WorkManTemplate1 workManTemplate1];
    Template *workManTemplate2 = [WorkManTemplate2 workManTemplate2];
    Template *workManTemplate3 = [WorkManTemplate3 workManTemplate3];
    
    NSArray *youtubeEntertainTemplates = @[circleTemplate, doubleCircleTemplate, workManTemplate1, workManTemplate2, workManTemplate3];

    NSArray *youtubeEntertainTemplatePreviewImages = @[circleTemplate.previewImageName, doubleCircleTemplate.previewImageName ,workManTemplate1.previewImageName, workManTemplate2.previewImageName, workManTemplate3.previewImageName];
    
    //trip vlog
    
    Template *twoDivisionTemplate = [TwoDivisionTemplate twoDivisionTemplate];
    Template *quarterDivisionTemplate = [QuarterDivisionTemplate quarterDivisionTemplate];
    Template *italyTripVlogTemplate = [ItalyTripVlogTemplate italyTripVlogTemplate];
    Template *cebuVlogTemplate = [CebuVlogTemplate cebuVlogTemplate];
    Template *holidayVlogTemplate = [HolidayVlogTemplate holidayVlogTemplate];
    
    NSArray *tripVlogTemplates = @[twoDivisionTemplate,quarterDivisionTemplate,italyTripVlogTemplate,cebuVlogTemplate,holidayVlogTemplate];
    NSArray *tripVlogTemplatePreviewImages =  @[twoDivisionTemplate.previewImageName,quarterDivisionTemplate.previewImageName,italyTripVlogTemplate.previewImageName,cebuVlogTemplate.previewImageName,holidayVlogTemplate.previewImageName];
    
    //school vlog
    
    Template * freshmanVlogTemplate= [FreshmanVlogTemplate freshmanVlogTemplate];
    Template * studentVlogTemplate= [StudentVlogTemplate studentVlogTemplate];
    Template * danceVlogTemplate= [DanceVlogTemplate danceVlogTemplate];
    Template * studyVlogTemplate= [StudyVlogTemplate studyVlogTemplate];
    
    NSArray *schoolVlogTemplates = @[freshmanVlogTemplate,studentVlogTemplate,danceVlogTemplate,studyVlogTemplate];
    NSArray *schoolVlogTemplatePreviewImages =  @[freshmanVlogTemplate.previewImageName,studentVlogTemplate.previewImageName,danceVlogTemplate.previewImageName,studyVlogTemplate.previewImageName];

    
    //daily vlog
    
    
    Template *visitingCompanyVlogTemplate = [VisitingCompanyVlogTemplate visitingCompanyVlogTemplate];
    Template * craftVlogTemplate= [CraftVlogTemplate craftVlogTemplate];
    Template * lookBookVlogTemplate= [LookBookVlogTemplate lookBookVlogTemplate];
    Template * stayingHomeVlogTemplate= [StayingHomeVlogTemplate stayingHomeVlogTemplate];
    Template * babyVlogTemplate= [BabyVlogTemplate babyVlogTemplate];
    Template * summerVlogTemplate= [SummerVlogTemplate summerVlogTemplate];
    Template * dogVlogTemPlate= [DogVlogTemplate dogVlogTemPlate];
    Template * webDesignerVlogTemPlate= [WebDesignerVlogTemplate webDesignerVlogTemplate];
    Template *grwmVlogTemplate = [GrwmVlogTemplate grwmVlogTemplate];
    Template *sixToFourVlogTemplate = [ClothesVlogTemplate sixToFourVlogTemplate];
    Template *dailyVlogTemplate = [DailyVlogTemplate dailyVlogTemplate];
    Template *modelVlogTemplate = [ModelVlogTemplate modelVlogTemplate];
    Template *kidsVlogTemplate = [KidsVlogTemplate kidsVlogTemplate];
    
    NSArray *dailyVlogTemplates = @[visitingCompanyVlogTemplate,craftVlogTemplate,lookBookVlogTemplate,stayingHomeVlogTemplate,babyVlogTemplate,summerVlogTemplate,dogVlogTemPlate,webDesignerVlogTemPlate,grwmVlogTemplate,sixToFourVlogTemplate,dailyVlogTemplate,modelVlogTemplate,kidsVlogTemplate];
    NSArray *dailyVlogTemplatePreviewImages =  @[visitingCompanyVlogTemplate.previewImageName,craftVlogTemplate.previewImageName,lookBookVlogTemplate.previewImageName,stayingHomeVlogTemplate.previewImageName,babyVlogTemplate.previewImageName,summerVlogTemplate.previewImageName,dogVlogTemPlate.previewImageName,webDesignerVlogTemPlate.previewImageName,grwmVlogTemplate.previewImageName,sixToFourVlogTemplate.previewImageName,dailyVlogTemplate.previewImageName,modelVlogTemplate.previewImageName,kidsVlogTemplate.previewImageName];
    
  
    //cooking vlog
    
    Template *cookingVlogTemplate = [CookingVlogTemplate cookingVlogTemplate];
    Template *macaronVlogTemplate = [MacaronVlogTemplate macaronVlogTemplate];
    
    NSArray *cookingVlogTemplates = @[cookingVlogTemplate,macaronVlogTemplate];
    NSArray *cookingVlogTemplatePreviewImages =  @[cookingVlogTemplate.previewImageName,macaronVlogTemplate.previewImageName];
    
    
    self.templatePreviewImages = @[tvEntertainTemplatePreviewImages,youtubeEntertainTemplatePreviewImages, tripVlogTemplatePreviewImages,schoolVlogTemplatePreviewImages,dailyVlogTemplatePreviewImages,cookingVlogTemplatePreviewImages];
    NSArray *templates = @[tvEntertainTemplates,youtubeEntertainTemplates ,tripVlogTemplates,schoolVlogTemplates,dailyVlogTemplates,cookingVlogTemplates];
    
    return templates;
    
}


@end
