//
//  TextViewContainer.m
//  Vlogr
//
//  Created by 진수글 on 31/03/2020.
//  Copyright © 2020 TaejunLee. All rights reserved.
//

#import "TextViewContainer.h"
#import "AdvancedTextView.h"
@implementation TextViewContainer

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews{
    [super layoutSubviews];
    
    UIView * textView = nil;
    UIView * bgView = nil;
    for (UIView * subView in self.subviews){
        if ([subView isKindOfClass:UIImageView.class]){
            bgView = subView;
        }else if ([subView isKindOfClass:AdvancedTextView.class]){
            textView = subView;
        }
    }
    
    if (bgView && textView){
        bgView.center = textView.center;
    }
}

@end
