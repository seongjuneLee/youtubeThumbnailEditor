//
//  BGColorViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/12.
//

#import "BGColorViewController.h"
#import "EditingViewController.h"
#import "EditingViewController+Buttons.h"
#import "ItemCollectionViewController.h"
#import "ItemCollectionViewController+Button.h"
#import "UIImage+Additions.h"
@interface BGColorViewController ()

@end

@implementation BGColorViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self connectBGColorCollectionController];
    
}

-(void)dismissSelf{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.view.alpha = 0;
    }completion:^(BOOL finished) {
        self.view.alpha = 1;
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];

}

-(void)connectBGColorCollectionController{
    
    self.collectionController = [[BGColorCollectionController alloc] initWithCollectionView:self.collectionView];
    self.collectionController.editingVC = self.editingVC;
    
}

#pragma mark - 버튼

- (IBAction)doneButtonTapped:(UIButton *)sender {
    
    [self doneEditingBGColor];
}

- (IBAction)cancelButtonTapped:(UIButton *)sender {
    
    [self cancelEditingBGColor];

}
-(void)doneEditingBGColor{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [UIView animateWithDuration:0.2 animations:^{
        editingVC.buttonScrollView.alpha = 1.0;
    }];
    [editingVC.bgColorVC dismissSelf];
    SaveManager.sharedInstance.currentProject.backgroundColor = editingVC.bgView.backgroundColor;
    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.modeController.editingMode = NormalMode;

}

-(void)cancelEditingBGColor{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    // scrollView 가려주기
    [UIView animateWithDuration:0.2 animations:^{
        editingVC.buttonScrollView.alpha = 1.0;
    }];
    [editingVC.bgColorVC dismissSelf];
    editingVC.bgView.backgroundColor = editingVC.originalColor;
    editingVC.modeController.editingMode = NormalMode;
}



@end
