//
//  ItemLayer.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/24.
//

#import "ItemLayer.h"
#import "UIImage+Additions.h"
#import <QuartzCore/QuartzCore.h>
#import "PhotoManager.h"

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
        float barBaseViewHeight = window.frameWidth * 4/5 * 0.1;
        
        return CGSizeMake(barBaseViewWitdth, barBaseViewHeight);
    /* do something specifically for iPhone or iPod touch. */
    }
}

-(void)makeView{ // 객체가 가진 item의 type에 따른 view 제작
    
    Item *item = [self.item copy];
    CGSize barBaseViewSize = [self settingBarBaseViewHeightAccoridingToDevice];
    
    //3경우 모두 공통적으로 barbaseview 생성
    self.barBaseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, barBaseViewSize.width, barBaseViewSize.height)];
    self.barBaseView.backgroundColor = [UIColor colorWithRed:20/255.0 green:20/255.0 blue:20/255.0 alpha:1.0];
    self.barBaseView.layer.borderWidth = 1;
    self.barBaseView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.barBaseView.layer.cornerRadius = 10;
    
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, barBaseViewSize.width*0.8, barBaseViewSize.height*0.8)]; //가져온 item 얹을 뷰
    [self.backgroundImageView setContentMode:UIViewContentModeScaleAspectFit];
    self.backgroundImageView.backgroundColor = UIColor.clearColor;
    self.backgroundImageView.image = [UIImage imageWithView:item.baseView];
    self.backgroundImageView.center = CGPointMake(barBaseViewSize.width/2, barBaseViewSize.height/2);
    [self.barBaseView addSubview:self.backgroundImageView];

    if([item isKindOfClass:PhotoFrame.class]){
        PhotoFrame *photoFrame =(PhotoFrame *)item;
        if (photoFrame.phAsset) {
            [PhotoManager.sharedInstance getImageFromPHAsset:photoFrame.phAsset withPHImageContentMode:PHImageContentModeAspectFit withSize:CGSizeMake(1920, 1080) WithCompletionBlock:^(UIImage * _Nonnull image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    float ratio = image.size.height/image.size.width;
                    float width = photoFrame.baseView.bounds.size.width;
                    float height = photoFrame.baseView.bounds.size.height;
                    if (ratio > 1) {
                        photoFrame.photoImageView.frameSize = CGSizeMake(width, width * ratio);
                    } else {
                        photoFrame.photoImageView.frameSize = CGSizeMake(height * 1/ratio, height);
                    }
                    photoFrame.photoImageView.center = photoFrame.photoCenter;
                    photoFrame.photoImageView.image = image;

                    self.backgroundImageView.image = [UIImage imageWithView:item.baseView];                    
                    self.backgroundImageView.center = CGPointMake(barBaseViewSize.width/2, barBaseViewSize.height/2);
                });
                
            }];
        }
    }
}

@end
