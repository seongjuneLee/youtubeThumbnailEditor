//
//  Project.m
//  Thummit
//
//  Created by 이성준 on 2020/12/19.
//

#import "Project.h"
#import "Thummit-Swift.h"
@implementation Project

-(id)init{
    
    self = [super init];
    if(self){
    }
    return self;
    
}

-(id)initWithProjectID:(NSString *)projectID{
    
    self = [super init];
    
    self.projectID = projectID;
    self.photoFrames = [NSMutableArray<PhotoFrame*> new];
    self.texts = [NSMutableArray<Text*> new];
    self.stickers = [NSMutableArray<Sticker*> new];
    self.projectTitle = @"";
    self.selectedTemplateName = @"";

    return self;

}

-(void)save{
    
    NSData* projectData = [NSKeyedArchiver archivedDataWithRootObject:self];
    NSError* error;
    NSString* oldFilePath;
    
    if ([MigratorJul.shared isMigrated]) {
        
        self.coreDataStorage.projectData = projectData;
        
    } else {
        NSString* filePath = [ProjectFileManager.sharedInstance writeWithData:projectData error:&error];
        oldFilePath = self.projectFilePath;
        
        if (error){
            NSLog(@"failed to save!: %@", error.localizedDescription?:@"");
        }
        
        // update file path
        self.projectFilePath = filePath;
    }
    NSError* coreDataSaveError;
    [CoreDataStack saveContextAndReturnError:&coreDataSaveError];
    

    if (coreDataSaveError){
        NSLog(@"failed to save!: %@", error.localizedDescription?:@"");
    }
    
    // delete the old project file
    if (oldFilePath && oldFilePath.length > 0){
        [ProjectFileManager.sharedInstance deleteWithFilePath:oldFilePath error:&error];
    }

}

-(NSMutableArray *)items{
    NSMutableArray *items = [NSMutableArray arrayWithArray:self.photoFrames];
    [items addObjectsFromArray:self.texts];
    [items addObjectsFromArray:self.stickers];

    return items;
}

-(id)initWithCoder:(NSCoder *)decoder{

    self.projectID = [decoder decodeObjectForKey:@"projectID"];
    self.projectTitle = [decoder decodeObjectForKey:@"items"];
    self.photoFrames = [decoder decodeObjectForKey:@"photoFrames"];
    self.texts = [decoder decodeObjectForKey:@"texts"];
    self.stickers = [decoder decodeObjectForKey:@"stickers"];
    self.selectedTemplateName = [decoder decodeObjectForKey:@"selectedTemplateName"];
    self.backgroundColor = [decoder decodeObjectForKey:@"backgroundColor"];
    self.lastEditedDate = [decoder decodeObjectForKey:@"lastEditedDate"];

    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{

    [encoder encodeObject:self.projectID forKey:@"projectID"];
    [encoder encodeObject:self.photoFrames forKey:@"photoFrames"];
    [encoder encodeObject:self.texts forKey:@"texts"];
    [encoder encodeObject:self.stickers forKey:@"stickers"];
    [encoder encodeObject:self.projectTitle forKey:@"projectTitle"];
    [encoder encodeObject:self.selectedTemplateName forKey:@"selectedTemplateName"];
    [encoder encodeObject:self.backgroundColor forKey:@"backgroundColor"];
    [encoder encodeObject:self.lastEditedDate forKey:@"lastEditedDate"];

}

@end
