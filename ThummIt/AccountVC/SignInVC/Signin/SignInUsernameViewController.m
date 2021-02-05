//
//  SignInVerificationViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "SignInUsernameViewController.h"
#import "SignInNameViewController.h"

@interface SignInUsernameViewController ()

@end

@implementation SignInUsernameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nextButton.layer.cornerRadius = 5.0;
    self.verificationCodeTextField.layer.borderWidth = 0.6;
    self.verificationCodeTextField.delegate = self;
    self.verificationCodeTextField.layer.borderColor = [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0].CGColor;
    self.verificationCodeTextField.layer.cornerRadius = 5.0;
    UIColor *color = [UIColor lightGrayColor];

    self.verificationCodeTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.verificationCodeTextField.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    [self.verificationCodeTextField becomeFirstResponder];
    
    [self.verificationCodeTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

}
-(void)textFieldDidChange:(UITextField *)textField{
    
    NSLog(@"textFieldtextField %@",textField.text);
    BOOL validate = true;
    if (validate) {
        self.nextButton.enabled = true;
        self.nextButton.alpha = 1.0;

    } else {
        self.nextButton.enabled = false;
        self.nextButton.alpha = 0.4;
    }
    
}


- (IBAction)nextButtonTapped:(id)sender {
}

- (IBAction)backButtonTapped:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
    
}
@end
