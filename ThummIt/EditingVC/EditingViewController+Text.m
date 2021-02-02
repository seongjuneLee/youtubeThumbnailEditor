//
//  EditingViewController+Text.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/09.
//

#import "EditingViewController+Text.h"

@implementation EditingViewController (Text)

-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    if( !self.currentText.isTypedByUser){
        self.originalCursorColor = self.currentText.textView.tintColor;
        self.currentText.textView.tintColor = [UIColor clearColor];
    }

}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    self.originalText = text;
    
    return YES;
}


-(void)textViewDidChange:(UITextView *)textView{
    
    
    if(!self.currentText.isTypedByUser){
        self.currentText.textView.text = self.originalText;//추가로 입력된 글자만 출력되게
        self.currentText.textView.tintColor = self.originalCursorColor;
    }
    NSLog(@"%@",self.currentText.text);
    NSLog(@"%@",self.currentText.typo.name);
    
    self.currentText.text = textView.text;
    self.currentText.isTypedByUser = true;
    [self.currentText resize];
    [self.currentText.textView setNeedsDisplay];
    for (NSMutableAttributedString* attributedText in self.currentText.backgroundAttributedTexts) {
        attributedText.mutableString.string = textView.text;
    }
}

@end
