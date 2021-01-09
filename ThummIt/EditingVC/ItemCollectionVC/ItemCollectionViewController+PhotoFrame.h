//
//  ItemCollectionViewController+PhotoFrame.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/09.
//

#import "ItemCollectionViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemCollectionViewController (PhotoFrame) <PhotoFrameCollectionControllerDelegate>

- (IBAction)itemButtonTapped:(UIButton *)sender;
- (IBAction)albumButtonTapped:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
