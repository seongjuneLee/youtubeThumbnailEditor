//
//  EatRoom.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "EatRoomTypo.h"

@implementation EatRoomTypo


-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"2020 먹방 모음zip",nil);
        self.fontName = @"BMDoHyeon-OTF";
        self.fontSize = 50;
        self.textColor = [UIColor colorWithRed:253/255.0f green:199/255.0f blue:46/255.0 alpha:1 ];
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        BGTextAttribute *bgTextAttribute2 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor blackColor];
        bgTextAttribute1.borderWidth = 10;
        
        bgTextAttribute2.shadowColor = [UIColor colorWithRed:76/255.0f green:71/255.0f blue:70/255.0f alpha:1];
        bgTextAttribute2.shadowOffset = CGPointMake(5,5);
        
        self.bgTextAttributes = @[bgTextAttribute1,bgTextAttribute2];

    }
    return self;
}

+(EatRoomTypo*) eatRoomTypo{
    EatRoomTypo* eatRoomTypo = [[self alloc] init];
    return eatRoomTypo;
    
}

@end
