//
//  EditingContentModeController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/19.
//

#import "EditingModeController.h"

@implementation EditingModeController

-(id)init{
    
    self = [super init];
    if(self){
        
    }
    return self;
    
}

-(void)setUpEditingMode:(EditingMode)editingMode{
    self.editingMode = editingMode;
    if (self.editingMode == NormalMode) {
        [self.leftItem setImage:[UIImage imageNamed:@"closeButton"] forState:UIControlStateNormal];
        [UIView transitionWithView:self.leftItem duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
            [self.leftItem setTitle:NSLocalizedString(@"Cancel", nil) forState:UIControlStateNormal];
        } completion:nil];
        self.leftItemWidthConstraint.constant = 25;
        [self.rightItem setTitle:NSLocalizedString(@"Export", nil) forState:UIControlStateNormal];
    } else if (self.editingMode == EditingItemMode){
        [self.leftItem setImage:nil forState:UIControlStateNormal];
        [UIView transitionWithView:self.leftItem duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [self.leftItem setTitle:NSLocalizedString(@"Cancel", nil) forState:UIControlStateNormal];
        } completion:nil];
        self.leftItemWidthConstraint.constant = 60;
        [self.rightItem setTitle:NSLocalizedString(@"Done", nil) forState:UIControlStateNormal];
    }
    
}


@end
