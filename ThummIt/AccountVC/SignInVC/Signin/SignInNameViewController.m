//
//  SignInNameViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "SignInNameViewController.h"
#import "SignInPasswordViewController.h"
#import "UserManager.h"
@import Parse;
@interface SignInNameViewController ()

@end

@implementation SignInNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nextButton.layer.cornerRadius = 5.0;
    
    self.nameTextField.layer.borderWidth = 0.6;
    self.nameTextField.delegate = self;

    self.nameTextField.layer.borderColor = [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0].CGColor;
    self.nameTextField.layer.cornerRadius = 5.0;
    UIColor *color = [UIColor lightGrayColor];

    self.nameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.nameTextField.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    [self.nameTextField becomeFirstResponder];
    [self.nameTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

}

-(void)textFieldDidChange:(UITextField *)textField{
    
        
        BOOL validate = [self isValidUsername:textField.text];
                
        if (validate) {
            self.nextButton.enabled = true;
            self.nextButton.alpha = 1.0;
            [UIView animateWithDuration:0.2 animations:^{
                self.warningLabel.alpha = 0.0;
            }];

        } else {
            self.nextButton.enabled = false;
            self.nextButton.alpha = 0.4;
            self.warningLabel.text = NSLocalizedString(@"Invalid username : Contains illegal characters or too short.", nil);
            [UIView animateWithDuration:0.2 animations:^{
                self.warningLabel.alpha = 1.0;
            }];
        }
        
        if (textField.text.length == 0) {
            self.nextButton.enabled = false;
            self.nextButton.alpha = 0.4;
            [UIView animateWithDuration:0.2 animations:^{
                self.warningLabel.alpha = 0.0;
            }];
        }
    
}

- (BOOL)isValidUsername:(NSString *)username {
    
    NSCharacterSet * set = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    
    BOOL illegalCharacters = false;
    if ([username rangeOfCharacterFromSet:set].location != NSNotFound) {
        NSLog(@"This string contains illegal characters");
        illegalCharacters = true;
    }
    BOOL minimumLengthSatisfied = false;
    if (username.length >= 2) {
        minimumLengthSatisfied = true;
    }
    
    return minimumLengthSatisfied && !illegalCharacters;
    
}



- (IBAction)nextButtonTapped:(id)sender {
    
    UserManager.sharedInstance.nickname = self.nameTextField.text;
    
}

- (IBAction)backButtonTapped:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
    
}
@end
