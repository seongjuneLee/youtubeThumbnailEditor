//
//  EditingViewController+Text.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/09.
//

#import "EditingViewController+Text.h"

@implementation EditingViewController (Text)

-(void)textViewDidBeginEditing:(UITextView *)textView{
}

-(void)textViewDidChange:(UITextView *)textView{
    
    self.currentText.text = textView.text;
    self.currentText.isTypedByUser = true;
    [self.currentText resize];
    [self.currentText.textView setNeedsDisplay];
    for (NSMutableAttributedString* attributedText in self.currentText.backgroundAttributedTexts) {
        attributedText.mutableString.string = textView.text;
    }
}

@end
