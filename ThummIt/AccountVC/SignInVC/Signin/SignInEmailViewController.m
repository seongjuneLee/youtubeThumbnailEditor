//
//  SignInEmailViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "SignInEmailViewController.h"
#import "SignInUsernameViewController.h"
#import "SignInNameViewController.h"
#import "NSString+Additions.h"
#import "UserManager.h"
@import FirebaseAuth;
@import Parse;
@interface SignInEmailViewController ()

@end

@implementation SignInEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.emailTextField.delegate = self;
    self.nextButton.layer.cornerRadius = 5.0;
    self.emailTextField.layer.borderWidth = 0.6;
    self.emailTextField.layer.borderColor = [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0].CGColor;
    self.emailTextField.layer.cornerRadius = 5.0;
    UIColor *color = [UIColor lightGrayColor];

    self.emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.emailTextField.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    [self.emailTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [UserManager.sharedInstance startSignUpWithInApp];
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [self.emailTextField becomeFirstResponder];
    
}

-(void)textFieldDidChange:(UITextField *)textField{
    [PFCloud callFunctionInBackground:@"isValidEmail" withParameters:@{@"email":textField.text} block:^(NSNumber* _Nullable isValid, NSError * _Nullable error) {
        
        BOOL isValidEmail = [NSString isValidMail:textField.text] && isValid.boolValue;
        
        if (![NSString isValidMail:textField.text]) {
            self.warningLabel.text = NSLocalizedString(@"Invalid username : Invalid email format", nil);
            [UIView animateWithDuration:0.2 animations:^{
                self.warningLabel.alpha = 1.0;
            }];
        } else if (!isValid.boolValue){
            self.warningLabel.text = NSLocalizedString(@"Invalid username : aleady exist", nil);
            [UIView animateWithDuration:0.2 animations:^{
                self.warningLabel.alpha = 1.0;
            }];
        }

        if (isValidEmail) {
            self.nextButton.enabled = true;
            self.nextButton.alpha = 1.0;
            [UIView animateWithDuration:0.2 animations:^{
                self.warningLabel.alpha = 0.0;
            }];
        } else {
            self.nextButton.enabled = false;
            self.nextButton.alpha = 0.4;
            [UIView animateWithDuration:0.2 animations:^{
                self.warningLabel.alpha = 1.0;
            }];
        }

    }];
    
}

- (IBAction)nextButtonTapped:(id)sender {
    
    NSString *email = self.emailTextField.text;
    UserManager.sharedInstance.email = email;
    
}

- (IBAction)backButtonTapped:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
    
}

@end
