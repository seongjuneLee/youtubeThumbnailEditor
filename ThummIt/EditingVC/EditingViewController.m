//
//  EditingViewController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/14.
//

#import "EditingViewController.h"
#import "EditingViewController+GestureControllerDelegate.h"
#import "EditingViewController+Buttons.h"

@interface EditingViewController ()

@end

@implementation EditingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [PhotoManager.sharedInstance fetchPhassets];
    [self loadItems];

    [self basicUIUXSetting];

    [self connectControllers];
    
    [self addExtraGestureToButtons];
}



-(void)viewWillLayoutSubviews{

    float imageViewBottomY = self.bgView.frameY + self.bgView.frameHeight;
    self.itemCollectionVC.view.frame = CGRectMake(0, imageViewBottomY, self.view.frameWidth, self.view.frameHeight - imageViewBottomY);
    
}


-(void)basicUIUXSetting{
    
    self.bgView.userInteractionEnabled = true;
    
}

-(void)setUpWithTemplate{
    
    // 포토 프레임 올려줌
    self.bgView.backgroundColor = self.selectedTemplate.backgroundColor;
    for (Item *item in self.selectedTemplate.items) {
        [self.view insertSubview:item.baseView belowSubview:self.gestureView];
    }
    [SaveManager.sharedInstance save];

}

#pragma mark - controller 연결

-(void)connectControllers{
    
    [self connectEditingModeController];
    [self connectEditingGestureController];
    [self connectEditingLayerController];
    
    UIStoryboard *editing = [UIStoryboard storyboardWithName:@"Editing" bundle:NSBundle.mainBundle];
    self.itemCollectionVC = (ItemCollectionViewController *)[editing instantiateViewControllerWithIdentifier:@"ItemCollectionViewController"];
    self.itemCollectionVC.editingVC = self;

}

-(void)connectEditingGestureController{
    
    self.editingGestureController = [[EditingGestureController alloc] init];
    self.editingGestureController.editingVC = self;
    self.editingGestureController.delegate = self;
    self.editingGestureController.currentItem = self.currentItem;
    [self.editingGestureController addGestureRecognizers];
    
}

-(void)connectEditingModeController{
    
    self.editingModeController = [[EditingModeController alloc] init];
    self.editingModeController.editingVC = self;
    
}

-(void)connectEditingLayerController{
    
    self.editingLayerController = [[EditingLayerController alloc] init];
    self.editingLayerController.editingVC = self;
    
}

#pragma mark - load Saved Data

-(void)loadItems{
    
    Project *project = SaveManager.sharedInstance.currentProject;
    self.bgView.backgroundColor = project.backgroundColor;
    
    float imageViewWidth = self.view.frameWidth;
    float imageViewHeight = imageViewWidth * 9/16;
    for (Item *item in project.items) {
        if (item.isTemplateItem) {
            float itemX = imageViewWidth * item.center.x;
            float itemY = imageViewHeight * item.center.y + self.bgView.frameY;
            CGPoint itemCenter = CGPointMake(itemX, itemY);
            [item scaleItem];
            item.baseView.center = itemCenter;
        }
        [self.view insertSubview:item.baseView belowSubview:self.gestureView];
    }
    [SaveManager.sharedInstance save];

}

-(void)addExtraGestureToButtons{
    
    [self.photoFrameButton addTarget:self action:@selector(photoFrameButtonHoldDown) forControlEvents:UIControlEventTouchDown];
    [self.photoFrameButton addTarget:self action:@selector(photoFrameButtonHoldDown) forControlEvents:UIControlEventTouchDragEnter];
    [self.photoFrameButton addTarget:self action:@selector(photoFrameButtonHoldRelease) forControlEvents:UIControlEventTouchDragExit];
    [self.photoFrameButton addTarget:self action:@selector(photoFrameButtonHoldRelease) forControlEvents:UIControlEventTouchUpInside];
    [self.photoFrameButton addTarget:self action:@selector(photoFrameButtonHoldRelease) forControlEvents:UIControlEventTouchUpOutside];
    [self.photoFrameButton addTarget:self action:@selector(photoFrameButtonHoldRelease) forControlEvents:UIControlEventTouchCancel];

    [self.textButton addTarget:self action:@selector(textButtonHoldDown) forControlEvents:UIControlEventTouchDown];
    [self.textButton addTarget:self action:@selector(textButtonHoldDown) forControlEvents:UIControlEventTouchDragEnter];
    [self.textButton addTarget:self action:@selector(textButtonHoldRelease) forControlEvents:UIControlEventTouchUpInside];
    [self.textButton addTarget:self action:@selector(textButtonHoldRelease) forControlEvents:UIControlEventTouchDragExit];
    [self.textButton addTarget:self action:@selector(textButtonHoldRelease) forControlEvents:UIControlEventTouchUpOutside];
    [self.textButton addTarget:self action:@selector(textButtonHoldRelease) forControlEvents:UIControlEventTouchCancel];

    [self.stickerButton addTarget:self action:@selector(stickerButtonHoldDown) forControlEvents:UIControlEventTouchDown];
    [self.stickerButton addTarget:self action:@selector(stickerButtonHoldDown) forControlEvents:UIControlEventTouchDragEnter];
    [self.stickerButton addTarget:self action:@selector(stickerButtonHoldRelease) forControlEvents:UIControlEventTouchUpInside];
    [self.stickerButton addTarget:self action:@selector(stickerButtonHoldRelease) forControlEvents:UIControlEventTouchDragExit];
    [self.stickerButton addTarget:self action:@selector(stickerButtonHoldRelease) forControlEvents:UIControlEventTouchUpOutside];
    [self.stickerButton addTarget:self action:@selector(stickerButtonHoldRelease) forControlEvents:UIControlEventTouchCancel];

    [self.bgColorButton addTarget:self action:@selector(bgColorButtonHoldDown) forControlEvents:UIControlEventTouchDown];
    [self.bgColorButton addTarget:self action:@selector(bgColorButtonHoldDown) forControlEvents:UIControlEventTouchDragEnter];
    [self.bgColorButton addTarget:self action:@selector(bgColorButtonHoldRelease) forControlEvents:UIControlEventTouchUpInside];
    [self.bgColorButton addTarget:self action:@selector(bgColorButtonHoldRelease) forControlEvents:UIControlEventTouchDragExit];
    [self.bgColorButton addTarget:self action:@selector(bgColorButtonHoldRelease) forControlEvents:UIControlEventTouchUpOutside];
    [self.bgColorButton addTarget:self action:@selector(bgColorButtonHoldRelease) forControlEvents:UIControlEventTouchCancel];

}

@end
