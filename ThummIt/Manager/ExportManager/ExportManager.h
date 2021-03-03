//
//  ExportManager.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/15.
//

#import <Foundation/Foundation.h>
#import "Project.h"
NS_ASSUME_NONNULL_BEGIN

@interface ExportManager : NSObject

+ (ExportManager *)sharedInstance;
@property (strong, nonatomic) UIImage *exportingImage;
-(void)isAlbumAlreadyExist:(void(^) (BOOL exist))block;
-(void)getThummItAlbum:(void(^) (PHAssetCollection *collection))block;
-(void)saveImageToAlbum:(PHAssetCollection *)collection withBlock:(void(^) (BOOL success))block;
-(void)createThummItAlbum:(void(^) (PHAssetCollection *album))block;
-(void)setResolutionToExportingImage:(UIImage *)image withResolution:(CGSize)resolution;
-(void)exportImageWithBlock:(void(^) (BOOL success))block;
-(void)savePreviewImageWithResolution:(CGSize)resolution withProject:(Project *)project;

@end

NS_ASSUME_NONNULL_END
