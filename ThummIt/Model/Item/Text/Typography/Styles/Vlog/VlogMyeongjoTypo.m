//
//  VlogMyungjoTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/29.
//

#import "VlogMyeongjoTypo.h"

@implementation VlogMyeongjoTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"Myeongjo",nil); //italic
        self.fontName = @"NanumMyeongjoOTFExtraBold";
        self.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        self.obliqueValue = 0.3;

        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.shadowOffset = CGPointMake(0, 0);
        attribute.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
        attribute.shadowRadius = 5;
        attribute.obliqueValue = 0.3;
        
        self.bgTextAttributes = @[attribute];
    }
    return self;
}

+(VlogMyeongjoTypo*)vlogMyeongjoTypo{
    
    VlogMyeongjoTypo* vlogMyeongjoTypo = [[self alloc] init];
    return vlogMyeongjoTypo;
    
}

@end
