//
//  SignInPasswordViewController.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SignInPasswordViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
- (IBAction)backButtonTapped:(id)sender;
- (IBAction)nextButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *reenterWarningLabel;

@property (weak, nonatomic) IBOutlet UILabel *passwordWarningLabel;
@end

NS_ASSUME_NONNULL_END
