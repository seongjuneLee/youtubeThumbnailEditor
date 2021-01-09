//
//  ItemCollectionViewController.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import "ItemCollectionViewController.h"
#import "EditingViewController.h"
#import "PhotoManager.h"
#import "ItemManager.h"
@interface ItemCollectionViewController ()

@end

@implementation ItemCollectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self makeViewBlurred];
    [self setCollectionViewFlowLayout];

}

-(void)viewWillAppear:(BOOL)animated{
    
    [self connectCollectionController];
}

-(void)viewWillLayoutSubviews{
    
    
}

-(void)dismissSelf{
    
    float screenHeight = UIScreen.mainScreen.bounds.size.height;
    [UIView animateWithDuration:0.2 animations:^{
        self.itemButton.alpha = self.albumButton.alpha = 0;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.collectionView.frameY = screenHeight;
            self.blurView.frameY = screenHeight;
        }completion:^(BOOL finished) {
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
        }];
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

-(void)makeViewBlurred{
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleProminent];
    self.blurView = [[UIVisualEffectView alloc] init];
    self.blurView.frameSize = self.view.frameSize;
    self.blurView.effect = blurEffect;
    [self.view insertSubview:self.blurView atIndex:0];
    
}

-(void)connectCollectionController{
    
    if (self.itemType == PhotoFrameType) {
        self.photoFrameCollectionController = [[PhotoFrameCollectionController alloc] initWithCollectionView:self.collectionView];
        self.photoFrameCollectionController.delegate = self;
        [PhotoManager.sharedInstance getFirstPhotoFromAlbumWithContentMode:PHImageContentModeAspectFill withSize:CGSizeMake(500, 500) WithCompletionBlock:^(UIImage * _Nonnull image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.photoFrameCollectionController.firstPhoto = image;
            });
        }];
    } else if (self.itemType == TextType){
        self.textCollectionController = [[TextCollectionController alloc] initWithCollectionView:self.collectionView];
        
//        self.textCollectionController.delegate = self;
    }

}

#pragma mark - cell 델리게이트

-(void)didSelectPhotoFrame:(PhotoFrame *)photoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    photoFrame.baseView.center = editingVC.imageView.center;
    
    if (editingVC.currentItem) {
        // 위치, 크기,사진 유지
        photoFrame.baseView.frame = editingVC.currentItem.baseView.frame;
        photoFrame.photoImageView.frame = editingVC.currentItem.photoImageView.frame;
        photoFrame.photoImageView.image = editingVC.currentItem.photoImageView.image;
        [editingVC.currentItem.baseView removeFromSuperview];// 기존 것 떼어주고
    }
    
    [editingVC.editingLayerController bringCurrentItemToFront:photoFrame];
    
    editingVC.currentItem = photoFrame;
    editingVC.editingGestureController.currentItem = photoFrame;

}

#pragma mark - 버튼

- (IBAction)itemButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        self.albumButton.selected = false;
        sender.alpha = 0.8;
        self.albumButton.alpha = 0.4;
        editingVC.albumVC.view.hidden = true;
        editingVC.editingModeController.editingMode = AddingPhotoFrameMode;
    }

}

- (IBAction)albumButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        self.itemButton.selected = false;
        sender.alpha = 0.8;
        self.itemButton.alpha = 0.4;
        editingVC.albumVC.view.frameHeight = self.view.frameHeight - (self.itemButton.frameY + self.itemButton.frameHeight + 10);
        editingVC.albumVC.view.frameY = editingVC.view.frameHeight - editingVC.albumVC.view.frameHeight;
        editingVC.albumVC.view.hidden = false;
        editingVC.editingModeController.editingMode = EditingPhotoFrameModeWhileAddingPhotoFrameMode;

    }
    
}



@end
