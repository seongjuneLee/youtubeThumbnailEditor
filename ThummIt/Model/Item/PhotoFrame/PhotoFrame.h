//
//  Border.h
//  Thummit
//
//  Created by 이성준 on 2020/12/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Item.h"
NS_ASSUME_NONNULL_BEGIN

@interface PhotoFrame : Item

@property (strong, nonatomic) UIButton *plusPhotoButton;
@property (strong, nonatomic) UILabel *plusLabel;
@property (strong, nonatomic) UIImageView *photoImageView;
@property (strong, nonatomic) UIImage *photoImage;
@property (nonatomic) float photoRotationDegree;
@property (nonatomic) float photoScale;
@property (nonatomic) BOOL isCircle;
@property (strong, nonatomic) PHAsset *phAsset;

-(void)addSubViewsToBaseView;
-(void)setBaseViewFrame;

@end

NS_ASSUME_NONNULL_END
