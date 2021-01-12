//
//  BGColorViewController.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/12.
//

#import <UIKit/UIKit.h>
#import "BGColorCollectionController.h"
NS_ASSUME_NONNULL_BEGIN
@interface BGColorViewController : UIViewController

@property (strong, nonatomic) BGColorCollectionController *collectionController;
@property (strong, nonatomic) UIViewController *editingVC;
@property (strong, nonatomic) UIColor *selectedColor;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


- (IBAction)cancelButtonTapped:(UIButton *)sender;
- (IBAction)doneButtonTapped:(UIButton *)sender;
-(void)dismissSelf;

@end

NS_ASSUME_NONNULL_END
