//
//  SaveManager.m
//  Thummit
//
//  Created by 이성준 on 2020/12/20.
//

#import "SaveManager.h"

@implementation SaveManager

+ (SaveManager *)sharedInstance {
    static SaveManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SaveManager alloc] init];
    });
    
    return sharedInstance;
}

-(Template*)currentTemplate{
    
    Template *currentTemplate;
    for (Template *template in TemplateManager.sharedInstance.templates) {
        if ([self.currentProject.selectedTemplateName isEqualToString:template.templateName]) {
            currentTemplate = template;
        }
    }
    
    return currentTemplate;
    
}

-(void)save{
    
    [self.currentProject save];
    
}

@end
