//
//  SignInNameViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "SignInNameViewController.h"

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
