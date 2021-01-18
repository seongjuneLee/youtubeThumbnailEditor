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
@property (nonatomic) CGPoint photoCenter;
@property (nonatomic) float photoRotationDegree;
@property (nonatomic) float photoScale;
@property (nonatomic) BOOL isCircle;

-(void)addSubViewsToBaseView;
-(void)addBackgroundImageWithName:(NSString *)imageName;
-(void)makeBaseView;

@end

NS_ASSUME_NONNULL_END
