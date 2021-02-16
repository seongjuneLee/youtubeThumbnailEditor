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
- (void)deleteProjectOfID:(NSString*)projectId;
-(NSString *)generateProjectID;
-(NSUInteger)fetchProjectsCount;
- (NSArray*)getRecentProjectsFromCoreDataWithOffset:(NSUInteger)offSet;
-(void)deleteProjectAtIndex:(NSUInteger)index;
-(void)fetchImage;
- (NSArray *)loadProjectMetaData;

@end

NS_ASSUME_NONNULL_END
