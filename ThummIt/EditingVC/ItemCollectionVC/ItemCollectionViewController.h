//
//  ItemCollectionViewController.h
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import <UIKit/UIKit.h>
#import "PhotoFrameCollectionController.h"
#import "Item.h"
NS_ASSUME_NONNULL_BEGIN

@interface ItemCollectionViewController : UIViewController <PhotoFrameCollectionControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *itemButton;
@property (weak, nonatomic) IBOutlet UIButton *albumButton;

@property (strong, nonatomic) UIVisualEffectView *blurView;
@property (strong, nonatomic) PhotoFrameCollectionController *collectionController;

@property (weak, nonatomic) UIViewController *editingVC;

-(void)dismissSelf;
- (IBAction)itemButtonTapped:(UIButton *)sender;
- (IBAction)albumButtonTapped:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
