//
//  Sticker.h
//  ThummIt
//
//  Created by 조재훈 on 2021/01/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface Sticker : Item

@property (nonatomic) BOOL colorChangeBlock;

-(void)addSubViewsToBaseView;

@end

NS_ASSUME_NONNULL_END
