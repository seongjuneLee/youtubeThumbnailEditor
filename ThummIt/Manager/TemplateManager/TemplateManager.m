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
    Template *sinseoyugiTemplate1 = [SinSeoYuGi1Template sinSeoYuGiTemplate1];

    NSArray *entertainTemplates = @[circleTemplate, doubleCircleTemplate, runningMan1Template,runningMan2Template,runningMan3Template,sinseoyugi1Template,sinseoyugi2Template,sinseoyugi3Template, infiniteChallenge1Template, workManTemplate1, workManTemplate2, workManTemplate3,sinseoyugiTemplate1];

    
    Template *twoDivisionTemplate = [TwoDivisionTemplate twoDivisionTemplate];
    Template *quarterDivisionTemplate = [QuarterDivisionTemplate quarterDivisionTemplate];
    NSArray *vlogTemplates = @[twoDivisionTemplate,quarterDivisionTemplate];
    
    NSArray *templates = @[entertainTemplates, vlogTemplates];
    return templates;

    
}


@end
