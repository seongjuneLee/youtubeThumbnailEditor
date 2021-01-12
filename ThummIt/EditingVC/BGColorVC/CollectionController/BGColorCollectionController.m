//
//  BGColorCollectionController.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/12.
//

#import "BGColorCollectionController.h"
#import "BGColorCollectionViewCell.h"
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

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return ColorManager.sharedInstance.bgColors.count;
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BGColorCollectionViewCell *cell = (BGColorCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"BGColorCollectionViewCell" forIndexPath:indexPath];
    UIColor *currentColor = ColorManager.sharedInstance.bgColors[indexPath.item];
    cell.backgroundColor = currentColor;
    
    
    return cell;
}
@end
