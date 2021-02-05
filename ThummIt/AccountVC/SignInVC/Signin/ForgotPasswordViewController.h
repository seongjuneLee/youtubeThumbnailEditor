//
//  SignInVerificationViewController.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ForgotPasswordViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
- (IBAction)sendButtonTapped:(id)sender;
- (IBAction)backButtonTapped:(id)sender;

@end

NS_ASSUME_NONNULL_END
