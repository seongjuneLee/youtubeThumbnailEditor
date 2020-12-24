//
//  HomeCollectionViewCell.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "HomeCollectionViewCell.h"

@implementation HomeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.previewImageView.layer.cornerRadius = 10;
    
}

@end
