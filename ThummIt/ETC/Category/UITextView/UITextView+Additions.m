//
//  UITextView+Additions.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import "UITextView+Additions.h"

@implementation UITextView (Additions)

-(void)resizeForCurrentFontSize{
    
    CGRect newBounds = self.bounds;
    CGSize newSize = [self sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    newBounds.size = CGSizeMake(newSize.width + 40, newSize.height);
    self.frame = newBounds;
    
}

- (CGRect)boundingRectForCharacterRange:(NSRange)range{
    
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:[self attributedText]];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:[self bounds].size];
    textContainer.lineFragmentPadding = 0;
    [layoutManager addTextContainer:textContainer];

    NSRange glyphRange;

    // Convert the range for glyphs.
    [layoutManager characterRangeForGlyphRange:range actualGlyphRange:&glyphRange];

    return [layoutManager boundingRectForGlyphRange:glyphRange inTextContainer:textContainer];
    
}



@end
