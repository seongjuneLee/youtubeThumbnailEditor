//
//  LogInViewController.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/05.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LogInViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;
- (IBAction)logInButtonTapped:(id)sender;
- (IBAction)backButtonTapped:(id)sender;


@end

NS_ASSUME_NONNULL_END
