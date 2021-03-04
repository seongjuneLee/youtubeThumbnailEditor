//
//  EditingPhotoViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "EditingPhotoButtonViewController.h"

@interface EditingPhotoButtonViewController ()

@end

@implementation EditingPhotoButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)dismissSelf{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.view.alpha = 0.0;
    }completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
    
}

- (IBAction)removeBGButtonTapped:(id)sender {
    
    
    
}

- (IBAction)eraseButtonTapped:(id)sender {
    
    
    
}

- (IBAction)rubToIncludeButtonTapped:(id)sender {
    
    
    
}

@end
