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

+(BOOL)isValidMail:(NSString*)mailString
{
     NSString *validString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
     NSPredicate *emailTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",validString];
    return [emailTest evaluateWithObject:mailString];
}

+(BOOL)isValidPassword:(NSString *)password{
    
    NSRegularExpression *regex = [[NSRegularExpression alloc]
      initWithPattern:@"[a-zA-Z]" options:0 error:NULL];

    // Assuming you have some NSString `myString`.
    NSUInteger matches = [regex numberOfMatchesInString:password options:0
      range:NSMakeRange(0, [password length])];
    BOOL containsEnglish = false;
    if (matches > 0) {
        containsEnglish = true;
      // `myString` contains at least one English letter.
    }

    if (password.length >= 6 && password.length <= 15 && containsEnglish && [NSCharacterSet characterSetWithCharactersInString:@"0123456789"]) {
        return true;
    }
    return false;

}


@end
