//
//  ItemCollectionViewController.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import "ItemCollectionViewController.h"
#import "EditingViewController.h"
#import "ItemCollectionViewController+Button.h"
@interface ItemCollectionViewController ()

@end

@implementation ItemCollectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setCollectionViewFlowLayout];

}

-(void)viewWillAppear:(BOOL)animated{
    
    [self connectCollectionController];
}

-(void)viewWillLayoutSubviews{
    
}

-(void)dismissSelf{
    
    NSLog(@"self.containerView.frameY %f",self.containerView.frameY);
    [UIView animateWithDuration:0.4 animations:^{
        self.cancelButton.alpha = self.checkButton.alpha = 0;
        self.containerTopConstraint.constant = -self.view.frameHeight;
        [self.view layoutIfNeeded];
    }completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
    
}


- (void)setCollectionViewFlowLayout {
    
    NSUInteger numberOfColumns = 4;

    // 칼럼 갯수
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    // 중간 스페이싱, 좌우 인셋을 빼고 남은 공간이 셀을 위한 공간
    CGFloat availableWidthForCells = CGRectGetWidth(self.view.frame) - flowLayout.sectionInset.left - flowLayout.sectionInset.right - flowLayout.minimumInteritemSpacing * (numberOfColumns - 1);
    
    // 셀 사이즈
    CGFloat cellWidth = availableWidthForCells / numberOfColumns ;
    flowLayout.itemSize = CGSizeMake(cellWidth, cellWidth);
    
}

-(void)connectCollectionController{
    
    self.collectionView.hidden = false;
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (self.itemType == PhotoFrameType) {
        self.photoFrameCollectionController = [[PhotoFrameCollectionController alloc] initWithCollectionView:self.collectionView];
        self.photoFrameCollectionController.editingVC = self.editingVC;
        if (editingVC.currentPhotoFrame.isFixedPhotoFrame) {
            self.photoFrameScrollContanerView.hidden = true;
            self.textScrollContainerView.hidden = true;
            self.collectionView.hidden = true;
        } else {
            self.photoFrameScrollContanerView.hidden = false;
            self.textScrollContainerView.hidden = true;
        }
    } else if (self.itemType == TextType){
        self.textCollectionController = [[TextCollectionController alloc] initWithCollectionView:self.collectionView];
        self.textCollectionController.editingVC = self.editingVC;
        self.photoFrameScrollContanerView.hidden = true;
        self.textScrollContainerView.hidden = false;
    }else if (self.itemType == StickerType){
        self.stickerCollectionController = [[StickerCollectionController alloc] initWithCollectionView:self.collectionView];
        self.stickerCollectionController.editingVC = self.editingVC;
        self.photoFrameScrollContanerView.hidden = true;
        self.textScrollContainerView.hidden = true;
    }
    
    
}




@end
