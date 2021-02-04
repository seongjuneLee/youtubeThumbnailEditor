//
//  SnowflakeSticker2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "SnowflakeSticker2.h"

@implementation SnowflakeSticker2

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"snowflakeSticker2";
        self.backgroundImageName = @"snowflakeSticker2";
        self.tintColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    }
    return self;
}

+(SnowflakeSticker2*)snowflakeSticker2{
    
    SnowflakeSticker2* snowflakeSticker2 = [[self alloc] init];
    return snowflakeSticker2;
}

@end
