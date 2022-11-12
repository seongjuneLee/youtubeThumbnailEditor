//
//  MainTabBarViewController.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/22.
//

#import "MainTabBarViewController.h"
#import "ProjectViewController.h"
#import "ThummIt-Swift.h"
#import "AppManager.h"

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
    
//    PFQuery *query = [PFQuery queryWithClassName:@"exported"];
//    
//    [query getFirstObjectInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
//        
//        NSLog(@"objectobjectobject %@",object);
//        PFFileObject *fileObject =  object[@"exportedThumbnail"];
//        [fileObject getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
//            
//            UIImage *image = [UIImage imageWithData:data];
//            NSLog(@"image %@",image);
//            
//        }];
//        
//        NSLog(@"object exportedThumbnail %@",object[@"exportedThumbnail"]);
//        NSLog(@"object object %@",object);
//    }];
    
}

-(void)userLoggedOut{
    
    [self.tabBarController setSelectedIndex:0];
    
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
