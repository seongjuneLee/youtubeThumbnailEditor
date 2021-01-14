//
//  ItemCollectionViewController+Sticker.h
//  ThummIt
//
//  Created by 조재훈 on 2021/01/13.
//

#import "ItemCollectionViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemCollectionViewController (Sticker) <StickerCollectionControllerDelegate>

-(void)didSelectSticker:(Sticker *)sticker;

@end

NS_ASSUME_NONNULL_END
