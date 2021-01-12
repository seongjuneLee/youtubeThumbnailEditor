//
//  EditingViewController+Text.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/09.
//

#import "EditingViewController+Text.h"

@implementation EditingViewController (Text)

-(void)textViewDidBeginEditing:(UITextView *)textView{

    if (self.currentText.placeholderImageView) {
        self.currentText.textView.tintColor = UIColor.clearColor;
    }
    
}

-(void)textViewDidChange:(UITextView *)textView{
    
    UIColor* originalTintColor = [UIColor colorWithRed:79.0/255.0 green:163.0/255.0 blue:249.0/255.0 alpha:1.0];
    if (self.currentText.placeholderImageView) {
        self.currentText.textView.tintColor = originalTintColor;
        [self.currentText.placeholderImageView removeFromSuperview];
        self.currentText.placeholderImageView = nil;
    }
    self.currentText.text = textView.text;
    [self.currentText resize];
}

@end
