//
//  BGColorCollectionController.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/12.
//

#import "BGColorCollectionController.h"
#import "BGColorCollectionViewCell.h"
#import "BGColorViewController.h"
#import "EditingViewController.h"
#import "ColorManager.h"

@implementation BGColorCollectionController

-(id)initWithCollectionView:(UICollectionView *)collectionView{
    
    self = [super init];
    if (self) {
        self.collectionView = collectionView;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.collectionView registerNib:[UINib nibWithNibName:@"BGColorCollectionViewCell" bundle:NSBundle.mainBundle] forCellWithReuseIdentifier:@"BGColorCollectionViewCell"];
    }
    
    return self;
}

#pragma mark - datasource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return ColorManager.sharedInstance.bgColors.count;
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BGColorCollectionViewCell *cell = (BGColorCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"BGColorCollectionViewCell" forIndexPath:indexPath];
    UIColor *currentColor = ColorManager.sharedInstance.bgColors[indexPath.item];
    cell.colorView.layer.cornerRadius = 5.0;
    if (currentColor == UIColor.blackColor) {
        cell.colorView.layer.borderWidth = 1;
        cell.colorView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    }
    cell.colorView.backgroundColor = currentColor;
    
    return cell;
}


#pragma mark - delegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.preselectedIndexPath) {
        BGColorCollectionViewCell *preselectedCell = (BGColorCollectionViewCell *)[collectionView cellForItemAtIndexPath:self.preselectedIndexPath];
        preselectedCell.layer.borderWidth = 0;
    }
    
    BGColorCollectionViewCell *cell = (BGColorCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.layer.borderWidth = 4;
    cell.layer.borderColor = [UIColor whiteColor].CGColor;

    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    UIColor *currentColor = ColorManager.sharedInstance.bgColors[indexPath.item];
    editingVC.bgView.backgroundColor = currentColor;
    self.preselectedIndexPath = indexPath;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    float width = self.collectionView.frameWidth/8 - 5;
    CGSize cellSize = CGSizeMake(width, width);
    
    return cellSize;
}

@end
