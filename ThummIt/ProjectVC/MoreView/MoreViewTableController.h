//
//  MoreViewTableController.h
//  ThummIt
//
//  Created by 이성준 on 2020/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MoreViewTableController : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (strong ,nonatomic) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
