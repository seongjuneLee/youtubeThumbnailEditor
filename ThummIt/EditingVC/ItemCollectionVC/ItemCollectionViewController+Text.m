//
//  ItemCollectionViewController+Text.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/09.
//

#import "ItemCollectionViewController+Text.h"
#import "EditingViewController.h"

@implementation ItemCollectionViewController (Text)



#pragma mark - 텍스트 컨트롤러

-(void)didSelectTypo:(Typography *)typo{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    Text *text = [[Text alloc] init];
    text.typo = typo;
    [self showPlaceHolderOfText:text];
    
    if (editingVC.currentItem) {
        // 위치, 크기,사진 유지
        [editingVC.currentItem.baseView removeFromSuperview];// 기존 것 떼어주고
    }
    
    [editingVC.editingLayerController bringCurrentItemToFront:text];
    
    editingVC.currentItem = text;
    editingVC.editingGestureController.currentItem = text;

}

-(void)showPlaceHolderOfText:(Text *)text{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    text.placeholderImageView = [Text makePlaceHolderWithTypo:text.typo];
    text.textViewContainer.frameSize = text.placeholderImageView.frameSize;
    text.textView.frameSize = text.textViewContainer.frameSize;
    [text.textViewContainer addSubview:text.placeholderImageView];
    text.textViewContainer.center = editingVC.imageView.center;

}

@end
