//
//  Typography.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import <Foundation/Foundation.h>
#import "BGTextAttribute.h"
#import "UIColor+Additions.h"
NS_ASSUME_NONNULL_BEGIN

@interface Typography : NSObject


@property (nonatomic) float scale;

// 타이포 이름
@property (strong, nonatomic) NSString* name;

// 타이포 이름
@property (nonatomic) BOOL isCustomTypo;

// 타이포 카테고리
@property (strong, nonatomic) NSString* category;


// 폰트
@property (strong, nonatomic) NSString* fontName;
@property (nonatomic) float fontSize;
@property (nonatomic) float fontInterval;


// 색상
@property (strong, nonatomic) UIColor* textColor;
@property (strong, nonatomic) UIColor* borderColor;
@property (strong, nonatomic) UIColor* backgroundColor;
@property (strong, nonatomic) NSString* textColorPatternImageName;
@property (nonatomic) float borderWidth;
@property (nonatomic) BOOL borderRoundCorner;


// 그림자
@property (strong, nonatomic) UIColor* shadowColor;
@property (nonatomic) CGSize shadowOffset;
@property (nonatomic) float shadowRadius;

// 그레디언트
@property (strong, nonatomic) UIColor* textFromColor;
@property (strong, nonatomic) UIColor* textToColor;
@property (nonatomic) float textGradientHeight;

@property (strong, nonatomic) UIColor* bgFromColor;
@property (strong, nonatomic) UIColor* bgToColor;
@property (nonatomic) float bgGradientHeight;

@property (strong, nonatomic) UIColor* borderFromColor;
@property (strong, nonatomic) UIColor* borderToColor;
@property (nonatomic) float borderGradientHeight;

@property (strong, nonatomic) UIColor* shadowFromColor;
@property (strong, nonatomic) UIColor* shadowToColor;
@property (nonatomic) float shadowGradientHeight;

@property (nonatomic) CGSize originalGradientImageSize;
// 스타일
@property (nonatomic) float obliqueValue;

// 투명도
@property (nonatomic) float alpha;

// 배경이미지 이름
@property (strong, nonatomic) NSString* bgImageName;

// 배경 패딩
@property (nonatomic) CGFloat bgWidthPadding;
@property (nonatomic) CGFloat bgHeightPadding;
@property (nonatomic) CGFloat bgCenterXDelta;
@property (nonatomic) CGFloat bgCenterYDelta;
@property (nonatomic) UIViewContentMode bgContentMode;

//이미지
@property (strong, nonatomic) NSString* typoImageFilePath;


//겹겹이 아래에 쌓일 텍스트들
@property (strong, nonatomic) NSMutableArray* bgTextAttributes;

@property (nonatomic) BOOL canChangeColor;
@property (nonatomic) BOOL backgroundColorAlsoChange;

- (id)init;
-(NSMutableArray *)makeShadowWithColor:(UIColor *)color fromOffset:(CGPoint)fromOffset toOffset:(CGPoint)toOffset;

@end

NS_ASSUME_NONNULL_END
