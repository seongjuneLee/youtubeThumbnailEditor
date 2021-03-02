//
//  EditingPhotoViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/24.
//

#import "EditingPhotoViewController.h"
#import "UIView+Additions.h"
@interface EditingPhotoViewController ()

@end

@implementation EditingPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addGestureRecognizers];
}

-(void)viewWillAppear:(BOOL)animated{
    [UndoManager.sharedInstance initUndoRedoForEditingPhoto];
}

-(void)dismissSelf{
        
    [UIView animateWithDuration:0.2 animations:^{
        self.view.alpha = 0.0;
    }completion:^(BOOL finished) {
        self.photoLoaded = false;
        [self.photoImageView removeFromSuperview];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
    
}

-(void)viewDidLayoutSubviews{
    
    UIImage *photoImage = self.photoImageView.image;
    if (photoImage && !self.photoLoaded) {
        self.photoLoaded = true;
        float ratio = photoImage.size.height/photoImage.size.width;
        float photoImageViewWidth = self.contentView.frameWidth * 0.9;
        float photoImageViewHeight = self.contentView.frameHeight * 0.9;
        if (ratio < 1) {
            self.photoImageView.frameSize = CGSizeMake (photoImageViewWidth, photoImageViewWidth*ratio);
        } else {
            self.photoImageView.frameSize = CGSizeMake (photoImageViewHeight * 1/ratio, photoImageViewHeight);
        }
        self.photoImageView.center = self.contentView.center;
        [UndoManager.sharedInstance addCurrentPhotoToStack:photoImage];
        
    }
    
}

-(void)addGestureRecognizers{
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureViewPanned:)];
    pan.delegate = self;
    [self.gestureView addGestureRecognizer:pan];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(gestureViewPinched:)];
    pinch.delegate = self;
    [self.gestureView addGestureRecognizer:pinch];
    
}

-(void)gestureViewPanned:(UIGestureRecognizer *)sender {
    
    UIImageView *photoImageView = self.photoImageView;
    if (self.includeButton.selected || self.eraseButton.selected) {
        if (sender.state == UIGestureRecognizerStateBegan) {
            CGAffineTransform t = photoImageView.transform;
            float scale = sqrt(t.a * t.a + t.c * t.c);
            CGPoint convertedPoint = [self.gestureView convertPoint:[sender locationInView:self.gestureView] toView:self.photoImageView];
            float widthRatio = photoImageView.image.size.width/photoImageView.frameWidth;
            float heightRatio = photoImageView.image.size.height/photoImageView.frameHeight;
            self.lastPoint = CGPointMake(convertedPoint.x * widthRatio * scale, convertedPoint.y * heightRatio * scale);
            
        } else if (sender.state == UIGestureRecognizerStateChanged){
            
            CGPoint convertedPoint = [self.gestureView convertPoint:[sender locationInView:self.gestureView] toView:self.photoImageView];
            CGAffineTransform t = photoImageView.transform;
            float scale = sqrt(t.a * t.a + t.c * t.c);
            
            float widthRatio = photoImageView.image.size.width/photoImageView.frameWidth;
            float heightRatio = photoImageView.image.size.height/photoImageView.frameHeight;
            CGPoint currentPoint = CGPointMake(convertedPoint.x * widthRatio * scale, convertedPoint.y * heightRatio * scale);
            UIGraphicsBeginImageContext(photoImageView.image.size);
            [photoImageView.image drawInRect:CGRectMake(0, 0, photoImageView.image.size.width, photoImageView.image.size.height)];
            
            // I add this
            CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 20);
            CGContextBeginPath(UIGraphicsGetCurrentContext());
            CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeClear);
            CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
            
            CGContextStrokePath(UIGraphicsGetCurrentContext());
            photoImageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            self.lastPoint = currentPoint;
            
        } else if (sender.state == UIGestureRecognizerStateEnded){
            
            [UndoManager.sharedInstance addCurrentPhotoToStack:photoImageView.image];
            
        }
        
        
    } else {
        // 아이템 편집 상태
        if (sender.state == UIGestureRecognizerStateBegan) {
            
            self.originalPoint = [sender locationInView:self.gestureView];
            self.originalCenter = photoImageView.center;
            
        } else if (sender.state == UIGestureRecognizerStateChanged){
            
            CGPoint fingerPoint = [sender locationInView:self.gestureView];
            
            CGPoint newCenter  = CGPointMake(fingerPoint.x - (self.originalPoint.x - self.originalCenter.x), fingerPoint.y - (self.originalPoint.y - self.originalCenter.y));
            photoImageView.centerX = newCenter.x;
            photoImageView.centerY = newCenter.y;
            
            } else if (sender.state == UIGestureRecognizerStateEnded){
                
            }
    }
    
}

-(void)gestureViewPinched:(UIGestureRecognizer *)sender {
    UIImageView *photoImageView = self.photoImageView;

    if (sender.state == UIGestureRecognizerStateBegan && sender.numberOfTouches ==2) {

        self.isPinching = true;

        self.originalFirstFinger = [sender locationOfTouch:0 inView:self.gestureView];
        self.originalSecondFinger = [sender locationOfTouch:1 inView:self.gestureView];
        
        self.originalPinchCenter = CGPointMake((self.originalFirstFinger.x+self.originalSecondFinger.x)/2.0, (self.originalFirstFinger.y+self.originalSecondFinger.y)/2.0);
        self.originalItemViewCenter = photoImageView.center;
        
        CGPoint finger1Point = [sender locationOfTouch:0 inView:self.gestureView];
        CGPoint finger2Point = [sender locationOfTouch:1 inView:self.gestureView];
        
        CGAffineTransform t = photoImageView.transform;
        self.originalScaleRatio = sqrt(t.a * t.a + t.c * t.c);
        self.originalPinchDistance = [self distanceFrom:finger1Point to:finger2Point];
        
        CGPoint convertedPinchCenter = CGPointMake([self.gestureView convertPoint:self.originalPinchCenter toView:self.photoImageView].x*self.originalScaleRatio, [self.gestureView convertPoint:self.originalPinchCenter toView:self.photoImageView].y*self.originalScaleRatio) ;
        CGPoint anchorPoint = CGPointMake(convertedPinchCenter.x/self.photoImageView.frameWidth, convertedPinchCenter.y/self.photoImageView.frameHeight);
        [self.photoImageView setAnchorPoint:anchorPoint];
        
    } else if (sender.state == UIGestureRecognizerStateChanged && sender.numberOfTouches == 2){
        
        CGPoint finger1Point = [sender locationOfTouch:0 inView:self.gestureView];
        CGPoint finger2Point = [sender locationOfTouch:1 inView:self.gestureView];
        
        float changedDistance = [self distanceFrom:finger1Point to:finger2Point];
        if (fabs(self.lastPinchDistance - changedDistance) > 10) {
            CGAffineTransform t = photoImageView.transform;
            self.originalScaleRatio = sqrt(t.a * t.a + t.c * t.c);
            self.originalPinchDistance = [self distanceFrom:finger1Point to:finger2Point];
            changedDistance = [self distanceFrom:finger1Point to:finger2Point];
            
            self.originalFirstFinger = [sender locationOfTouch:0 inView:self.gestureView];
            self.originalSecondFinger = [sender locationOfTouch:1 inView:self.gestureView];
            
            self.originalPinchCenter = CGPointMake((self.originalFirstFinger.x+self.originalSecondFinger.x)/2.0, (self.originalFirstFinger.y+self.originalSecondFinger.y)/2.0);
            self.originalItemViewCenter = photoImageView.center;

        }
        float changeScale = changedDistance/self.originalPinchDistance;
        
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(self.originalScaleRatio*changeScale, self.originalScaleRatio*changeScale);
        photoImageView.transform = scaleTransform;
        self.lastPinchDistance = changedDistance;
        
        // 중심값 이동
        CGPoint newPinchCenter = [sender locationInView:self.gestureView];
        float translationX = newPinchCenter.x - self.originalPinchCenter.x;
        float translationY = newPinchCenter.y - self.originalPinchCenter.y;
        // 센터가이드 적용
        CGPoint changedPoint = CGPointMake(self.originalItemViewCenter.x + translationX, self.originalItemViewCenter.y + translationY);
        photoImageView.center = changedPoint;
        self.lastPoint = newPinchCenter;

    } else if (sender.state == UIGestureRecognizerStateChanged && sender.numberOfTouches == 1){
        
        // 중심값 이동
        CGPoint finger1Point = [sender locationInView:self.gestureView];
        NSLog(@"self.lastPoint %@",NSStringFromCGPoint(self.lastPoint));
        float translationX = finger1Point.x - self.originalPinchCenter.x - self.lastPoint.x;
        float translationY = finger1Point.y - self.originalPinchCenter.y - self.lastPoint.y;
        // 센터가이드 적용
        CGPoint changedPoint = CGPointMake(self.originalItemViewCenter.x + translationX, self.originalItemViewCenter.y + translationY);
        photoImageView.center = changedPoint;
        
    }

    
}

-(float)distanceFrom:(CGPoint)point1 to:(CGPoint)point2 {
    
    CGFloat xDist = (point2.x - point1.x);
    CGFloat yDist = (point2.y - point1.y);
    return sqrt((xDist * xDist) + (yDist * yDist));
}

@end
