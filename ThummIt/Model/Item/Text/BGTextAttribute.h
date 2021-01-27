//
//  BGTextAttribute.h
//  Vlogr
//
//  Created by iMac on 16/10/2019.
//  Copyright © 2019 TaejunLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BGTextAttribute : NSObject <NSCopying>

@property (nonatomic) CGPoint offset;
@property (nonatomic) float scale;

@property (nonatomic, strong) UIColor* textColor;
@property (strong, nonatomic) NSString* textColorPatternImageName;
@property (nonatomic, strong) UIColor* borderColor;
@property (nonatomic) float borderWidth;
@property (nonatomic) float borderRadius;

@property (nonatomic, strong) UIColor* shadowColor;
@property (nonatomic) CGPoint shadowOffset;
@property (nonatomic) float shadowRadius;

-(NSMutableAttributedString*)toAttributedStringWithText:(NSString*)text;

@end

NS_ASSUME_NONNULL_END
