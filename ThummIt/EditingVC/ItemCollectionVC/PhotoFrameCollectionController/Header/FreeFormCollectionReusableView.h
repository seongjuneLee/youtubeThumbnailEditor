//
//  FreeFormCollectionReusableView.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FreeFormCollectionReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIView *freeformBGView;
- (IBAction)freeFormButtonTapped:(id)sender;

@end

NS_ASSUME_NONNULL_END
