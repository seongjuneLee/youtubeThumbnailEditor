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
}


-(void)showWithAnimation{
    
    self.collectionViewTopConstraint.constant = self.view.frameHeight;
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.collectionViewTopConstraint.constant = 0;
        [self.view layoutIfNeeded];
    } completion:nil];

}

-(void)hideWithAnimation{
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.collectionViewTopConstraint.constant = self.view.frameHeight;
        [self.view layoutIfNeeded];
    } completion:nil];
}


-(void)dismissSelf{
    
    [UIView animateWithDuration:0.4 animations:^{
        self.collectionViewTopConstraint.constant = self.view.frameHeight;
        [self.view layoutIfNeeded];
    }completion:^(BOOL finished) {
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
