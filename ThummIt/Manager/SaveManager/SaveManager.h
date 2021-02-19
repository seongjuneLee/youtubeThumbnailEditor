//
//  SaveManager.h
//  Thummit
//
//  Created by 이성준 on 2020/12/20.
//

#import <Foundation/Foundation.h>
#import "Project.h"
#import "Template.h"
#import "TemplateManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface SaveManager : NSObject

+ (SaveManager *)sharedInstance;

@property (strong, nonatomic) Project *currentProject;
@property (strong, nonatomic) NSMutableArray *tenRecentChanges;
@property (nonatomic) CGRect bgViewRect;
@property dispatch_queue_t savingQueue;

-(Template *)currentTemplate;
-(void)saveAndAddToStack;
-(void)addItem:(Item *)item;
-(void)deleteItem:(Item *)item;
-(void)applyCurrentProject:(Project *)project;
-(void)savePreviewImage;
-(void)save;

@end

NS_ASSUME_NONNULL_END
