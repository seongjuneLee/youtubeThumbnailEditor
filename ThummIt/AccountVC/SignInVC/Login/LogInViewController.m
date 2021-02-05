//
//  LogInViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/05.
//

#import "LogInViewController.h"
#import "NSString+Additions.h"
@import Parse;
@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.emailTextField addTarget:self action:@selector(emailTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.passwordTextField addTarget:self action:@selector(passwordTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    self.logInButton.layer.cornerRadius = 5.0;
    
    self.emailTextField.layer.borderWidth = 0.6;
    self.emailTextField.layer.borderColor = [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0].CGColor;
    self.emailTextField.layer.cornerRadius = 5.0;
    UIColor *color = [UIColor lightGrayColor];
    self.emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.emailTextField.placeholder attributes:@{NSForegroundColorAttributeName: color}];

    self.passwordTextField.layer.borderWidth = 0.6;
    self.passwordTextField.layer.borderColor = [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0].CGColor;
    self.passwordTextField.layer.cornerRadius = 5.0;
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.passwordTextField.placeholder attributes:@{NSForegroundColorAttributeName: color}];


}

-(void)viewDidAppear:(BOOL)animated{
    
    [self.emailTextField becomeFirstResponder];
    
}

-(void)emailTextFieldDidChange:(UITextField *)textField{
    
    if ([NSString isValidMail:textField.text] && [NSString isValidPassword:self.passwordTextField.text]) {
        [UIView animateWithDuration:0.2 animations:^{
            self.logInButton.alpha = 1.0;
            self.logInButton.enabled = true;
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.logInButton.alpha = 0.4;
            self.logInButton.enabled = false;
        }];
    }
    
}

-(void)passwordTextFieldDidChange:(UITextField *)textField{
    
    if ([NSString isValidPassword:textField.text] && [NSString isValidMail:self.emailTextField.text]) {
        [UIView animateWithDuration:0.2 animations:^{
            self.logInButton.alpha = 1.0;
            self.logInButton.enabled = true;
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.logInButton.alpha = 0.4;
            self.logInButton.enabled = false;
        }];
    }

}

- (IBAction)logInButtonTapped:(id)sender {
    
    [self.view makeToastActivity:CSToastPositionCenter];
    [PFUser logInWithUsernameInBackground:self.emailTextField.text password:self.passwordTextField.text block:^(PFUser * _Nullable user, NSError * _Nullable error) {
        [self.view hideAllToasts];
        if (user) {
            [self.navigationController dismissViewControllerAnimated:true completion:nil];
        } else {
            [self.view makeToast:NSLocalizedString(@"email does not exist or password is wrong.", nil) duration:3.0 position:CSToastPositionCenter];
        }
    }];
}

@end
