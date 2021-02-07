//
//  AlbumViewController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/12.
//

#import "AlbumViewController.h"
#import "EditingViewController.h"
#import "EditingViewController+Buttons.h"

@interface AlbumViewController ()

@end

@implementation AlbumViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self.collectionView registerNib:[UINib nibWithNibName:@"AlbumCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"AlbumCollectionViewCell"];
    
    [self setCollectionViewFlowLayout];
    self.phAssets = PhotoManager.sharedInstance.phassets;
    [self.collectionView reloadData];
    [self makeViewBlurred];

}

-(void)makeViewBlurred{
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleProminent];
    self.blurView = [[UIVisualEffectView alloc] init];
    self.blurView.frameSize = self.view.frameSize;
    self.blurView.effect = blurEffect;
    [self.view insertSubview:self.blurView atIndex:0];
    
}


-(void)dismissSelf{
    
    self.cancelButton.hidden = true;
    self.doneButton.hidden = true;
    [UIView animateWithDuration:0.4 animations:^{
        self.blurView.frameY = self.view.frameHeight;
        self.collectionViewTopConstraint.constant = self.view.frameHeight;
        [self.view layoutIfNeeded];
    }completion:^(BOOL finished) {
        self.cancelButton.hidden = false;
        self.doneButton.hidden = false;
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];

}

- (void)setCollectionViewFlowLayout {
    
    NSUInteger numberOfColumns = 3;

    // 칼럼 갯수
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    
    // 중간 스페이싱, 좌우 인셋을 빼고 남은 공간이 셀을 위한 공간
    CGFloat availableWidthForCells = CGRectGetWidth(self.view.frame) - flowLayout.sectionInset.left - flowLayout.sectionInset.right - flowLayout.minimumInteritemSpacing * (numberOfColumns - 1);
    
    // 셀 사이즈
    CGFloat cellWidth = availableWidthForCells / numberOfColumns ;
    flowLayout.itemSize = CGSizeMake(cellWidth, cellWidth);
    
}
    
- (IBAction)albumCancelButtonTapped:(id)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    [editingVC cancelEditingPhotoFrame];
    
}

- (IBAction)albumDoneButtonTapped:(id)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    [editingVC doneEditingPhotoFrame];
    
}



@end
