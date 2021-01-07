//
//  EditingLayerController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/19.
//

#import "EditingLayerController.h"
#import "EditingViewController.h"

@implementation EditingLayerController
-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)bringCurrentItemToFront:(Item *)currentItem{
    
    self.currentItem = currentItem;

    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    self.originalIndex = [editingVC.view.subviews indexOfObject:self.currentItem.baseView];
    [editingVC.view insertSubview:self.currentItem.baseView belowSubview:editingVC.gestureView];
    
}

-(void)showTransparentView{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    if (!self.transparentView) {
        self.transparentView = [[UIView alloc] initWithFrame:editingVC.imageView.frame];
        self.transparentView.backgroundColor = UIColor.blackColor;
        self.transparentView.alpha = 0.4;
        [editingVC.view insertSubview:self.transparentView belowSubview:editingVC.gestureView];
    }
    
}

-(void)recoverOriginalLayer{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    [self.transparentView removeFromSuperview];
    self.transparentView = nil;
    [editingVC.view insertSubview:self.currentItem.baseView atIndex:self.originalIndex];
    
}
-(void)hideTransparentView{
    [self.transparentView removeFromSuperview];
    self.transparentView = nil;
}

@end
