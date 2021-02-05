//
//  NSString+Additions.h
//  ThummIt
//
//  Created by 이성준 on 2020/12/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Additions)

+(NSString *)randomStringWithLength:(int) len;
+(BOOL)isValidMail:(NSString*)mailString;
+(BOOL)isValidPassword:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
