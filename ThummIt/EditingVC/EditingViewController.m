//
//  EditingViewController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/14.
//

#import "EditingViewController.h"
#import "EditingViewController+GestureControllerDelegate.h"
#import "EditingViewController+ModeControllerDelegate.h"

@interface EditingViewController ()

@end

@implementation EditingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [PhotoManager.sharedInstance fetchPhassets];
    [self loadItems];

    [self basicUIUXSetting];

    [self connectEditingControllers];
}

-(void)viewWillLayoutSubviews{

    float imageViewBottomY = self.imageView.frameY + self.imageView.frameHeight;
    self.albumVC.view.frameSize = CGSizeMake(self.view.frameWidth, self.view.frameHeight - imageViewBottomY);
    self.albumVC.view.frameOrigin = CGPointMake(0, imageViewBottomY);
    
}


-(void)basicUIUXSetting{
    
    self.imageView.userInteractionEnabled = true;
    
}

-(void)setUpWithTemplate{
    
    // 포토 프레임 올려줌
    self.imageView.backgroundColor = self.selectedTemplate.backgroundColor;
    for (Item *item in self.selectedTemplate.items) {
        CGPoint convertedPoint = [self.imageView convertPoint:item.baseView.center fromView:self.view];
        CGPoint center = CGPointMake(convertedPoint.x/self.imageView.frameWidth, convertedPoint.y/self.imageView.frameHeight);
        item.center = center;
        [self.view insertSubview:item.baseView belowSubview:self.gestureView];
    }
    [SaveManager.sharedInstance save];

}

#pragma mark - controller 연결

-(void)connectEditingControllers{
    
    [self connectEditingModeController];
    [self connectEditingGestureController];
    [self connectEditingLayerController];
    
}

-(void)connectEditingGestureController{
    
    self.editingGestureController = [[EditingGestureController alloc] initWithView:self.gestureView];
    self.editingGestureController.delegate = self;
    self.editingGestureController.editingMode = self.editingModeController.editingMode;
    //TODO : 모든 아이템 넘겨주기.
    self.editingGestureController.items = SaveManager.sharedInstance.currentProject.items;
    self.editingGestureController.editingModeController = self.editingModeController;

}

-(void)connectEditingModeController{
    
    self.editingModeController = [[EditingModeController alloc] init];
    self.editingModeController.delegate = self;
    self.editingModeController.leftItemWidthConstraint = self.leftItemWidthConstraint;
    self.editingModeController.leftItem = self.leftItem;
    self.editingModeController.rightItem = self.rightItem;
    
}

-(void)connectEditingLayerController{
    
    self.editingLayerController = [[EditingLayerController alloc] init];
    self.editingLayerController.imageView = self.imageView;
    self.editingLayerController.view = self.view;
    self.editingLayerController.gestureView = self.gestureView;
    
}

#pragma mark - load Saved Data

-(void)loadItems{
    
    Project *project = SaveManager.sharedInstance.currentProject;
    self.imageView.backgroundColor = project.backgroundColor;
    
    float imageViewWidth = self.view.frameWidth;
    float imageViewHeight = imageViewWidth * 9/16;
    for (Item *item in project.items) {
        float itemX = imageViewWidth * item.center.x;
        float itemY = imageViewHeight * item.center.y + self.imageView.frameY;
        [item scaleItem];
        CGPoint itemCenter = CGPointMake(itemX, itemY);
        item.baseView.center = itemCenter;
        [self.view insertSubview:item.baseView belowSubview:self.gestureView];
    }
    [SaveManager.sharedInstance save];

}

@end
