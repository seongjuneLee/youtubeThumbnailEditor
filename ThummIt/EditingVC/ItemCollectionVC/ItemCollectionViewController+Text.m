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
        editingVC.hueSlider.alpha = 1.0;
    } else {
        [editingVC hideAndInitSlider];
        editingVC.hueSlider.alpha = 0.0;
    }

    if (editingVC.currentItem) {
        // 위치, 크기,사진 유지
        [editingVC.currentItem.baseView removeFromSuperview];// 기존 것 떼어주고
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
