//
//  ItemCollectionViewController+Text.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/09.
//

#import "ItemCollectionViewController+Text.h"
#import "EditingViewController.h"
#import "EditingViewController+Text.h"
#import "EditingViewController+Buttons.h"

@implementation ItemCollectionViewController (Text)

#pragma mark - 텍스트 컨트롤러

-(void)didSelectTypo:(Typography *)typo{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
        
    Text *text = [[Text alloc] init];
    text.textView.delegate = editingVC;

    text.text = typo.name;
    text.textView.text = text.text;
    text.textAlignment = NSTextAlignmentCenter;
    text.textView.textAlignment = NSTextAlignmentCenter;
    
    [text applyTypo:typo];
    [text resize];
    [text.textView setNeedsDisplay];

    text.textViewContainer.center = editingVC.bgView.center;
    text.center = text.textViewContainer.center;


    if (!text.typo.cannotChangeColor) {
        [UIView animateWithDuration:0.2 animations:^{
            editingVC.hueSlider.alpha = 1.0;
            editingVC.thumbCircleView.alpha = 1.0;
        }];
    } else {

        [editingVC hideAndInitSlider];
    }

    if (editingVC.currentItem) {
        
        text.baseView.center = editingVC.currentItem.baseView.center;
        text.baseView.transform = editingVC.currentItem.baseView.transform;
        [editingVC.currentItem.baseView removeFromSuperview];
    }
    
    [editingVC.layerController bringCurrentItemToFront:text];
    
    editingVC.currentItem = text;
    editingVC.currentText = text;
    editingVC.recentTypo = typo;
    editingVC.gestureController.currentItem = text;

}

-(void)showPlaceHolderOfText:(Text *)text withTypo:(Typography *)typo{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    text.placeholderImageView = [Text makePlaceHolderWithTypo:typo];
    text.textViewContainer.frameSize = text.placeholderImageView.frameSize;
    text.textView.frameSize = text.textViewContainer.frameSize;
    [text.textViewContainer insertSubview:text.placeholderImageView belowSubview:text.textView];
    text.textViewContainer.center = editingVC.bgView.center;
    
}

@end
