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

@property (strong, nonatomic) NSMutableArray *projectSnapShots;
@property (strong, nonatomic) NSMutableArray *photoImageDict;

- (Project*)projectFromProjectID:(NSString *)projectId;
-(Project *)generateNewProjectWithTemplate:(Template *)selectedTemplate;
- (NSArray*)getAllProjectsFromCoreData;
- (BOOL)deleteIdOfProject:(NSString*)projectId;
-(NSString *)generateProjectID;
-(NSUInteger)fetchProjectsCount;
-(NSMutableArray *)loadProjectSnapshots:(NSUInteger)offSet;
- (NSArray*)getRecentTenProjectsFromCoreDataWithOffset:(NSUInteger)offSet;
-(void)fetchImage;

@end

NS_ASSUME_NONNULL_END
