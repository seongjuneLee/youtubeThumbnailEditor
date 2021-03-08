//
//  EditingItemLayerTableViewCell.h
//  ThummIt
//
//  Created by 이성준 on 2021/03/07.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EditingItemLayerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *baseBarView;
@property (weak, nonatomic) IBOutlet UIImageView *itemLayerImageView;

@end

NS_ASSUME_NONNULL_END
