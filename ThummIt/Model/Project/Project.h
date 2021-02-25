//
//  Project.h
//  Thummit
//
//  Created by 이성준 on 2020/12/19.
//
#import <Foundation/Foundation.h>
#import "Item.h"
#import "PhotoFrame.h"
#import "Text.h"
#import "Photo.h"
#import "Sticker.h"
#import "MainFrame.h"
#import "Template.h"
@class CoreDataProject;


NS_ASSUME_NONNULL_BEGIN

@interface Project : NSObject <NSCoding>

@property (strong, nonatomic) NSString* projectID;
@property (strong, nonatomic) NSString* projectTitle;
@property (strong, nonatomic) NSString* projectFilePath;
@property (strong, nonatomic) NSString* selectedTemplateName;
@property (strong, nonatomic) NSString* mainFrameImageName;
@property (strong, nonatomic) UIColor * backgroundColor;
@property (strong, nonatomic) NSString *lastEditedDate;
@property (strong, nonatomic) NSMutableArray *photos;
@property (strong, nonatomic) NSMutableArray *photoFrames;
@property (strong, nonatomic) NSMutableArray *texts;
@property (strong, nonatomic) NSMutableArray *stickers;
@property (strong, atomic) CoreDataProject* coreDataStorage;
@property (strong, nonatomic) UIImage * previewImage;

-(NSMutableArray *)items;
-(id)initWithProjectID:(NSString *)projectID;
-(void)save;

@end

NS_ASSUME_NONNULL_END
