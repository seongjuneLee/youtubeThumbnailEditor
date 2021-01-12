//
//  BGColorCollectionViewCell.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/12.
//

#import "BGColorCollectionViewCell.h"

@implementation BGColorCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.cornerRadius = 10.0;
    self.clipsToBounds = true;
}

@end
