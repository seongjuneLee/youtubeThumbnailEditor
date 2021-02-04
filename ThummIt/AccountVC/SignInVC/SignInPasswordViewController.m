//
//  SignInPasswordViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "SignInPasswordViewController.h"

@interface SignInPasswordViewController ()

@end

@implementation SignInPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nextButton.layer.cornerRadius = 5.0;
    
    self.passwordTextField.layer.cornerRadius = 5.0;
    self.passwordTextField.layer.borderColor = [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0].CGColor;
    self.passwordTextField.delegate = self;

    self.passwordTextField.layer.borderWidth = 0.6;
    self.reEnterTextField.layer.borderWidth = 0.6;
    self.reEnterTextField.layer.cornerRadius = 5.0;
    self.reEnterTextField.layer.borderColor = [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0].CGColor;
    UIColor *color = [UIColor lightGrayColor];
    self.reEnterTextField.delegate = self;

    self.reEnterTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.reEnterTextField.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.passwordTextField.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    [self.passwordTextField becomeFirstResponder];

    [self.passwordTextField addTarget:self action:@selector(passwordTextFieldidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.reEnterTextField addTarget:self action:@selector(reEnterTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

}

-(void)passwordTextFieldidChange:(UITextField *)textField{
    
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

-(void)reEnterTextFieldDidChange:(UITextField *)textField{
    
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
