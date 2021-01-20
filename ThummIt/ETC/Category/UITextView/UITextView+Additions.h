//
//  UITextView+Additions.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (Additions)

-(void)resizeForCurrentFontSize;
- (CGRect)boundingRectForCharacterRange:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
