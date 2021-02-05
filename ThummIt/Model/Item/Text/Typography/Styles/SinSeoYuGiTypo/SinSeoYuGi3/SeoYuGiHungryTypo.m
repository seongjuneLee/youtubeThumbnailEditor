//
//  SeoYuGiHungryTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "SeoYuGiHungryTypo.h"

@implementation SeoYuGiHungryTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"공복 주의",nil);
        self.fontName = @"BMDoHyeon-OTF";
        self.textColor = [UIColor colorWithRed:249/255.0f green:34/255.0f blue:42/255.0 alpha:1 ];
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 12;

        BGTextAttribute *shadowAtt1 = [[BGTextAttribute alloc] init];
        shadowAtt1.shadowColor = [UIColor colorWithRed:76/255.0f green:71/255.0f blue:70/255.0f alpha:1];
        shadowAtt1.shadowOffset = CGPointMake(1, 1);
        
        BGTextAttribute *shadowAtt2 = [[BGTextAttribute alloc] init];
        shadowAtt2.shadowColor = [UIColor colorWithRed:76/255.0f green:71/255.0f blue:70/255.0f alpha:1];
        shadowAtt2.shadowOffset = CGPointMake(1.5, 1.5);
        
        BGTextAttribute *shadowAtt3 = [[BGTextAttribute alloc] init];
        shadowAtt3.shadowColor = [UIColor colorWithRed:76/255.0f green:71/255.0f blue:70/255.0f alpha:1];
        shadowAtt3.shadowOffset = CGPointMake(2, 2);
        
        BGTextAttribute *shadowAtt4 = [[BGTextAttribute alloc] init];
        shadowAtt4.shadowColor = [UIColor colorWithRed:76/255.0f green:71/255.0f blue:70/255.0f alpha:1];
        shadowAtt4.shadowOffset = CGPointMake(2.5, 2.5);
        
        BGTextAttribute *shadowAtt5 = [[BGTextAttribute alloc] init];
        shadowAtt5.shadowColor = [UIColor colorWithRed:76/255.0f green:71/255.0f blue:70/255.0f alpha:1];
        shadowAtt5.shadowOffset = CGPointMake(3, 3);
        
        BGTextAttribute *shadowAtt6 = [[BGTextAttribute alloc] init];
        shadowAtt6.shadowColor = [UIColor colorWithRed:76/255.0f green:71/255.0f blue:70/255.0f alpha:1];
        shadowAtt6.shadowOffset = CGPointMake(3.5, 3.5);
        
        BGTextAttribute *shadowAtt7 = [[BGTextAttribute alloc] init];
        shadowAtt7.shadowColor = [UIColor colorWithRed:76/255.0f green:71/255.0f blue:70/255.0f alpha:1];
        shadowAtt7.shadowOffset = CGPointMake(4, 4);

        self.bgTextAttributes = @[borderAtt, shadowAtt1, shadowAtt2, shadowAtt3, shadowAtt4, shadowAtt5, shadowAtt6, shadowAtt7];

    }
    
    return self;
}

+(SeoYuGiHungryTypo*) seoYuGiHungryTypo{
    
    SeoYuGiHungryTypo* seoYuGiHungryTypo = [[self alloc] init];
    return seoYuGiHungryTypo;
    
}

@end
