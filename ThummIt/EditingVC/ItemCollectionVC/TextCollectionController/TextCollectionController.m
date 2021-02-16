//
//  TextCollectionController.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import "TextCollectionController.h"
#import "TextCollectionViewCell.h"
#import "EditingViewController.h"
#import "EditingViewController+Text.h"
#import "EditingViewController+Buttons.h"
#import "TypoManager.h"
#import "ItemManager.h"
#import "Typography.h"
#import "Text.h"
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
    
    NSArray *typos = ItemManager.sharedInstance.typoDatas[section];
    
    return typos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TextCollectionViewCell *cell = (TextCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"TextCollectionViewCell" forIndexPath:indexPath];
    NSArray *typos = ItemManager.sharedInstance.typoDatas[indexPath.section];

    Typography *typo = typos[indexPath.item];
    
    cell.textImageView.image = [Text makePlaceHolderWithTypo:typo].image;
    
    return cell;
    
}

#pragma mark - 테이블 델리게이트

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *typos = ItemManager.sharedInstance.typoDatas[indexPath.section];
    Typography *typo = typos[indexPath.item];
    [self didSelectTypo:typo];
    
}

-(void)didSelectTypo:(Typography *)typo{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    Text *text = [[Text alloc] init];
    if (editingVC.currentText) {
        editingVC.currentText.typo = text.typo;
        editingVC.currentText.scale = text.scale;
        text = (Text *)editingVC.currentText;
        
        text.textView.backgroundAttributedTexts = [NSMutableArray array];
        if (editingVC.currentText.isTypedByUser) {
            text.text = editingVC.currentText.text;
            text.textView.text = editingVC.currentText.text;
            editingVC.itemCollectionVC.checkButton.enabled = true;
            editingVC.itemCollectionVC.checkButton.alpha = 1;
        } else {
            text.text = typo.name;
            text.textView.text = typo.name;
            editingVC.itemCollectionVC.checkButton.enabled = false;
            editingVC.itemCollectionVC.checkButton.alpha = 0.4;
        }
        text.isTypedByUser = editingVC.currentText.isTypedByUser;
        text.baseView.center = editingVC.currentText.baseView.center;
        text.baseView.transform = editingVC.currentText.baseView.transform;
    } else {
        editingVC.itemCollectionVC.checkButton.enabled = false;
        editingVC.itemCollectionVC.checkButton.alpha = 0.4;
        text.center = editingVC.bgView.center;

        text.textView.delegate = editingVC;

        text.text = typo.name;
        text.textView.text = typo.name;
        [text.textView setNeedsDisplay];

        text.textViewContainer.center = editingVC.bgView.center;
        [editingVC.layerController bringCurrentItemToFront:text];
    }
    
    [text applyTypo:typo];
    [text setItemCenterAndScale];

    NSLog(@"text baseview frame %@",NSStringFromCGRect(text.baseView.frame));
    
    editingVC.currentItem = text;
    editingVC.currentText = text;
    editingVC.recentTypo = typo;
    
    
    // 칼라 바
    if (!text.typo.cannotChangeColor) {
        [UIView animateWithDuration:0.2 animations:^{
            editingVC.hueSlider.alpha = 1.0;
            editingVC.thumbCircleView.alpha = 1.0;
        }];
    } else {
        [editingVC hideAndInitSlider];
    }
}

-(void)showPlaceHolderOfText:(Text *)text withTypo:(Typography *)typo{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    text.placeholderImageView = [Text makePlaceHolderWithTypo:typo];
    text.textViewContainer.frameSize = text.placeholderImageView.frameSize;
    text.textView.frameSize = text.textViewContainer.frameSize;
    [text.textViewContainer insertSubview:text.placeholderImageView belowSubview:text.textView];
    text.textViewContainer.center = editingVC.bgView.center;
    
}

@end
