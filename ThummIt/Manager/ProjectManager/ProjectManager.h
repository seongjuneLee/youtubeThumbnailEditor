//
//  ProjectManager.h
//  Thummit
//
//  Created by 이성준 on 2020/12/20.
//

#import <Foundation/Foundation.h>
#import "Project.h"
#import "Template.h"
NS_ASSUME_NONNULL_BEGIN

@interface ProjectManager : NSObject

+ (ProjectManager *)sharedInstance;

-(Project *)generateNewProjectWithTemplate:(Template *)selectedTemplate;
- (NSArray*)getAllProjectsFromCoreData;
- (BOOL)deleteIdOfProject:(NSString*)projectId;
-(NSString *)generateProjectID;

@end

NS_ASSUME_NONNULL_END
