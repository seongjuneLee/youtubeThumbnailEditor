//
//  Text.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import "Item.h"
#import "TextViewContainer.h"
#import "AdvancedTextView.h"

NS_ASSUME_NONNULL_BEGIN

@interface Text : Item

// 뷰
@property (strong, nonatomic) AdvancedTextView *textView;
@property (strong, nonatomic) TextViewContainer *textViewContainer;
@property (strong, nonatomic, nullable) UIImageView *placeholderImageView;

// 뷰 데이터
@property (strong, nonatomic) NSString* text;
@property (strong, nonatomic) NSAttributedString* attributedText;
@property (strong, nonatomic) NSMutableArray* backgroundAttributedTexts;
@property (nonatomic) NSTextAlignment textAlignment;

// 타이포
@property (strong, nonatomic) Typography *typo;
@property (strong, nonatomic) NSMutableArray *typoRangeArray;
@property (nonatomic) BOOL isTypedByUser;

-(void)resize;

-(UIImageView*)makePlaceholderImageView;
-(void)applyTypo:(Typography *)typo;
-(void)setUpTypoRangeArray:(NSArray*)typoRangeArray;
-(void)updateBackgroundImageViewFrame:(Typography *)typo;
+(UIImageView*)makePlaceHolderWithTypo:(Typography*)typo;
-(id)initWithTypo:(Typography *)typo;


@end

NS_ASSUME_NONNULL_END
