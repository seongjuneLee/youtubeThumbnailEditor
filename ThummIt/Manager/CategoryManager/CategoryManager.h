//
//  CategoryManager.h
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CategoryManager : NSObject

@property (strong,nonatomic) NSMutableArray *categories;

+(CategoryManager *)sharedInstance;


@end

NS_ASSUME_NONNULL_END
