//
//  EditingLayerController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/19.
//

#import "EditingLayerController.h"

@implementation EditingLayerController
-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)bringSelectedItemToFront:(Item *)selectedItem{
    
    if (!self.transparentView) {
        self.transparentView = [[UIView alloc] initWithFrame:self.imageView.frame];
        self.transparentView.backgroundColor = UIColor.blackColor;
        self.transparentView.alpha = 0.4;
        [self.view insertSubview:self.transparentView belowSubview:self.gestureView];
    }
    
    self.selectedItem = selectedItem;
    self.originalIndex = [self.view.subviews indexOfObject:self.selectedItem.baseView];
    UIView *selectedItemBaseView = self.selectedItem.baseView;
    [self.view insertSubview:selectedItemBaseView belowSubview:self.gestureView];
    
}

-(void)recoverOriginalLayer{
    
    [self.transparentView removeFromSuperview];
    self.transparentView = nil;
    [self.view insertSubview:self.selectedItem.baseView atIndex:self.originalIndex];
    
}

@end
