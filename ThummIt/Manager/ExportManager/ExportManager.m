//
//  ExportManager.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/15.
//

#import "ExportManager.h"
#import "SaveManager.h"
@import Parse;
@implementation ExportManager

+ (ExportManager *)sharedInstance {
    static ExportManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ExportManager alloc] init];
    });
    
    return sharedInstance;
}

-(void)exportImageWithBlock:(void(^) (BOOL success))block{
    
    [self isAlbumAlreadyExist:^(BOOL exist) {
        if (exist) {
            [self getThummItAlbum:^(PHAssetCollection *collection) {
                
                [self saveImageToAlbum:collection withBlock:^(BOOL success) {
                    
                    block(success);
                    
                }];
            }];
        } else {
            
            [self createThummItAlbum:^(PHAssetCollection *collection) {
                if (collection) {
                    
                    [self saveImageToAlbum:collection withBlock:^(BOOL success) {
                        block(success);
                    }];
                    
                } else {
                    block(false);
                }
            }];
        }
    }];

}

-(void)setResolutionToExportingImage:(UIImage *)image withResolution:(CGSize)resolution{
    
    /* Render the screen shot at custom resolution */
    CGRect cropRect = CGRectMake(0 ,0 ,resolution.width ,resolution.height);
    UIGraphicsBeginImageContextWithOptions(cropRect.size, false, 1.0f);
    [image drawInRect:cropRect];
    UIImage * customScreenShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.exportingImage = customScreenShot;
    
}

-(void)createThummItAlbum:(void(^) (PHAssetCollection *collection))block{
    
    __block PHObjectPlaceholder *myAlbum;
    NSString *title = @"ThummIt";

    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        PHAssetCollectionChangeRequest *changeRequest = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title];
        myAlbum = changeRequest.placeholderForCreatedAssetCollection;
    } completionHandler:^(BOOL success, NSError *error) {
        if (success) {
            PHFetchResult *fetchResult = [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[myAlbum.localIdentifier] options:nil];
            PHAssetCollection *collection = fetchResult.firstObject;

            block(collection);
        } else {
            block(nil);
        }
    }];
}

-(void)saveImageToAlbum:(PHAssetCollection *)collection withBlock:(void(^) (BOOL success))block{
    PHFetchResult *fetchResult = [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[collection.localIdentifier] options:nil];
    PHAssetCollection *assetCollection = fetchResult.firstObject;
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        PHAssetChangeRequest *assetChangeRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:self.exportingImage];

        // add asset
        PHAssetCollectionChangeRequest *assetCollectionChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:assetCollection];
        [assetCollectionChangeRequest addAssets:@[[assetChangeRequest placeholderForCreatedAsset]]];
    } completionHandler:^(BOOL success, NSError *error) {
        block(success);
    }];

}

-(void)isAlbumAlreadyExist:(void(^) (BOOL exist))block{
    
    PHFetchOptions *userAlbumsOptions = [PHFetchOptions new];
    NSString *title = @"ThummIt";
    
    PHFetchResult *userAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:userAlbumsOptions];
    [userAlbums enumerateObjectsUsingBlock:^(PHAssetCollection *collection, NSUInteger idx, BOOL *stop) {
        
        if ([collection.localizedTitle isEqualToString:title]) {
            block(true);
            *stop = true;
        } else if (idx +1 == userAlbums.count){
            block(false);
            *stop = true;
        }
        
    }];

}

-(void)getThummItAlbum:(void(^) (PHAssetCollection *collection))block{
    
    PHFetchOptions *userAlbumsOptions = [PHFetchOptions new];
    NSString *title = @"ThummIt";
    
    PHFetchResult *userAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:userAlbumsOptions];
    [userAlbums enumerateObjectsUsingBlock:^(PHAssetCollection *collection, NSUInteger idx, BOOL *stop) {
        
        if ([collection.localizedTitle isEqualToString:title]) {
            block(collection);
            *stop = true;
        } else if (idx +1 == userAlbums.count){
            block(nil);
            *stop = true;
        }
        
    }];

}

-(void)savePreviewImageWithResolution:(CGSize)resolution withProject:(Project *)project{
    
    UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
    float scale = resolution.width/window.bounds.size.width;
    
    // view
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, resolution.width, resolution.height)];
    view.backgroundColor = project.backgroundColor;
    
    // frameImageView
    UIImageView *mainFrameImageView = [[UIImageView alloc] initWithFrame:view.frame];
    mainFrameImageView.contentMode = UIViewContentModeScaleAspectFit;
    if (project.mainFrameImageName) {
        mainFrameImageView.image = [UIImage imageNamed:project.mainFrameImageName];
        [view addSubview:mainFrameImageView];
    }
    
    // add Items
    for (Item *item in project.items) {
        Item *copied = [item copy];
        
        copied.baseView.transform = CGAffineTransformConcat(copied.baseView.transform, CGAffineTransformMakeScale(scale, scale));
        copied.baseView.center = CGPointMake(copied.relativeCenter.x * view.frameWidth, copied.relativeCenter.y * view.frameHeight);

        if (copied.isFixedPhotoFrame) {
            copied.baseView.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1.0];
            [view insertSubview:copied.baseView belowSubview:mainFrameImageView];
        } else {
            [view insertSubview:copied.baseView atIndex:copied.indexInLayer.integerValue];
        }
    }
    
    // to image and save
    UIImage *viewImage = [view toImage];
    self.exportingImage = viewImage;
    [ExportManager.sharedInstance setResolutionToExportingImage:viewImage withResolution:resolution];
}


@end
