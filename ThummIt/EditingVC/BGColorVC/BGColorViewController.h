//
//  BGColorViewController.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BGColorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)cancelButtonTapped:(UIButton *)sender;
- (IBAction)doneButtonTapped:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
