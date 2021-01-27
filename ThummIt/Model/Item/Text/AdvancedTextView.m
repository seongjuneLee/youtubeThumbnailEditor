//
//  AdvancedTextView.m
//  Vlogr
//
//  Created by iMac on 26/09/2019.
//  Copyright © 2019 TaejunLee. All rights reserved.
//

#import "AdvancedTextView.h"
#import "BGTextAttribute.h"
#import "UIColor+Additions.h"
#import "UITextView+Additions.h"
#import "NSArray+Additions.h"
#import "NSMutableAttributedString+Additions.h"
#import "Text.h"

@implementation AdvancedTextView

- (void)drawRect:(CGRect)rect{
    
    // 1. paragraphStyle
    self.paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [self.paragraphStyle setAlignment:self.textAlignment];
    [self.paragraphStyle setLineSpacing:2];
    
    // 2. stringRect
    UITextPosition *beginning = self.beginningOfDocument;
    CGRect caretRect = [self caretRectForPosition:beginning];
    CGRect stringRect = CGRectIntegral([self.attributedText boundingRectWithSize:self.frameSize options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) context:nil]);
    stringRect.size.width += 10;
    float x = self.center.x - stringRect.size.width/2.0;//center
    if (self.paragraphStyle.alignment == NSTextAlignmentRight){
        x = self.frame.size.width - stringRect.size.width - self.textContainerInset.right - self.textContainer.lineFragmentPadding;
    }else if (self.paragraphStyle.alignment == NSTextAlignmentLeft){
        x = self.textContainerInset.left + self.textContainer.lineFragmentPadding;
    }
    stringRect.origin.y = caretRect.origin.y+1;
    stringRect.origin.x = x;
    
    // 레인지
    NSRange range = NSMakeRange(0,self.text.length);
    if (self.selectedRange.length) {
        range = self.selectedRange;
    }

    // backgroundAttributedTexts를 그리기
    for (NSInteger i = self.backgroundAttributedTexts.count-1;i>=0;i--){
        if (i >= self.bgTextAttributes.count){
            continue;
        }
        NSMutableAttributedString * string = self.backgroundAttributedTexts[i];
        
        BGTextAttribute *bgTextAttribute = [self.bgTextAttributes objectAtIndex:i];

        [string removeAttribute:NSParagraphStyleAttributeName range:NSMakeRange(0, string.length)];
        [string addAttribute:NSParagraphStyleAttributeName value:self.paragraphStyle range:NSMakeRange(0,string.length)];
        [string drawInRect:CGRectMake(stringRect.origin.x+bgTextAttribute.offset.x, stringRect.origin.y+bgTextAttribute.offset.y, stringRect.size.width, stringRect.size.height)];

    }

    ((Text*)self.parent).backgroundAttributedTexts = self.backgroundAttributedTexts;
}

-(id)copyWithZone:(NSZone *)zone{
    AdvancedTextView * copied = [[AdvancedTextView alloc] init];
    
    copied.text = [self.text copy];
    copied.attributedText = [self.attributedText copy];
    copied.boundingView = [self.boundingView copy];
    copied.firstRectBoundingView = [self.firstRectBoundingView copy];
    copied.bgImage = [self.bgImage copy];
    copied.bgTextAttributes = [self.bgTextAttributes copy];
    copied.backgroundAttributedTexts = [self.backgroundAttributedTexts copy];
    copied.paragraphStyle = [self.paragraphStyle copy];
    copied.frame = self.frame;
    
    copied.backgroundColor = self.backgroundColor;
    
    return copied;
}

#pragma mark - 오리지널 어트리뷰티드 스트링

- (NSMutableAttributedString *)getAttributedText{
    
    // attributedString의 글자복구
    NSMutableAttributedString* mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    
    // attributedString의 어트리뷰트 복구
    [self.attributedText enumerateAttributesInRange:NSMakeRange(0, self.attributedText.length) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        
        [mutableAttributedString addAttributes:attrs range:range];
        float strokeWidth = [[attrs objectForKey:NSStrokeWidthAttributeName] floatValue];
        if (strokeWidth > 0) {
            [mutableAttributedString addAttribute:NSStrokeWidthAttributeName value:@(0) range:range];
        }
        
    }];
    
    return mutableAttributedString;
}

- (BOOL)isContainingBorderedOrShadowString{
    
    __block BOOL containingBorderedOrShadowString = false;
    
    // attributedString의 어트리뷰트 복구
    [self.attributedText enumerateAttributesInRange:NSMakeRange(0, self.attributedText.length) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        
        float strokeWidth = [[attrs objectForKey:NSStrokeWidthAttributeName] floatValue];
        NSShadow* shadow = [attrs objectForKey:NSShadowAttributeName];
        float radius = shadow.shadowBlurRadius;

        if (strokeWidth < 0 || (shadow != nil && radius == 0)) {
            containingBorderedOrShadowString = true;
        }
        
    }];
    
    return containingBorderedOrShadowString;
}

-(void)resizeForCurrentFontSize{
    
    [super resizeForCurrentFontSize];
        
    CGPoint ret = [[[self.bgTextAttributes mapWithBlock:^id _Nonnull(BGTextAttribute * _Nonnull obj, NSUInteger idx) {
        return @(obj.offset);
    }] reduceWithBlock:^NSValue * _Nonnull(NSValue * _Nonnull obj1, NSValue *  _Nonnull obj2) {
        CGPoint point1 = obj1.CGPointValue;
        CGPoint point2 = obj2.CGPointValue;
        
        CGPoint ret = CGPointMake(MAX(fabs(point1.x), fabs(point2.x)), MAX(fabs(point1.y), fabs(point2.y)));
        
        return @(ret);
    } defaultValue:@(CGPointMake(0, 0))] CGPointValue];
    
    self.frameHeight += ret.y*2;
    self.frameWidth += ret.x*2;

}

#pragma mark - 타이포그래피

-(void)setUpTypography:(Typography *)typo{
    [self setUpTypography:typo range:self.selectedRange];
}

-(void)setUpTypography:(Typography *)typo range:(NSRange)range{
    
    if (typo == nil) {
        return;
    }
    
    // 0. 타이포그래피 모델 알맞게 준비    
    // 키보드가 올라와 있으면, 랭귀지 그에 따르기
    
    self.font = [UIFont fontWithName:typo.fontName size:typo.fontSize];
    
    if (typo.alpha == 0) { // 조만간 지워야 함. 어차피 타이포 기본 알파값 세팅을 1로 바꿈. 근데 이미 인코드(아카이브)된 최신 타이포 적용하면, 안보이게 될까봐 살려둠.
        typo.alpha = 1;
    }
    
    // 1. 타이포그래피 모델대로 텍스트뷰에 적용
    
    // 1-1. attributedText 세팅
    NSMutableAttributedString* attributedString = [self makeAttributedStringWithTypo:typo range:range];
    NSRange entireRange = NSMakeRange(0, attributedString.length);// 앞으로 타이핑할 어트리뷰트에도 적용 (-> AdvancedTextView의 기준이 됨)
    NSDictionary *updatedAttributes = [attributedString attributesAtIndex:0 longestEffectiveRange:&entireRange inRange:entireRange];
    self.typingAttributes = updatedAttributes; // 앞으로 타이핑할 어트리뷰트에도 적용 (-> AdvancedTextView의 기준이 됨)
    
    if ([attributedString.string isEqualToString:RANDOM_TEXT]) { // typingAttributes 뽑아내고 난 뒤에, 랜덤 텍스트 초기화하기
        attributedString = [[NSMutableAttributedString alloc] initWithString:@""];
    }
    self.attributedText = attributedString;
    
    // 1-2. backgroundAttributedTexts 세팅
    self.bgTextAttributes = typo.bgTextAttributes;
    
    // 생성
    if (self.backgroundAttributedTexts.count == 0){
        self.backgroundAttributedTexts = [NSMutableArray arrayWithArray:[typo.bgTextAttributes mapWithBlock:^id _Nonnull(id  _Nonnull obj, NSUInteger idx) {
            return [((BGTextAttribute*)obj) toAttributedStringWithText:self.text];
        }]];
    }
    // 업데이트
    while (self.backgroundAttributedTexts.count < self.bgTextAttributes.count){
        [self.backgroundAttributedTexts addObject:[self makeAttributedStringWithTypo:typo range:range]];
    }
    // 적용
    if (self.selectedRange.length == self.text.length){
        while (typo.bgTextAttributes.count < self.backgroundAttributedTexts.count && self.backgroundAttributedTexts.count > 1){
            [self.backgroundAttributedTexts removeLastObject];
        }
        if (typo.bgTextAttributes.count < self.backgroundAttributedTexts.count && self.backgroundAttributedTexts.count == 1){
            self.backgroundAttributedTexts = [NSMutableArray array];
        }
    }

    // 지정범위에 대해 typo, bgAttribute 적용해주기
    for (BGTextAttribute *bgTextAttribute in typo.bgTextAttributes){
        
        NSMutableAttributedString * string = self.backgroundAttributedTexts[[typo.bgTextAttributes indexOfObject:bgTextAttribute]];
        
        NSRange adjustedRange = NSMakeRange(range.location, range.length);
        
        /* 이 코드 왜 있어야 하는지 조사하고 필요없으면 빼기 (빼면 out of range 나면서 튕기는 경우를 발견하긴 함) */
        if (string.length < range.location + range.length){
            if (string.length <= range.location){
                continue;
            }else{
                adjustedRange.length = string.length - range.location;
            }
        }
        /* 이 코드 왜 있어야 하는지 조사하고 필요없으면 빼기 (빼면 out of range 나면서 튕기는 경우를 발견하긴 함) */
        
        string = [self updateAttributedString:string withFont:nil withTypo:typo withBGTextAttribute:bgTextAttribute atRange:adjustedRange];
    }
    [self setNeedsDisplay]; // DrawRect 불러주기

    // 정리
    // 텍스트뷰 리사이즈 : 배경 이미지보다 먼저 와 주어야 한다. (배경이미지뷰 사이즈 잘 잡도록)
    dispatch_async(dispatch_get_main_queue(), ^{
        [self resizeForCurrentFontSize];
    });
    
}

-(NSMutableAttributedString*)makeAttributedStringWithTypo:(Typography*)typo range:(NSRange)targetRange{
    
    NSMutableAttributedString* string = [self getAttributedText];
    
    // 아무것도 안 쓴 상태면 내용 넣어주기 (맨 밑에서 뺌)
    if (string.length == 0) {
        string = [[NSMutableAttributedString alloc] initWithString:RANDOM_TEXT];
    }
    
    NSRange range = NSMakeRange(targetRange.location, targetRange.length);
    if (range.length == 0) {
        range.length = string.length; // RandomText의 범위
    }
    
    [self setFontWithName:typo.fontName string:string size:typo.fontSize range:range];
    // 텍스트 색상 (stroke은 음수를 넣어줘서 글자 안쪽으로만 커진다. -> 양수는 Foreground색을 투명하게 한다.)
    if (typo.textColor) {
        [string addAttribute:NSForegroundColorAttributeName value:typo.textColor range:range];
        
        /* 현재 쓰여있는 텍스트의 색깔을 변경할 뿐만 아니라, 텍스트뷰 자체의 색깔을 변경해두기, 그래야 추가로 글씨 써도 똑같이 적용됨 */
        self.textColor = typo.textColor;
    }
    
    // 배경 색상
    if (typo.backgroundColor) {
        
        self.backgroundColor = typo.backgroundColor;
    }
    
    if (typo.borderColor) {
        [string addAttribute:NSStrokeColorAttributeName value:typo.borderColor range:range];
        [string addAttribute:NSStrokeWidthAttributeName value:@(typo.borderWidth) range:range];
    }
        
    // 그림자
    if (typo.shadowColor) {
        NSShadow* shadow = [[NSShadow alloc] init];
        [shadow setShadowColor: typo.shadowColor];
        [shadow setShadowOffset: typo.shadowOffset];
        [shadow setShadowBlurRadius:typo.shadowRadius];
        [string addAttribute:NSShadowAttributeName value:shadow range:range];
    } else {
        [string removeAttribute:NSShadowAttributeName range:range];
    }
    
    // 정렬
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:self.textAlignment];
    [paragraphStyle setLineSpacing:2];
    [string addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];

    return string;
    
}

-(NSMutableAttributedString*)updateAttributedString:(NSMutableAttributedString*)string withFont:(UIFont*)font withTypo:(Typography*)typo withBGTextAttribute:(BGTextAttribute*)bgTextAttribute atRange:(NSRange)range{
    
    if (font) {
        [string addAttribute:NSFontAttributeName value:font range:range];
    } else if (typo) {
        font = [UIFont fontWithName:typo.fontName size:typo.fontSize];
        [string addAttribute:NSFontAttributeName value:font range:range];
    }
    
    
    // 아무것도 안 쓴 상태면 내용 넣어주기 (맨 밑에서 뺌)
    if (string.length == 0) {
        string = [[NSMutableAttributedString alloc] initWithString:RANDOM_TEXT];
    }
    
    // 텍스트 색상 (stroke은 음수를 넣어줘서 글자 안쪽으로만 커진다. -> 양수는 Foreground색을 투명하게 한다.)
    if (bgTextAttribute.textColor) {
        [string addAttribute:NSForegroundColorAttributeName value:bgTextAttribute.textColor range:range];
    }
    
    if (bgTextAttribute.borderColor) {
        [string addAttribute:NSStrokeColorAttributeName value:bgTextAttribute.borderColor range:range];
        [string addAttribute:NSStrokeWidthAttributeName value:@(bgTextAttribute.borderWidth) range:range];
    }
        
    // 그림자
    if (bgTextAttribute.shadowColor) {
        NSShadow* shadow = [[NSShadow alloc] init];
        [shadow setShadowColor: bgTextAttribute.shadowColor];
        [shadow setShadowOffset: CGSizeMake(bgTextAttribute.shadowOffset.x, bgTextAttribute.shadowOffset.y)];
        [shadow setShadowBlurRadius:bgTextAttribute.shadowRadius];
        [string addAttribute:NSShadowAttributeName value:shadow range:range];
    } else {
        [string removeAttribute:NSShadowAttributeName range:range];
    }
    return string;
    
}
-(void)setFontWithName:(NSString *)name string:(NSMutableAttributedString *)string size:(float)size range:(NSRange)range{
    
    if (name) {
        UIFont* font = [UIFont fontWithName:name size:size];
        if (font) {
            [string addAttribute:NSFontAttributeName value:font range:range];
            self.font = font; /* 현재 쓰여있는 텍스트의 폰트만 변경할 뿐만 아니라, 텍스트뷰 자체의 폰트를 변경해두기 */
        }
    }
    
}

-(void)setTextSelectedRangeWithPoint:(CGPoint)currentPointInTextView{
    
    NSArray *lines = [self.text componentsSeparatedByString:@"\n"];
    float textViewHeight = self.frameHeight;
    float heightOfLine = textViewHeight/(float)lines.count;
    
    NSUInteger sumOfAboveStringLength = 0;
    NSRange stringRange = NSMakeRange(0, 0);
    
    for (int i = 0; i < lines.count; i++) {
        CGRect currentLineTextViewRect = CGRectMake(0, i*heightOfLine, self.frameWidth, heightOfLine);
        NSString *stringOfLine = lines[i];
        
        if (CGRectContainsPoint(currentLineTextViewRect, currentPointInTextView)) {
            if (i == 0) {
                stringRange = NSMakeRange(0, stringOfLine.length);
            } else {
                stringRange = NSMakeRange(sumOfAboveStringLength+1, stringOfLine.length);
            }
            CGRect currentLineBoundingRect = [self boundingRectForCharacterRange:stringRange];
            float pointDevidedByRect = (currentPointInTextView.x-currentLineBoundingRect.origin.x)/currentLineBoundingRect.size.width;
            if (pointDevidedByRect >= 1) {
                pointDevidedByRect = 1;
            } else if (pointDevidedByRect <= 0){
                pointDevidedByRect = 0;
            }
            
            self.selectedRange = NSMakeRange(roundf((pointDevidedByRect) * (stringOfLine.length))+sumOfAboveStringLength+i, 0);
        }
        sumOfAboveStringLength += stringOfLine.length;
    }

}


@end
