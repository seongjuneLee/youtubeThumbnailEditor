//
//  ItemCollectionViewController+Button.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/10.
//

#import "ItemCollectionViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemCollectionViewController (Button)

- (IBAction)cancelButtonTapped:(UIButton *)sender;
- (IBAction)checkButtonTapped:(UIButton *)sender;

- (IBAction)photoFrameStyleTapped:(id)sender;
- (IBAction)photoButtonTapped:(id)sender;
- (IBAction)textButtonTapped:(id)sender;
- (IBAction)typoButtonTapped:(id)sender;
- (IBAction)editPhotoButtonTapped:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
