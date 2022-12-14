//
//  ProjectTableController.h
//  ThummIt
//
//  Created by 이성준 on 2020/12/22.
//

#import <Foundation/Foundation.h>
#import "ProjectTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProjectTableController : NSObject <UITableViewDelegate, UITableViewDataSource, ProjectTableViewCellDelegate>

@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) UIViewController *projectVC;
@property (strong, nonatomic) NSMutableArray *projects;
@property (nonatomic) NSUInteger offset;

-(id)initWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
