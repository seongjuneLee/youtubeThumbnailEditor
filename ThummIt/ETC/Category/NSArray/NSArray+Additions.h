//
//  NSArray+Additions.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Additions)

-(NSArray *)mapWithBlock:(id  _Nonnull (^)(id _Nonnull, NSUInteger))block;
- (id)reduceWithBlock:(id  (^)(id obj1, id obj2))block defaultValue:(id)defaultValue;

@end

NS_ASSUME_NONNULL_END
