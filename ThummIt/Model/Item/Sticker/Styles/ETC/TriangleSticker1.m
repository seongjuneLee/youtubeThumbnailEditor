//
//  TriangleSticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "TriangleSticker1.h"

@implementation TriangleSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"triangleSticker1";
        self.backgroundImageName = @"triangleSticker1";
        self.tintColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    }
    return self;
}

+(TriangleSticker1*)triangleSticker1{
    
    TriangleSticker1* triangleSticker1 = [[self alloc] init];
    return triangleSticker1;
}

@end
