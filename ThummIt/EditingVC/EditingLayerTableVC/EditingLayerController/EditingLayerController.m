//
//  EditingLayerController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/19.
//

#import "EditingLayerController.h"
#import "EditingViewController.h"
#import "EditingViewController+GestureControllerDelegate.h"

@implementation EditingLayerController
-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)bringCurrentItemToFront{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    //바꾸기전 index를 저장해놓고
    self.originalIndex = [editingVC.view.subviews indexOfObject:editingVC.currentItem.baseView];
    //item을 젤 위로 올리고
    [editingVC.view insertSubview:editingVC.currentItem.baseView belowSubview:editingVC.gestureView];
    //올려진 상태로 다시 indexinlayer 값 모든 item들에 대해 저장
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[self.editingVC.view.subviews indexOfObject:item.baseView]];
    }
    
}

-(void)showTransparentView{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    if (!self.transparentView) {
        self.transparentView = [[UIView alloc] initWithFrame:editingVC.bgView.frame];
        self.transparentView.backgroundColor = UIColor.blackColor;
        self.transparentView.alpha = 0.4;
        [editingVC.view insertSubview:self.transparentView belowSubview:editingVC.gestureView];
    }
    
}

-(void)recoverOriginalLayer{
    //transparentview 제거 & 원래 index위치에 currentitem 위치시킴 & 위치시킨 대로 indexinlayer 저장
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    [self.transparentView removeFromSuperview];
    self.transparentView = nil;
    
    [editingVC.view insertSubview:editingVC.currentItem.baseView atIndex:self.originalIndex];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[self.editingVC.view.subviews indexOfObject:item.baseView]];
    }
}

-(void)hideTransparentView{
    //transparentview만 제거
    [self.transparentView removeFromSuperview];
    self.transparentView = nil;
}

-(void)updateLayer{
    
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        [self.editingVC.view insertSubview:item.baseView atIndex:item.indexInLayer.integerValue];
    }
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[self.editingVC.view.subviews indexOfObject:item.baseView]];
    }
}

@end
