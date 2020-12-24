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

-(NSArray *)templates{
    
    
    Template *circleTemplate = [CircleTemplate circleTemplate];
    Template *doubleCircleTemplate = [DoubleCircleTemplate doubleCircleTemplate];
    Template *twoDivisionTemplate = [TwoDivisionTemplate twoDivisionTemplate];
    Template *quarterDivisionTemplate = [QuarterDivisionTemplate quarterDivisionTemplate];
    NSArray *templates = @[circleTemplate, doubleCircleTemplate,twoDivisionTemplate,quarterDivisionTemplate];
    return templates;
}


@end
