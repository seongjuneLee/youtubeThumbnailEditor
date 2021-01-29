//
//  AdvancedTextView.h
//  Vlogr
//
//  Created by iMac on 26/09/2019.
//  Copyright © 2019 TaejunLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Typography.h"
NS_ASSUME_NONNULL_BEGIN

@interface AdvancedTextView : UITextView <NSCopying>

@property (strong, nonatomic) UIView * boundingView;
@property (strong, nonatomic) UIView * firstRectBoundingView;
@property (strong, nonatomic) UIImage * bgImage;

@property (strong, nonatomic) NSArray * bgTextAttributes;
@property (strong, nonatomic) NSMutableArray* backgroundAttributedTexts;

@property (strong, nonatomic) NSMutableParagraphStyle *paragraphStyle;
@property (nonatomic) CGRect stringRect;

@property (strong, nonatomic) NSObject * parent;

-(void)setUpTypography:(Typography *)typo range:(NSRange)range;
-(void)setTextSelectedRangeWithPoint:(CGPoint)currentPointInTextView;

@end

NS_ASSUME_NONNULL_END
