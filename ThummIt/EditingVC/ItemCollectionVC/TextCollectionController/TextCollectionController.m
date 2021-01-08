//
//  TextCollectionController.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import "TextCollectionController.h"
#import "TextCollectionViewCell.h"

@implementation TextCollectionController

-(id)init{
    
    self = [super init];
    if (self) {
    }
    return self;
}

-(id)initWithCollectionView:(UICollectionView *)collectionView{
    
    self = [self init];
    if (self) {
        self.collectionView = collectionView;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        [self.collectionView registerNib:[UINib nibWithNibName:@"TextCollectionViewCell" bundle:NSBundle.mainBundle] forCellWithReuseIdentifier:@"TextCollectionViewCell"];
//        [self.collectionView registerNib:[UINib nibWithNibName:@"PhotoFrameCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PhotoFrameCollectionReusableView"];

    }
    
    return self;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TextCollectionViewCell *cell = (TextCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"TextCollectionViewCell" forIndexPath:indexPath];
    
    
    return cell;
    
}
@end
