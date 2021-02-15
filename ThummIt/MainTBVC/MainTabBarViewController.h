//
//  MainTabBarViewController.h
//  ThummIt
//
//  Created by 이성준 on 2020/12/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTabBarViewController : UITabBarController <UITabBarControllerDelegate,UITabBarDelegate>

@property (strong, nonatomic) UITextView *textViewForFrame;
@end

NS_ASSUME_NONNULL_END
