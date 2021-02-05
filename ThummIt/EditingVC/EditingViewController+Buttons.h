//
//  EditingViewController+Buttons.h
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "EditingViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditingViewController (Buttons)

- (IBAction)leftItemTapped:(id)sender;
- (IBAction)rightItemTapped:(id)sender;
- (IBAction)photoFrameButtonTapped:(id)sender;
- (IBAction)textButtonTapped:(UIButton *)sender;
- (IBAction)stickerButtonTapped:(id)sender;
- (IBAction)bgColorButtonTapped:(id)sender;
- (IBAction)undoButtonTapped:(UIButton *)sender;
- (IBAction)redoButtonTapped:(UIButton *)sender;
- (IBAction)sliderValueChanged:(UISlider *)sender;

-(void)photoFrameButtonHoldDown;
-(void)photoFrameButtonHoldRelease;
-(void)textButtonHoldDown;
-(void)textButtonHoldRelease;
-(void)stickerButtonHoldDown;
-(void)stickerButtonHoldRelease;
-(void)bgColorButtonHoldDown;
-(void)bgColorButtonHoldRelease;
-(void)addItemCollectionVC;
-(void)taskWhenAuthorized;
-(void)taskWhenDenied;

-(void)hideAndInitSlider;
-(void)dismissItemCollectionVC;
@end

NS_ASSUME_NONNULL_END
