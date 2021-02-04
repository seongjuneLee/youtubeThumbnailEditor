//
//  NSString+Additions.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/20.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

+(NSString *)randomStringWithLength:(int)len{
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((uint32_t)[letters length])]];
    }
    
    return randomString;
}

+(BOOL)validateEmailWithstring:(NSString*)mailString
{
     NSString *validString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
     NSPredicate *emailTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",validString];
    return [emailTest evaluateWithObject:mailString];
}


@end
