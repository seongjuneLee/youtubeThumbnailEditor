//
//  EditingPhotoViewController.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/24.
//

#import <UIKit/UIKit.h>
#import "PhotoFrame.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditingPhotoViewController : UIViewController

@property (strong, nonatomic) PhotoFrame *photoFrame;
@property (weak, nonatomic) IBOutlet UIView *gestureView;

@end

NS_ASSUME_NONNULL_END
