//
//  EditingPhotoViewController.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EditingPhotoButtonViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *removeBGContainerView;
@property (weak, nonatomic) IBOutlet UIView *rubToIncludeContainerView;
@property (weak, nonatomic) IBOutlet UIView *eraseContainerView;
- (IBAction)removeBGButtonTapped:(id)sender;
- (IBAction)rubToIncludeButtonTapped:(id)sender;
- (IBAction)eraseButtonTapped:(id)sender;
-(void)dismissSelf;

@end

NS_ASSUME_NONNULL_END
