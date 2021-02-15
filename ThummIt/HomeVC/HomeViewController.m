//
//  ViewController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/12.
//

#import "HomeViewController.h"
#import "HomeViewController+TableControllerDelegate.h"
#import "Project.h"
#import "ProjectManager.h"
#import "SaveManager.h"
#import "GuideLine.h"
#import "DashedGuideLineView.h"
#import "NSString+Additions.h"
@import Parse;

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:NSBundle.mainBundle] forCellReuseIdentifier:@"HomeTableViewCell"];
    [self connectHomeTableController];
    for (NSString *familyName in UIFont.familyNames) {
        NSLog(@"familyName : %@",familyName);
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"fontName : %@",fontName);
        }
    }
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"THUMMIT"];
    [text addAttributes:@{NSObliquenessAttributeName:@0.3f}range:NSMakeRange(0, 7)];
    [self.testTextView setAttributedText:text];

}

-(void)connectHomeTableController{
    
    self.homeTableController = [[HomeTableController alloc] initWithTableView:self.tableView];
    self.homeTableController.delegate = self;
    
}





@end
