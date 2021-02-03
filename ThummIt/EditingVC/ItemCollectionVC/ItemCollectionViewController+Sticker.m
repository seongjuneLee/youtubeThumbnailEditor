//
//  ItemCollectionViewController+Sticker.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/13.
//

#import "ItemCollectionViewController+Sticker.h"
#import "EditingViewController.h"
#import "EditingViewController+Buttons.h"

@implementation ItemCollectionViewController (Sticker)

#pragma mark - 스티커 컨트롤러

-(void)didSelectSticker:(Sticker *)sticker{
    
    [sticker loadView];
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    sticker.baseView.center = editingVC.bgView.center;
    sticker.center = editingVC.bgView.center;
    UIImage *image = [UIImage imageNamed:sticker.backgroundImageName];
    if (!sticker.cannotChangeColor) {
        sticker.backgroundImageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        sticker.backgroundImageView.tintColor = [UIColor whiteColor];

        [UIView animateWithDuration:0.2 animations:^{
            editingVC.hueSlider.alpha = 1.0;
            editingVC.thumbCircleView.alpha = 1.0;
        }];
    } else{

        sticker.backgroundImageView.image = [UIImage imageNamed:sticker.backgroundImageName];
        [editingVC hideAndInitSlider];        

    }
    if (editingVC.currentItem) {
        
        sticker.baseView.center = editingVC.currentItem.baseView.center;
        sticker.baseView.transform = editingVC.currentItem.baseView.transform;
        [editingVC.currentItem.baseView removeFromSuperview];
        
    }
    
    [editingVC.layerController bringCurrentItemToFront:sticker];
    
    editingVC.currentItem = sticker;
    editingVC.currentSticker = sticker;
    editingVC.layerController.currentItem = sticker;
    
}

@end
