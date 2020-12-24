//
//  ProjectTableController.h
//  ThummIt
//
//  Created by 이성준 on 2020/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProjectTableController : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) NSMutableArray *snapShots;
@property (strong, nonatomic) NSMutableArray *projects;

-(id)initWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
