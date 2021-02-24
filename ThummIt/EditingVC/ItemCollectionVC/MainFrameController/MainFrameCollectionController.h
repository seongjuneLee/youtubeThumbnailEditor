//
//  MainFrameCollectionController.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import <Foundation/Foundation.h>
#import "MainFrame.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainFrameCollectionController : NSObject <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) UICollectionView *collectionView;
@property (weak, nonatomic) UIViewController *editingVC;

-(id)initWithCollectionView:(UICollectionView *)collectionView;
-(void)didSelectMainFrame:(MainFrame *)mainFrame;

@end

NS_ASSUME_NONNULL_END
