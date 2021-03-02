//
//  ItemLayer.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/24.
//

#import "ItemLayer.h"
#import "UIImage+Additions.h"
#import <QuartzCore/QuartzCore.h>


@implementation ItemLayer

-(id)init{
    
    self = [super init];
    if(self){
        UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
        self.barBaseViewHeight = window.frameWidth * 4/5 * 0.06;
    }
    return self;
    
}

-(void)makeView{//make bar base view
    
    UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
    float barBaseViewWitdth = window.frameWidth * 4/5;
    float barBaseViewHeight = window.frameWidth * 4/5 * 0.06;

    self.barBaseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, barBaseViewWitdth, barBaseViewHeight)];
    //3경우 모두 공통적으로 barbaseview 생성

    if ([self.item isKindOfClass:PhotoFrame.class]) {
        
        UIImageView *photoFrameView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, barBaseViewWitdth, barBaseViewHeight)]; //가져온 item을 얹을 뷰
        photoFrameView.image = [UIImage imageWithView:self.item.baseView];
        [photoFrameView setContentMode:UIViewContentModeScaleAspectFit];
        photoFrameView.backgroundColor = UIColor.clearColor;

        [self.barBaseView addSubview:photoFrameView];
        self.barBaseView.backgroundColor = UIColor.blackColor;
        self.barBaseView.layer.borderColor = [UIColor redColor].CGColor;
        self.barBaseView.layer.borderWidth = 1.0f;

        
        self.backgroundImageView = photoFrameView;

    } else if([self.item isKindOfClass:Text.class]){
        
        UIImageView *textView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, barBaseViewWitdth, barBaseViewHeight)];
        textView.image = [UIImage imageWithView:self.item.baseView];
        [textView setContentMode:UIViewContentModeScaleAspectFit];
        textView.backgroundColor = UIColor.clearColor;

        [self.barBaseView addSubview:textView];
        self.barBaseView.backgroundColor = UIColor.blackColor;
        self.barBaseView.layer.borderColor = [UIColor greenColor].CGColor;
        self.barBaseView.layer.borderWidth = 1.0f;

        self.backgroundImageView = textView;
        
    } else if([self.item isKindOfClass:Sticker.class]){
        
        UIImageView *stickerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, barBaseViewWitdth, barBaseViewHeight)];

        stickerImageView.image = [UIImage imageWithView:self.item.baseView];
        [stickerImageView setContentMode:UIViewContentModeScaleAspectFit];
        stickerImageView.backgroundColor = UIColor.clearColor;

        [self.barBaseView addSubview:stickerImageView];
        self.barBaseView.backgroundColor = UIColor.blackColor;
        self.barBaseView.layer.borderColor = [UIColor blueColor].CGColor;
        self.barBaseView.layer.borderWidth = 1.0f;

        self.backgroundImageView = stickerImageView;
    }
    
} 


@end
