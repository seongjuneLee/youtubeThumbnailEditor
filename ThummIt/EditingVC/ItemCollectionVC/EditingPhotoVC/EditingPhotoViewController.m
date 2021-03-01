//
//  EditingPhotoViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/24.
//

#import "EditingPhotoViewController.h"

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
            self.photoImageView.frameSize = CGSizeMake (photoImageViewHeight * 1/ratio, photoImageViewHeight*ratio);
        }
        self.photoImageView.center = self.contentView.center;
        [UndoManager.sharedInstance addCurrentPhotoToStack:photoImage];

    }

}

-(void)addGestureRecognizers{
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureViewPanned:)];
    [self.gestureView addGestureRecognizer:pan];

    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(gestureViewPinched:)];
    [self.gestureView addGestureRecognizer:pinch];
    
}

-(void)gestureViewPanned:(UIGestureRecognizer *)sender {
    
    UIImageView *photoImageView = self.photoImageView;
    
    // 아이템 편집 상태
    if (sender.state == UIGestureRecognizerStateBegan) {

        self.originalPoint = [sender locationInView:self.gestureView];
        self.originalCenter = photoImageView.center;
        
    } else if (sender.state == UIGestureRecognizerStateChanged){
        
        CGPoint fingerPoint = [sender locationInView:self.gestureView];
        
        CGPoint newCenter  = CGPointMake(fingerPoint.x - (self.originalPoint.x - self.originalCenter.x), fingerPoint.y - (self.originalPoint.y - self.originalCenter.y));
        if (!self.isPinching) {
            photoImageView.centerX = newCenter.x;
            photoImageView.centerY = newCenter.y;
        }
        
        
    } else if (sender.state == UIGestureRecognizerStateEnded){
        
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
        
        
    } else if (sender.state == UIGestureRecognizerStateChanged && sender.numberOfTouches == 2){
        
        CGPoint finger1Point = [sender locationOfTouch:0 inView:self.gestureView];
        CGPoint finger2Point = [sender locationOfTouch:1 inView:self.gestureView];
        
        float changedDistance = [self distanceFrom:finger1Point to:finger2Point];
        float changeScale = changedDistance/self.originalPinchDistance;
        
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(self.originalScaleRatio*changeScale, self.originalScaleRatio*changeScale);
        photoImageView.transform = scaleTransform;

                
        // 중심값 이동
        CGPoint newPinchCenter = [sender locationInView:self.gestureView];
        float translationX = newPinchCenter.x - self.originalPinchCenter.x;
        float translationY = newPinchCenter.y - self.originalPinchCenter.y;
        // 센터가이드 적용
        CGPoint changedPoint = CGPointMake(self.originalItemViewCenter.x + translationX, self.originalItemViewCenter.y + translationY);
        photoImageView.center = changedPoint;


    } else if (sender.state == UIGestureRecognizerStateEnded) {
        self.isPinching = false;
    }

    
}

-(float)distanceFrom:(CGPoint)point1 to:(CGPoint)point2 {
    
    CGFloat xDist = (point2.x - point1.x);
    CGFloat yDist = (point2.y - point1.y);
    return sqrt((xDist * xDist) + (yDist * yDist));
}

@end
