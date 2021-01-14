//
//  Item.h
//  Thummit
//
//  Created by 이성준 on 2020/12/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
NS_ASSUME_NONNULL_BEGIN


@interface Item : NSObject <NSCopying, NSCoding>

@property (strong ,nonatomic) UIView *baseView;
@property (strong, nonatomic) NSString *itemName;
@property (strong, nonatomic) NSString *backgroundImageName;
@property (strong, nonatomic) UIImageView *backgroundImageView;

@property (nonatomic) CGPoint center;
@property (nonatomic) NSInteger rotationDegree;
@property (nonatomic) CGFloat scale;

@property (strong, nonatomic) PHAsset *phAsset;
@property (nonatomic) BOOL isTemplateItem;

-(void)scaleItem;


@end

NS_ASSUME_NONNULL_END
