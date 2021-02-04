//
//  SnowflakeSticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "SnowflakeSticker1.h"

@implementation SnowflakeSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"snowflakeSticker1";
        self.backgroundImageName = @"snowflakeSticker1";
        self.tintColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    }
    return self;
}

+(SnowflakeSticker1*)snowflakeSticker1{
    
    SnowflakeSticker1* snowflakeSticker1 = [[self alloc] init];
    return snowflakeSticker1;
}

@end
