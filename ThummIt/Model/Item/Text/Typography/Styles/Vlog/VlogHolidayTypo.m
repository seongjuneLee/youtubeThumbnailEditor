//
//  VlogHolidayTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "VlogHolidayTypo.h"

@implementation VlogHolidayTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"holiday",nil); //italic
        self.fontName = @"SDMiSaeng";
        self.textColor = [UIColor whiteColor];
        self.fontSize = 80;
        self.canChangeColor = true;
    }
    return self;
}

+(VlogHolidayTypo*) vlogHolidayTypo{
    
    VlogHolidayTypo* vlogHolidayTypo = [[self alloc] init];
    return vlogHolidayTypo;
    
}

@end
