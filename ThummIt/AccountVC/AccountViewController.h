//
//  AccountViewController.h
//  ThummIt
//
//  Created by 조재훈 on 2021/01/06.
//

#import <UIKit/UIKit.h>
#import "AccountTableController.h"
#import "ThummIt-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface AccountViewController : UIViewController

// account View
@property (strong, nonatomic) AccountTableController *accountTableController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *header;
@property (weak, nonatomic) IBOutlet UIImageView *accountIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *accountNameLabel;
@property (strong, nonatomic) SignInViewController *signInVC;

@end

NS_ASSUME_NONNULL_END
