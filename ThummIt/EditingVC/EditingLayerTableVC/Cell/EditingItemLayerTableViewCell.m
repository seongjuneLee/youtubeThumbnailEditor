//
//  EditingItemLayerTableViewCell.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/07.
//

#import "EditingItemLayerTableViewCell.h"

@implementation EditingItemLayerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.baseBarView.layer.borderWidth = 1;
    self.baseBarView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.baseBarView.layer.cornerRadius = 10;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
