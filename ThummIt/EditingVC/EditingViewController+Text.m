//
//  EditingViewController+Text.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/09.
//

#import "EditingViewController+Text.h"
#import "UIImage+Additions.h"
@implementation EditingViewController (Text)

-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    textView.selectedRange = NSMakeRange(textView.text.length, 0);
    if( !self.currentText.isTypedByUser){
        self.originalCursorColor = self.currentText.textView.tintColor;
        self.currentText.textView.tintColor = [UIColor clearColor];
    }

}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    self.justTyped = text;
    
    return YES;
}


-(void)textViewDidChange:(UITextView *)textView{
    
    if(!self.currentText.isTypedByUser){
        self.currentText.textView.text = self.justTyped;//추가로 입력된 글자만 출력되게
        self.currentText.textView.tintColor = self.originalCursorColor;
        self.itemCollectionVC.doneButton.enabled = false;
        self.itemCollectionVC.doneButton.alpha = 0.4;
    }
    if (textView.text.length == 0) {
        self.itemCollectionVC.doneButton.enabled = false;
        self.itemCollectionVC.doneButton.alpha = 0.4;
    } else {
        self.itemCollectionVC.doneButton.enabled = true;
        self.itemCollectionVC.doneButton.alpha = 1.0;
    }

    // 배경이미지 있는 타이포의 경우 사이즈 조정
    if (self.currentText.typo.bgImageName) {
        [self.currentText updateBackgroundImageViewFrame:self.currentText.typo];
        self.currentText.backgroundImageView.centerX += self.currentText.typo.bgCenterXDelta;
    }

    self.currentText.text = textView.text;
    self.currentText.isTypedByUser = true;
    [self.currentText.textView setNeedsDisplay];
    
    // 부분 타이포 적용
    for (NSMutableAttributedString *attributedText in self.currentText.backgroundAttributedTexts) {
        attributedText.mutableString.string = textView.text;
    }
    NSRange prevRange = self.currentText.textView.selectedRange;
    [self.currentText applyTypo:self.currentText.typo];
    [self.currentText.textViewContainer setNeedsLayout];
    self.currentText.textView.selectedRange = prevRange;
    
    if (self.currentText.typo.textColorPatternImageName.length > 0) {
        UIImage *patternImage = [UIImage imageNamed:self.currentText.typo.textColorPatternImageName];
        UIImage *resizedImage = [UIImage imageWithImage:patternImage convertToSize:CGSizeMake(self.currentText.baseView.boundsWidth, self.currentText.baseView.boundsHeight)];
        self.currentText.typo.textColor = [UIColor colorWithPatternImage:resizedImage];
        [self.currentText applyTypo:self.currentText.typo];
    }
}

@end
