//
//  ExportManager.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/15.
//

#import "ExportManager.h"

@implementation ExportManager

+ (ExportManager *)sharedInstance {
    static ExportManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ExportManager alloc] init];
    });
    
    return sharedInstance;
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


@end
