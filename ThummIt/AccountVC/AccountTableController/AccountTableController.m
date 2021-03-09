//
//  AccountTableController.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/06.
//

#import "AccountTableController.h"
#import "AccountTableViewCell.h"
#import "AccountViewController.h"
#import "CustomerFeedbackViewController.h"
#import "PrivacyPolicyViewController.h"
#import "MainTabBarViewController.h"
@import Parse;

@implementation AccountTableController

-(id)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        NSDictionary *customerCenterDict = @{NSLocalizedString(@"Customer Center", nil):@"customerCenter"}; // 이미지 추가
        NSDictionary *pivacyPolicyDict = @{NSLocalizedString(@"Privacy Policy", nil):@"privacyPolicy"}; // 이미지 추가
        NSDictionary *logOutDict = @{NSLocalizedString(@"Log Out", nil):@"logOut"}; // 이미지 추가
        self.datas = @[customerCenterDict, pivacyPolicyDict];
        self.tableView = tableView;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerNib:[UINib nibWithNibName:@"AccountTableViewCell" bundle:NSBundle.mainBundle] forCellReuseIdentifier:@"AccountTableViewCell"];
        
    }
    return self;
}

-(void)setAccountVCHeader{
    AccountViewController *accountVC = (AccountViewController *)self.accountVC;
    accountVC.accountNameLabel.text = @"userName";
    accountVC.accountIconImageView.backgroundColor = UIColor.grayColor;
    NSInteger radius = accountVC.accountIconImageView.bounds.size.height/2;
    accountVC.accountIconImageView.layer.cornerRadius = radius;
    accountVC.accountIconImageView.image = [UIImage imageNamed:@"accountImage"];
    
}

#pragma mark - 테이블 뷰 데이터 소스

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AccountTableViewCell *cell = (AccountTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"AccountTableViewCell" forIndexPath:indexPath];
    NSDictionary *dict = self.datas[indexPath.row];
    NSString *key = dict.allKeys[0];
    NSString *value = [dict objectForKey:key];
    cell.titleLabel.text = key;
    cell.iconImageView.image = [UIImage imageNamed:value];
    
    return cell;
}

#pragma mark - 테이블 뷰 델리게이트

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
        
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:NSBundle.mainBundle];
        CustomerFeedbackViewController *CustomerFeedbackVC = (CustomerFeedbackViewController *)[main instantiateViewControllerWithIdentifier:@"CustomerFeedbackViewController"];
        [self.accountVC.navigationController pushViewController:CustomerFeedbackVC animated:true];

    }else if (indexPath.row == 1){
        UIViewController *webVC = [[UIViewController alloc] init];
        NSString * language = [[NSLocale preferredLanguages] firstObject];
        NSURLRequest *request;
        if ([language isEqualToString:@"en"]) {
            request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://thummiteng.o-r.kr/"]];
        } else{
            request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://thummitkr.o-r.kr/"]];
        }
        self.wkWebView = [[WKWebView alloc] initWithFrame:self.accountVC.view.frame];
        [self.wkWebView loadRequest:request];
        [webVC.view addSubview:self.wkWebView];
        [self.accountVC presentViewController:webVC animated:true completion:nil];

    }else if (indexPath.row == 2){
        
        [self showLogOutAction];
        
    }else if (indexPath.row == 3){
        
    }else if (indexPath.row == 4){
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIDevice* thisDevice = [UIDevice currentDevice];
    if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        return self.accountVC.tabBarController.tabBar.frameHeight * 1.0;
    /* do something specifically for iPad. */
    } else {
        return self.accountVC.tabBarController.tabBar.frameHeight * 0.6;
    /* do something specifically for iPhone or iPod touch. */
}
}

-(void)showLogOutAction{

    AccountViewController *accountVC = (AccountViewController *)self.accountVC;
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Logout", nil) message:NSLocalizedString(@"Do you want to logout?", nil) preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *logOut = [UIAlertAction actionWithTitle:NSLocalizedString(@"Logout", nil) style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [PFUser logOut];
        [accountVC.tabBarController setSelectedIndex:0];
        
    }];

    [controller addAction:cancel];
    [controller addAction:logOut];
    
    [accountVC presentViewController:controller animated:true completion:nil];
    
}


- (void)didReceiveMemoryWarning {
   // Dispose of any resources that can be recreated.
}



@end
