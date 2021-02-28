//
//  FreeFormCollectionReusableView.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FreeFormCollectionReusableViewDelegate <NSObject>

-(void)freeFormButtonTapped;

@end
@interface FreeFormCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) id<FreeFormCollectionReusableViewDelegate> delegate;

- (IBAction)freeFormButtonTapped:(id)sender;

@end

NS_ASSUME_NONNULL_END
