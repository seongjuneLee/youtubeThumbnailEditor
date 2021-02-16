//
//  MainTabBarViewController.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/22.
//

#import "MainTabBarViewController.h"
#import "ProjectViewController.h"
#import "AccountViewController.h"
#import "ThummIt-Swift.h"
#import "AppManager.h"
@import Parse;

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.tabBar.tintColor = UIColor.blackColor;
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f], NSFontAttributeName,  [UIColor yellowColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(userLoggedOut) name:@"userLoggedOut" object:nil];
    

    UITextField *textField = [[UITextField alloc] init];
    [[[[UIApplication sharedApplication] windows] lastObject] addSubview:textField];
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(getKeyboardFrame:) name:UIKeyboardDidShowNotification object:nil];
    [textField becomeFirstResponder];
    [textField resignFirstResponder];
    [textField removeFromSuperview];
    
    
}

-(void)userLoggedOut{
    
    [self.tabBarController setSelectedIndex:0];
    
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{

    if (self.selectedIndex == 0) {
        if (!PFUser.currentUser) {
            UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:NSBundle.mainBundle];
            SignInViewController *signInVC = (SignInViewController *)[main instantiateViewControllerWithIdentifier:@"SignInViewController"];
            
            UINavigationController *signInNavVC = (UINavigationController *)[main instantiateViewControllerWithIdentifier:@"signInNavVC"];

            if ([viewController isKindOfClass:ProjectViewController.class]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    signInVC.titleLabel.text = NSLocalizedString(@"Sign up for continuing past projects.", nil);
                });
            }
            [self presentViewController:signInNavVC animated:true completion:nil];
            return false;
        }

    }

    return true;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

}


- (void)getKeyboardFrame:(NSNotification*)notification
{
    NSDictionary* keyboardInfo = [notification userInfo];
    NSValue* keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
    AppManager.sharedInstance.keyboardSize = [keyboardFrameBegin CGRectValue].size;
    [NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardDidShowNotification object:nil];
}

@end
