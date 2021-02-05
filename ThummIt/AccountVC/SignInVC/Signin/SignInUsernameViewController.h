//
//  SignInVerificationViewController.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SignInUsernameViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UILabel *explanationLabel;
- (IBAction)backButtonTapped:(id)sender;
- (IBAction)nextButtonTapped:(id)sender;

@end

NS_ASSUME_NONNULL_END
