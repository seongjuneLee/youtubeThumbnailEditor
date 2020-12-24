//
//  HomeCollectionController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "HomeCollectionController.h"
#import "HomeCollectionViewCell.h"
#import "HomeTableViewCell.h"
#import "CategoryManager.h"
#import "TemplateManager.h"
#import "TemplateHeader.h"
@implementation HomeCollectionController

-(id)init{
    self = [super init];
    if(self){
    }
    return self;
    
}

#pragma mark - 콜렉션뷰 데이터 소스

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    self.currentTemplates = [NSMutableArray array];
    
    for (Template *template in TemplateManager.sharedInstance.templates) {
        if ([template.category isEqualToString:self.currentCategory]) {
            [self.currentTemplates addObject:template];
        }
    }

    return self.currentTemplates.count;
    
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCollectionViewCell *cell = (HomeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
    Template *template = self.currentTemplates[indexPath.item];
    cell.previewImageView.image = [UIImage imageNamed:template.previewImageName];
    
    return cell;
}

# pragma mark - 콜렉션뷰 델리게이트

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UIView *contentView = collectionView.superview;
    HomeTableViewCell *parentCell = (HomeTableViewCell *)contentView.superview;
    [parentCell.delegate didSelectItemWithCell:parentCell withCollectionViewIndex:indexPath.item];

    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float cellWidth = screenWidth/1.5;
    float cellHeight = cellWidth * 9/16;

    return CGSizeMake(cellWidth, cellHeight);
}


@end
