//
//  SignInVerificationViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "ForgotPasswordViewController.h"
#import "SignInNameViewController.h"
#import "NSString+Additions.h"
@import Parse;
@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sendButton.layer.cornerRadius = 5.0;
    self.emailTextField.layer.borderWidth = 0.6;
    self.emailTextField.delegate = self;
    self.emailTextField.layer.borderColor = [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0].CGColor;
    self.emailTextField.layer.cornerRadius = 5.0;
    UIColor *color = [UIColor lightGrayColor];

    self.emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.emailTextField.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    [self.emailTextField becomeFirstResponder];

    [self.emailTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

}
-(void)textFieldDidChange:(UITextField *)textField{
    
    BOOL validate = [NSString isValidMail:textField.text];
    if (validate) {
        self.sendButton.enabled = true;
        self.sendButton.alpha = 1.0;
    } else {
        self.sendButton.enabled = false;
        self.sendButton.alpha = 0.4;
    }
    
}



- (IBAction)backButtonTapped:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
    
}

- (IBAction)sendButtonTapped:(id)sender {
    
    [PFUser requestPasswordResetForEmail:self.emailTextField.text];
    
}


@end
