//
//  MainFrameCollectionController.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "MainFrameCollectionController.h"
#import "MainFrameCollectionViewCell.h"
#import "MainFrameCollectionReusableView.h"
#import "EditingViewController.h"
#import "EditingViewController+Buttons.h"
#import "ItemManager.h"

@implementation MainFrameCollectionController

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

-(id)initWithCollectionView:(UICollectionView *)collectionView{

    self = [self init];
    if (self) {
        self.collectionView = collectionView;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        [self.collectionView registerNib:[UINib nibWithNibName:@"MainFrameCollectionViewCell" bundle:NSBundle.mainBundle] forCellWithReuseIdentifier:@"MainFrameCollectionViewCell"];
        [self.collectionView registerNib:[UINib nibWithNibName:@"MainFrameCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MainFrameCollectionReusableView"];

    }
    
    return self;
    
}

#pragma mark - 데이터소스

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return ItemManager.sharedInstance.mainFrameCategories.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
        
    NSArray *mainFrames = ItemManager.sharedInstance.mainFrameDatas[section];
    
    return mainFrames.count;

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MainFrameCollectionViewCell *cell = (MainFrameCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MainFrameCollectionViewCell" forIndexPath:indexPath];
   
    NSArray *mainFrames = ItemManager.sharedInstance.mainFrameDatas[indexPath.section];
    MainFrame *mainFrame = mainFrames[indexPath.item];
    if (indexPath.item == 0) {
        cell.noneLabel.hidden = false;
    } else {
        cell.noneLabel.hidden = true;
        cell.mainFrameImageView.image = [UIImage imageNamed:mainFrame.backgroundImageName];
    }
    return cell;
    
}

#pragma mark - 델리게이트

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *mainFrames = ItemManager.sharedInstance.mainFrameDatas[indexPath.section];
    MainFrame *mainFrame = mainFrames[indexPath.item];
    [self didSelectMainFrame:mainFrame];
    
}

-(void)didSelectMainFrame:(MainFrame *)mainFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    UIImage *image = [UIImage imageNamed:mainFrame.backgroundImageName];
    
    editingVC.mainFrameImageView.image = image;
    mainFrame.baseView.center = editingVC.bgView.center;
    [editingVC hideAndInitSlider];
    
    SaveManager.sharedInstance.currentProject.mainFrameImageName = mainFrame.backgroundImageName;

}


@end
