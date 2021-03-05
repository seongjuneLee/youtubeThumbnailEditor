//
//  EditingPhotoViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "EditingPhotoButtonViewController.h"
#import "UndoManager.h"
@interface EditingPhotoButtonViewController ()

@end

@implementation EditingPhotoButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(respondToUndoRedo) name:@"isEditingPhotoUndoRedoAvailable" object:nil];
}

-(void)respondToUndoRedo{
    
    self.undoButton.enabled = UndoManager.sharedInstance.isUndoRemainsForEditingPhoto;
    self.redoButton.enabled = UndoManager.sharedInstance.isRedoRemainsForEditingPhoto;
    
}

-(void)dismissSelf{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.view.alpha = 0.0;
    }completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
    
}

- (IBAction)removeBGButtonTapped:(UIButton *)sender {
    
    [self.delegate removeBGButtonTapped];
    
}

- (IBAction)eraseButtonTapped:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.eraseImageView.image = [self.eraseImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [self.eraseImageView setTintColor:UIColor.systemBlueColor];
        self.eraseLabel.textColor = UIColor.systemBlueColor;
    } else {
        self.eraseImageView.image = [self.eraseImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [self.eraseImageView setTintColor:UIColor.whiteColor];
        self.eraseLabel.textColor = UIColor.whiteColor;
    }
    
}

- (IBAction)rubToIncludeButtonTapped:(UIButton *)sender {
    
    [self.delegate includeButtonTapped:sender];
    
}

- (IBAction)redoButtonTapped:(UIButton *)sender {
    
    [self.delegate redoButtonTapped];
    
}

- (IBAction)undoButtonTapped:(id)sender {
    
    [self.delegate undoButtonTapped];
    
}



@end
