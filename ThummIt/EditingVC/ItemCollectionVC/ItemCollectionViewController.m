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
    
    UIStoryboard *editing = [UIStoryboard storyboardWithName:@"Editing" bundle:NSBundle.mainBundle];
    self.editingPhotoButtonVC = (EditingPhotoButtonViewController *)[editing instantiateViewControllerWithIdentifier:@"EditingPhotoButtonViewController"];

}

-(void)viewWillAppear:(BOOL)animated{
    
    [self connectCollectionController];
}

-(void)viewWillLayoutSubviews{
    
}
-(void)viewDidLayoutSubviews{
    
    float height = 150;
    self.editingPhotoButtonVC.view.frame = CGRectMake(0, self.view.frameHeight - height, self.view.frameWidth, height);
    
}

-(void)dismissSelf{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    float duration = 0.4;
    if ([editingVC.childViewControllers containsObject:editingVC.editingPhotoVC]) { // 정말 알 수 없는 dismiss 시에 애니메이션이 이상해지는 경우가 있음. 포토 에디팅 시에는 containerTopConstraint가 좀 더 아래에 있기 때문에 빠르게 내려줘야 해결됨.
        duration = 0.2;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:duration animations:^{
                self.cancelButton.alpha = self.doneButton.alpha = 0;
                self.containerTopConstraint.constant = -self.view.frameHeight;
                [self.view layoutIfNeeded];
        }completion:^(BOOL finished) {
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
        }];
    });

    
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
        self.textScrollContainerView.hidden = true;
        self.photoScrollContainerView.hidden = false;

    }else if (self.itemType == PhotoFrameType) {
        self.photoFrameCollectionController = [[PhotoFrameCollectionController alloc] initWithCollectionView:self.collectionView];
        self.photoFrameCollectionController.editingVC = self.editingVC;
        if (editingVC.currentPhotoFrame.isFixedPhotoFrame) {
            self.photoFrameScrollContanerView.hidden = true;
            self.textScrollContainerView.hidden = true;
            self.collectionView.hidden = true;
        } else {
            self.photoFrameScrollContanerView.hidden = false;
            self.textScrollContainerView.hidden = true;
            self.photoScrollContainerView.hidden = true;
        }
        
    } else if (self.itemType == TextType){
        self.textCollectionController = [[TextCollectionController alloc] initWithCollectionView:self.collectionView];
        self.textCollectionController.editingVC = self.editingVC;
        self.photoFrameScrollContanerView.hidden = true;
        self.textScrollContainerView.hidden = false;
        self.photoScrollContainerView.hidden = true;
        
    } else if (self.itemType == StickerType){
        self.stickerCollectionController = [[StickerCollectionController alloc] initWithCollectionView:self.collectionView];
        self.stickerCollectionController.editingVC = self.editingVC;
        self.photoFrameScrollContanerView.hidden = true;
        self.textScrollContainerView.hidden = true;
        self.photoScrollContainerView.hidden = true;
        
    } else if (self.itemType == MainFrameType){
        self.mainFrameCollectionController = [[MainFrameCollectionController alloc] initWithCollectionView:self.collectionView];
        self.mainFrameCollectionController.editingVC = self.editingVC;
        self.photoFrameScrollContanerView.hidden = true;
        self.textScrollContainerView.hidden = true;
        self.photoScrollContainerView.hidden = true;
    }
    
    
}




@end
