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
        self.barBaseViewHeight = [self settingBarBaseViewHeightAccoridingToDevice].height;
    }
    return self;
    
}

-(CGSize)settingBarBaseViewHeightAccoridingToDevice{
    
    UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
    UIDevice *thisDevice = [UIDevice currentDevice];
    if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        float barBaseViewWitdth = window.frameWidth * 4/5;
        float barBaseViewHeight = window.frameWidth * 4/5 * 0.06;
        
        return CGSizeMake(barBaseViewWitdth, barBaseViewHeight);
    /* do something specifically for iPad. */
    } else {
        float barBaseViewWitdth = window.frameWidth * 4/5;
        float barBaseViewHeight = window.frameWidth * 4/5 * 0.08;
        
        return CGSizeMake(barBaseViewWitdth, barBaseViewHeight);
    /* do something specifically for iPhone or iPod touch. */
    }
}

-(void)makeView{ // 객체가 가진 item의 type에 따른 view 제작
    
    CGSize BarBaseViewSize = [self settingBarBaseViewHeightAccoridingToDevice];
    
    //3경우 모두 공통적으로 barbaseview 생성
    self.barBaseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BarBaseViewSize.width, BarBaseViewSize.height)];
    self.barBaseView.backgroundColor = [UIColor colorWithRed:20/255.0 green:20/255.0 blue:20/255.0 alpha:1.0];
    self.barBaseView.layer.borderWidth = 1;
    self.barBaseView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.barBaseView.layer.cornerRadius = 10;

    
    if ([self.item isKindOfClass:PhotoFrame.class]) {
        
        UIImageView *photoFrameView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, BarBaseViewSize.width*0.8, BarBaseViewSize.height*0.8)]; //가져온 item 얹을 뷰
        photoFrameView.image = [UIImage imageWithView:self.item.baseView];
        [photoFrameView setContentMode:UIViewContentModeScaleAspectFit];
        photoFrameView.backgroundColor = UIColor.clearColor;

        [self.barBaseView addSubview:photoFrameView];
        
        self.backgroundImageView = photoFrameView;
        self.backgroundImageView.center = CGPointMake(BarBaseViewSize.width/2, BarBaseViewSize.height/2);
    
    } else if([self.item isKindOfClass:Text.class]){
        
        UIImageView *textView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, BarBaseViewSize.width*0.8, BarBaseViewSize.height*0.8)];
        textView.image = [UIImage imageWithView:self.item.baseView];
        [textView setContentMode:UIViewContentModeScaleAspectFit];
        textView.backgroundColor = UIColor.clearColor;

        [self.barBaseView addSubview:textView];

        self.backgroundImageView = textView;
        self.backgroundImageView.center = CGPointMake(BarBaseViewSize.width/2, BarBaseViewSize.height/2);
        
    } else if([self.item isKindOfClass:Sticker.class]){
        
        UIImageView *stickerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, BarBaseViewSize.width*0.8, BarBaseViewSize.height*0.8)];

        stickerImageView.image = [UIImage imageWithView:self.item.baseView];
        [stickerImageView setContentMode:UIViewContentModeScaleAspectFit];
        stickerImageView.backgroundColor = UIColor.clearColor;

        [self.barBaseView addSubview:stickerImageView];

        self.backgroundImageView = stickerImageView;
        self.backgroundImageView.center = CGPointMake(BarBaseViewSize.width/2, BarBaseViewSize.height/2);
                
    }
    
}

@end
