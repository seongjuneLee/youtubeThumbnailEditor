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
        float barBaseViewHeight = window.frameWidth * 4/5 * 0.1;
        
        return CGSizeMake(barBaseViewWitdth, barBaseViewHeight);
    /* do something specifically for iPhone or iPod touch. */
    }
}

-(void)makeView{ // 객체가 가진 item의 type에 따른 view 제작
    
    CGSize barBaseViewSize = [self settingBarBaseViewHeightAccoridingToDevice];
    
    //3경우 모두 공통적으로 barbaseview 생성
    self.barBaseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, barBaseViewSize.width, barBaseViewSize.height)];
    self.barBaseView.backgroundColor = [UIColor colorWithRed:20/255.0 green:20/255.0 blue:20/255.0 alpha:1.0];
    self.barBaseView.layer.borderWidth = 1;
    self.barBaseView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.barBaseView.layer.cornerRadius = 10;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, barBaseViewSize.width*0.8, barBaseViewSize.height*0.8)]; //가져온 item 얹을 뷰
    imageView.image = [UIImage imageWithView:self.item.baseView];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    imageView.backgroundColor = UIColor.clearColor;

    [self.barBaseView addSubview:imageView];
    
    self.backgroundImageView = imageView;
    self.backgroundImageView.center = CGPointMake(barBaseViewSize.width/2, barBaseViewSize.height/2);

}

//func getImage(image: UIImage, backgroundColor: UIColor)->UIImage?{
//
//    UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
//    backgroundColor.setFill()
//    //UIRectFill(CGRect(origin: .zero, size: image.size))
//    let rect = CGRect(origin: .zero, size: image.size)
//    let path = UIBezierPath(arcCenter: CGPoint(x:rect.midX, y:rect.midY), radius: rect.midX, startAngle: 0, endAngle: 6.28319, clockwise: true)
//    path.fill()
//    image.draw(at: .zero)
//    let newImage = UIGraphicsGetImageFromCurrentImageContext()
//    UIGraphicsEndImageContext()
//    return newImage
//}


@end
