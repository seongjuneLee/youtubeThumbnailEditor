//
//  NSArray+Additions.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import "NSArray+Additions.h"

@implementation NSArray (Additions)

-(NSArray *)mapWithBlock:(id  _Nonnull (^)(id _Nonnull, NSUInteger))block{
    
    if (self.count == 0){
        return @[];
    }
    
    NSMutableArray * newArray = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [newArray addObject:block(obj, idx)];
    }];
    
    return newArray;
}

- (id)reduceWithBlock:(id  (^)(id obj1, id obj2))block defaultValue:(id)defaultValue{

    if (self.count == 0){
        return defaultValue;
    }
    
    id ret = self.firstObject;
    @try{
        for (NSUInteger i=1; i<self.count; i++){
            ret = block(ret, self[i]);
        }
    }@catch(NSException * e){
        return defaultValue;
    }
    return ret;
}


@end
