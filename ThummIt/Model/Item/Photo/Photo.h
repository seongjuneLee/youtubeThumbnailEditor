//
//  Photo.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/25.
//

#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface Photo : Item

@property (strong, nonatomic) UIImageView *photoImageView;
@property (strong, nonatomic) NSData *imageData;
@property (strong, nonatomic) PHAsset *phAsset;

@end

NS_ASSUME_NONNULL_END
