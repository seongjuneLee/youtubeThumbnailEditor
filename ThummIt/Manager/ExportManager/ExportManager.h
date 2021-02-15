//
//  ExportManager.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExportManager : NSObject

+ (ExportManager *)sharedInstance;
@property (strong, nonatomic) UIImage *exportingImage;
-(void)isAlbumAlreadyExist:(void(^) (BOOL exist))block;
-(void)getThummItAlbum:(void(^) (PHAssetCollection *collection))block;
-(void)saveImageToAlbum:(PHAssetCollection *)collection withBlock:(void(^) (BOOL success))block;
-(void)createThummItAlbum:(void(^) (PHAssetCollection *album))block;

@end

NS_ASSUME_NONNULL_END
