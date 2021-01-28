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
    Template *sinseoyugiTemplate1 = [SinSeoYuGiTemplate1 sinSeoYuGiTemplate1];
    
    Template *workManTemplate1 = [WorkManTemplate1 workManTemplate1];
    Template *workManTemplate2 = [WorkManTemplate2 workManTemplate2];
    Template *workManTemplate3 = [WorkManTemplate3 workManTemplate3];
    
    Template *infiniteChallenge1Template = [InfiniteChallenge1Template infiniteChallenge1Template];
    Template *infiniteChallenge2Template = [InfiniteChallenge2Template infiniteChallenge2Template];

    NSArray *entertainTemplates = @[circleTemplate, doubleCircleTemplate, sinseoyugiTemplate1,runningMan1Template, infiniteChallenge1Template, infiniteChallenge2Template, workManTemplate1, workManTemplate2, workManTemplate3];

    
    Template *twoDivisionTemplate = [TwoDivisionTemplate twoDivisionTemplate];
    Template *quarterDivisionTemplate = [QuarterDivisionTemplate quarterDivisionTemplate];
    NSArray *vlogTemplates = @[twoDivisionTemplate,quarterDivisionTemplate];
    
    NSArray *templates = @[entertainTemplates, vlogTemplates];
    return templates;

    
}


@end
