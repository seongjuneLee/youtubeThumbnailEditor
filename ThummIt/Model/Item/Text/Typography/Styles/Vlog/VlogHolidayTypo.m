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
        self.fontSize = TEXT_FONT_SIZE;
        self.textColor = [UIColor whiteColor];
        
    }
    return self;
}

+(VlogHolidayTypo*) vlogHolidayTypo{
    
    VlogHolidayTypo* vlogHolidayTypo = [[self alloc] init];
    return vlogHolidayTypo;
    
}

@end
