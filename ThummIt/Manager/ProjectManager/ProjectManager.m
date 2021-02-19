//
//  ProjectManager.m
//  Thummit
//
//  Created by 이성준 on 2020/12/20.
//

#import "ProjectManager.h"
#import "PhotoManager.h"
#import "ThummIt-Swift.h"
#import "NSDate+Additions.h"
#import "UIImage+Additions.h"
#import "NSString+Additions.h"
@implementation ProjectManager

+ (ProjectManager *)sharedInstance {
    static ProjectManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ProjectManager alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - 생성

-(Project *)generateNewProjectWithTemplate:(Template *)selectedTemplate{
    
    Project* project = [CoreDataStack newProject];
    if (selectedTemplate) {
        project.photoFrames = selectedTemplate.photoFrames;
        project.texts = selectedTemplate.texts;
        project.stickers = selectedTemplate.stickers;
        project.backgroundColor = selectedTemplate.backgroundColor;
        project.mainFrameImageName = selectedTemplate.mainFrameImageName;
    } else {
        project.photoFrames = [NSMutableArray array];
        project.texts = [NSMutableArray array];
        project.stickers = [NSMutableArray array];
        project.backgroundColor = UIColor.blackColor;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd-hh-mm-ss"];
    NSString *stringDate = [dateFormatter stringFromDate:[NSDate date]];
    project.lastEditedDate = stringDate;

    return project;
    
}
-(NSString *)generateProjectID{
    
    NSString *dateString = [NSDate localizedDateString] ?: @"";
    NSString *randomString = [NSString randomStringWithLength:4] ?: @"";
    
    NSString *projectID = [NSString stringWithFormat:@"%@_%@",dateString,randomString];

    return projectID;
}

#pragma mark - 삭제
- (void)deleteProjectOfID:(NSString*)projectId{
    
    // find the project
    Project * project = [self projectFromProjectID:projectId];
    
    if (project) {
        
        [CoreDataStack deleteProjectWithProject:project];
        
        NSError* error;
        [CoreDataStack saveContextAndReturnError:&error];
    }
    
    
}


#pragma mark - 가져오기

- (NSArray*)getAllProjectsFromCoreData {
    
    NSArray<CoreDataProject*>* coreDataProjects = [CoreDataStack fetchAllProjects];
    
    NSMutableArray<Project*>* projects = [NSMutableArray new];
    for (CoreDataProject* coreDataProject in coreDataProjects) {
        
        NSData* projectData;
        if ([MigratorJul.shared isMigrated]) {
            projectData = coreDataProject.projectData;
        } else {
            NSString* filePath = coreDataProject.projectFilePath;
            if (filePath.length > 0) {
                NSError* error;
                projectData = [ProjectFileManager.sharedInstance readWithFilePath:filePath error:&error];
                
            }
        }
        if (projectData && [projectData isKindOfClass:NSData.class]) {
            NSError* jsonError;
            Project *project = [NSKeyedUnarchiver unarchiveObjectWithData:projectData];
            project.projectID = coreDataProject.projectID;

            if (jsonError){
                // 에러
            }
            NSString* projectId = project.projectID;
            if (projectId.length == 0) {
                
                
                projectId = [self generateProjectID];

            }

            if (project) {
                [projects addObject:project];
            }

        } else {
            continue;
        }
    }
    
    [projects sortUsingComparator:^NSComparisonResult(Project*  _Nonnull prj1, Project*  _Nonnull prj2) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY-MM-dd-hh-mm-ss"];
        NSDate *date1 = [dateFormatter dateFromString:prj1.lastEditedDate];
        NSDate *date2 = [dateFormatter dateFromString:prj2.lastEditedDate];
        if (date1.timeIntervalSince1970 < date2.timeIntervalSince1970) {
            return NSOrderedDescending;
        }
        if (date1.timeIntervalSince1970 > date2.timeIntervalSince1970) {
            return NSOrderedAscending;
        }
        
        return NSOrderedSame;
    }];
    
    return projects;
}

- (NSArray *)loadProjectMetaData {
    
    NSArray<CoreDataProject*>* coreDataProjects = [CoreDataStack fetchAllProjects];
    
    NSMutableArray<NSDictionary*>* ret = [NSMutableArray array];
    
    for (CoreDataProject* coreDataProject in coreDataProjects) {
        NSMutableDictionary * data = [NSMutableDictionary dictionary];
        NSString* projectID = coreDataProject.projectID;
        NSString *lastEditedDate = coreDataProject.lastEditedDate;
        // migrationJul followup - project is invalid without project id
        // do not show project on the list if project id doesn't exist.
        if (projectID == nil || projectID.length <= 0) {
            continue;
        }
        
        data[@"projectID"] = projectID;
        data[@"lastEditedDate"] = lastEditedDate;
        
        [ret addObject:data];
    }
    
    [ret sortUsingComparator:^NSComparisonResult(NSDictionary*  _Nonnull prj1, NSDictionary*  _Nonnull prj2) {
        NSDate* date1 = [NSDate dateFromString:prj1[@"recentUpdateString"]];
        NSDate* date2 = [NSDate dateFromString:prj2[@"recentUpdateString"]];
        if (date1.timeIntervalSince1970 < date2.timeIntervalSince1970) {
            return NSOrderedDescending;
        }
        if (date1.timeIntervalSince1970 > date2.timeIntervalSince1970) {
            return NSOrderedAscending;
        }
        
        return NSOrderedSame;
    }];
    
    return ret;
}


- (Project*)projectFromProjectID:(NSString *)projectId{
    
    
    CoreDataProject* coreDataProject = [CoreDataStack fetchProjectWithProjectId:projectId];
    
    if (!coreDataProject){
        return nil;
    }
    
    NSData* projectData;
    if ([MigratorJul.shared isMigrated]) {
        projectData = coreDataProject.projectData;
    } else {
        NSString* filePath = coreDataProject.projectFilePath;
        if (filePath.length > 0) {
            NSError* error;
            projectData = [ProjectFileManager.sharedInstance readWithFilePath:filePath error:&error];
        }
    }
    Project *project;
    if (projectData) {
        @try {
            project = [NSKeyedUnarchiver unarchiveObjectWithData:projectData];
            project.coreDataStorage = coreDataProject;
            project.projectID = projectId;

            NSString* projectId = project.projectID;
            if (projectId.length == 0) {
                
                projectId = [self generateProjectID];
                
            }
        } @catch (NSException *exception) {

        }
        
    }
    return project;
}

- (NSArray*)getRecentProjectsFromCoreDataWithOffset:(NSUInteger)offSet {
    
    NSArray<CoreDataProject*>* coreDataProjects = [CoreDataStack fetchWithFetchOffSet:offSet];
    
    NSMutableArray<Project*>* projects = [NSMutableArray new];
    for (CoreDataProject* coreDataProject in coreDataProjects) {
        
        NSData* projectData;
        if ([MigratorJul.shared isMigrated]) {
            projectData = coreDataProject.projectData;
        } else {
            NSString* filePath = coreDataProject.projectFilePath;
            if (filePath.length > 0) {
                NSError* error;
                projectData = [ProjectFileManager.sharedInstance readWithFilePath:filePath error:&error];
                
            }
        }
        if (projectData && [projectData isKindOfClass:NSData.class]) {
            NSError* jsonError;
            Project *project = [NSKeyedUnarchiver unarchiveObjectWithData:projectData];
            project.projectID = coreDataProject.projectID;

            if (jsonError){
                // 에러
            }
            NSString* projectId = project.projectID;
            if (projectId.length == 0) {
                
                
                projectId = [self generateProjectID];

            }

            if (project) {
                [projects addObject:project];
            }

        } else {
            continue;
        }
    }
    
    [projects sortUsingComparator:^NSComparisonResult(Project*  _Nonnull prj1, Project*  _Nonnull prj2) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY-MM-dd-hh-mm-ss"];
        NSDate *date1 = [dateFormatter dateFromString:prj1.lastEditedDate];
        NSDate *date2 = [dateFormatter dateFromString:prj2.lastEditedDate];
        if (date1.timeIntervalSince1970 < date2.timeIntervalSince1970) {
            return NSOrderedDescending;
        }
        if (date1.timeIntervalSince1970 > date2.timeIntervalSince1970) {
            return NSOrderedAscending;
        }
        
        return NSOrderedSame;
    }];
    
    return projects;
}

-(NSUInteger)fetchProjectsCount{
    
    NSUInteger projectsCount = [CoreDataStack fetchProjectsCount];

    return projectsCount;
    
}


@end
