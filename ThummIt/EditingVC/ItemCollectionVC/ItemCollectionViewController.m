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
-(void)viewWillLayoutSubviews{
    
}
-(void)viewDidLayoutSubviews{
    
    
}

-(void)dismissSelf{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    [UIView animateWithDuration:0.4 animations:^{
        editingVC.itemCollectionContainerTopConstraint.constant = editingVC.view.frameHeight;
        [editingVC.view layoutIfNeeded];
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
    if (self.itemType == PhotoType) {
        self.photoFrameScrollContanerView.hidden = true;
        self.textScrollContentView.hidden = true;
        self.photoScrollContentView.hidden = false;
        self.photoButton.selected= true;
        self.photoButton.alpha = 1.0;
        self.editPhotoButton.selected= false;
        self.editPhotoButton.alpha = 0.4;

    }else if (self.itemType == PhotoFrameType) {
        self.photoFrameCollectionController = [[PhotoFrameCollectionController alloc] initWithCollectionView:self.collectionView];
        self.photoFramePhotoButton.selected = true;
        self.photoFramePhotoButton.alpha = 1.0;
        self.photoFrameStyleButton.selected = false;
        self.photoFrameStyleButton.alpha = 0.4;
        self.photoFrameCollectionController.editingVC = self.editingVC;
        if (editingVC.currentPhotoFrame.isBasePhotoFrame) {
            self.photoFrameScrollContanerView.hidden = true;
            self.photoScrollContentView.hidden = true;
            self.textScrollContentView.hidden = true;
            self.collectionView.hidden = true;
        } else {
            self.photoFrameScrollContanerView.hidden = false;
            self.textScrollContentView.hidden = true;
            self.photoScrollContentView.hidden = true;
        }
        
    } else if (self.itemType == TextType){
        self.textCollectionController = [[TextCollectionController alloc] initWithCollectionView:self.collectionView];
        [self typoButtonTapped:self.textButton];
        self.textCollectionController.editingVC = self.editingVC;
        self.photoFrameScrollContanerView.hidden = true;
        self.textScrollContentView.hidden = false;
        self.photoScrollContentView.hidden = true;
        
    } else if (self.itemType == StickerType){
        self.stickerCollectionController = [[StickerCollectionController alloc] initWithCollectionView:self.collectionView];
        self.stickerCollectionController.editingVC = self.editingVC;
        self.photoFrameScrollContanerView.hidden = true;
        self.textScrollContentView.hidden = true;
        self.photoScrollContentView.hidden = true;
        
    } else if (self.itemType == MainFrameType){
        self.mainFrameCollectionController = [[MainFrameCollectionController alloc] initWithCollectionView:self.collectionView];
        self.mainFrameCollectionController.editingVC = self.editingVC;
        self.photoFrameScrollContanerView.hidden = true;
        self.textScrollContentView.hidden = true;
        self.photoScrollContentView.hidden = true;
    }
    
    [self.collectionView reloadData];
}




@end
