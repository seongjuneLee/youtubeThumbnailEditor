//
//  SignInEmailViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "SignInEmailViewController.h"
#import "NSString+Additions.h"
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
    [self.emailTextField becomeFirstResponder];
    
}


-(void)textFieldDidChange:(UITextField *)textField{
    
    if ([NSString validateEmailWithstring:textField.text]) {
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
