//
//  ItemCollectionViewController+Text.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/09.
//

#import "ItemCollectionViewController+Text.h"
#import "EditingViewController.h"
#import "EditingViewController+Text.h"

@implementation ItemCollectionViewController (Text)

#pragma mark - 텍스트 컨트롤러

-(void)didSelectTypo:(Typography *)typo{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    Text *text = [[Text alloc] init];
    text.textView.delegate = editingVC;
    [self showPlaceHolderOfText:text withTypo:typo];
    [text applyTypo:typo];

    if (editingVC.currentItem) {
        // 위치, 크기,사진 유지
        [editingVC.currentItem.baseView removeFromSuperview];// 기존 것 떼어주고
    }
    
    [editingVC.editingLayerController bringCurrentItemToFront:text];
    
    editingVC.currentItem = text;
    editingVC.currentText = text;
    editingVC.recentTypo = typo;
    editingVC.editingGestureController.currentItem = text;

}

-(void)showPlaceHolderOfText:(Text *)text withTypo:(Typography *)typo{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    text.placeholderImageView = [Text makePlaceHolderWithTypo:typo];
    text.textViewContainer.frameSize = text.placeholderImageView.frameSize;
    text.textView.frameSize = text.textViewContainer.frameSize;
    [text.textViewContainer insertSubview:text.placeholderImageView belowSubview:text.textView];
    text.textViewContainer.center = editingVC.bgView.center;
    text.center = editingVC.bgView.center;
    
}

@end
