//
//  ItemCollectionViewController+Text.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/09.
//

#import "ItemCollectionViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemCollectionViewController (Text) <TextCollectionControllerDelegate>

-(void)didSelectTypo:(Typography *)typo;

@end

NS_ASSUME_NONNULL_END
