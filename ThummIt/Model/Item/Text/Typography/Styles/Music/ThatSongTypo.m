//
//  ThatSongTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/14.
//

#import "ThatSongTypo.h"

@implementation ThatSongTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"그 노래",nil);
        self.fontName = @"BlackHanSans-Black";
        self.textColor = [UIColor colorWithRed:0/255.0 green:220/255.0 blue:184/255.0 alpha:1];
        self.canChangeColor = true;
//        self.obliqueValue = 0.0;
        
        BGTextAttribute *border = [[BGTextAttribute alloc] init];
        border.borderWidth = 7.0;
        border.borderColor = [UIColor blackColor];
//        border.fontInterval = 9.0;
//        border.obliqueValue = 0.0;
        
        
        self.bgTextAttributes = @[border];

    }
    return self;
}

+(ThatSongTypo *)thatSongTypo{
    ThatSongTypo *thatSongTypo = [[self alloc] init];
    return thatSongTypo;
    
}

@end
