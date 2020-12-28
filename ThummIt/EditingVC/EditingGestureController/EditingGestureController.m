//
//  EditingGestureController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/17.
//

#import "EditingGestureController.h"
#import "PhotoFrame.h"
@implementation EditingGestureController

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
    
}

-(id)initWithView:(UIView *)view{
    
    self = [super init];
    if(self){
        self.gestureView = view;
        [self addGestureRecognizers];
    }
    return self;

}


-(void)addGestureRecognizers{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureViewTapped:)];
    [self.gestureView addGestureRecognizer:tap];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureViewPanned:)];
    [self.gestureView addGestureRecognizer:pan];

    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(gestureViewPinched:)];
    [self.gestureView addGestureRecognizer:pinch];
    pinch.delegate = self;

    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(gestureViewRotated:)];
    rotation.delegate = self;
    [self.gestureView addGestureRecognizer:rotation];
    
}

-(void)gestureViewTapped:(UITapGestureRecognizer *)sender{
    
    if ([self getCurrentItem:sender]) {
        if (self.editingModeController.editingMode == EditingPhotoFrameMode) {
            [self.delegate changeSelectedItem:[self getCurrentItem:sender]];
        } else {
            [self.delegate didSelectItem:[self getCurrentItem:sender]];
        }
    }
        
}

-(void)gestureViewPanned:(UIPanGestureRecognizer *)sender{
    
        
    if (self.editingModeController.editingMode == NormalMode) {
            
        [self gestureViewPannedForNormalMode:sender];
        
    } else if(self.editingModeController.editingMode == EditingPhotoFrameMode){
        
        [self gestureViewPannedForEditingPhotoFrameMode:sender];
        
    }
    
}

-(void)gestureViewPannedForNormalMode:(UIPanGestureRecognizer *)sender{
    // 일반 상태
    CGPoint currentPoint = [sender locationInView:self.gestureView];
    CGPoint deltaPoint = CGPointZero;

    if (sender.state == UIGestureRecognizerStateBegan) {
        
        if ([self getCurrentItem:sender]) {
            self.currentItem = [self getCurrentItem:sender];
            self.originalPoint = [sender locationInView:self.gestureView];
            [self.delegate readyUIForPanning];
        } else {
            return;
        }
        
    } else if (sender.state == UIGestureRecognizerStateChanged){
        
        deltaPoint = CGPointMake(currentPoint.x - self.originalPoint.x,currentPoint.y - self.originalPoint.y);
        
        if ([self.currentItem isKindOfClass:PhotoFrame.class]) {
            self.currentItem.baseView.centerX += deltaPoint.x;
            self.currentItem.baseView.centerY += deltaPoint.y;
            [self.delegate deleteImageRespondToCurrentPointY:currentPoint.y];
        }
        self.originalPoint = [sender locationInView:self.gestureView];
    } else if (sender.state == UIGestureRecognizerStateEnded){
        [self.delegate panGestureEndedForNoramlMode:self.currentItem withFingerPoint:currentPoint];
        self.currentItem = nil;
    }

}

-(void)gestureViewPannedForEditingPhotoFrameMode:(UIPanGestureRecognizer *)sender{
    
    CGPoint currentPoint = [sender locationInView:self.currentItem.baseView];
    CGPoint deltaPoint = CGPointZero;

    // 아이템 편집 상태
    if (sender.state == UIGestureRecognizerStateBegan) {
        if ([self getCurrentItem:sender]) {
            self.currentItem = [self getCurrentItem:sender];
            self.originalPoint = [sender locationInView:self.currentItem.baseView];
        } else {
            return;
        }
    } else if (sender.state == UIGestureRecognizerStateChanged){
        deltaPoint = CGPointMake(currentPoint.x - self.originalPoint.x, currentPoint.y - self.originalPoint.y);

        if ([self.currentItem isKindOfClass:PhotoFrame.class]) {
            self.currentItem.imageView.centerX += deltaPoint.x;
            self.currentItem.imageView.centerY += deltaPoint.y;
        }
        
        self.originalPoint = [sender locationInView:self.currentItem.baseView];
    } else if (sender.state == UIGestureRecognizerStateEnded){
        self.currentItem = nil;
    }

}

-(void)gestureViewPinched:(UIPinchGestureRecognizer *)sender{
    
    
    if (self.editingModeController.editingMode == NormalMode) {
        
        [self gestureViewPinchedInNormalMode:sender];
        
    } else if (self.editingModeController.editingMode == EditingPhotoFrameMode){
        
        [self gestureViewPinchedInEditingPhotoFrameMode:sender];
        
    }
    
}

-(void)gestureViewPinchedInNormalMode:(UIPinchGestureRecognizer *)sender{
    
    if (sender.state == UIGestureRecognizerStateBegan && sender.numberOfTouches ==2) {
        
        if ([self getCurrentItemForPinch:sender]) {
            self.currentItem = [self getCurrentItemForPinch:sender];
            self.originalFirstFinger = [sender locationOfTouch:0 inView:self.view];
            self.originalSecondFinger = [sender locationOfTouch:1 inView:self.view];
            
            self.originalPinchCenter = CGPointMake((self.originalFirstFinger.x+self.originalSecondFinger.x)/2.0, (self.originalFirstFinger.y+self.originalSecondFinger.y)/2.0);
            self.originalItemViewCenter = self.currentItem.baseView.center;
            
            CGPoint finger1Point = [sender locationOfTouch:0 inView:self.gestureView];
            CGPoint finger2Point = [sender locationOfTouch:1 inView:self.gestureView];
            
            CGAffineTransform t = self.currentItem.baseView.transform;
            self.originalScaleRatio = sqrt(t.a * t.a + t.c * t.c);
            self.originalPinchDistance = [self distanceFrom:finger1Point to:finger2Point];
        }
        
        
    } else if (sender.state == UIGestureRecognizerStateChanged && sender.numberOfTouches == 2){
        CGPoint finger1Point = [sender locationOfTouch:0 inView:self.gestureView];
        CGPoint finger2Point = [sender locationOfTouch:1 inView:self.gestureView];
        
        float changedDistance = [self distanceFrom:finger1Point to:finger2Point];
        float changeScale = changedDistance/self.originalPinchDistance;
        
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(self.originalScaleRatio*changeScale, self.originalScaleRatio*changeScale);
        
        // 각도 변경
        CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(self.currentRotation);
        
        // 최종 적용
        self.currentItem.baseView.transform = CGAffineTransformConcat(scaleTransform, rotationTransform);
        
        // 중심값 이동
        CGPoint newPinchCenter = [sender locationInView:self.view];
        float translationX = newPinchCenter.x - self.originalPinchCenter.x;
        float translationY = newPinchCenter.y - self.originalPinchCenter.y;
        
        // 센터가이드 적용
        CGPoint changedPoint = CGPointMake(self.originalItemViewCenter.x + translationX, self.originalItemViewCenter.y + translationY);
        self.currentItem.baseView.center = changedPoint;
    }
    
}

-(void)gestureViewPinchedInEditingPhotoFrameMode:(UIPinchGestureRecognizer *)sender{
    
    if (sender.state == UIGestureRecognizerStateBegan && sender.numberOfTouches ==2) {
        
        if ([self getCurrentItemForPinch:sender]) {
            self.currentItem = [self getCurrentItemForPinch:sender];
            self.originalFirstFinger = [sender locationOfTouch:0 inView:self.currentItem.baseView];
            self.originalSecondFinger = [sender locationOfTouch:1 inView:self.currentItem.baseView];
            
            self.originalPinchCenter = CGPointMake((self.originalFirstFinger.x+self.originalSecondFinger.x)/2.0, (self.originalFirstFinger.y+self.originalSecondFinger.y)/2.0);
            self.originalItemViewCenter = self.currentItem.imageView.center;
            
            CGPoint finger1Point = [sender locationOfTouch:0 inView:self.gestureView];
            CGPoint finger2Point = [sender locationOfTouch:1 inView:self.gestureView];
            
            CGAffineTransform t = self.currentItem.imageView.transform;
            self.originalScaleRatio = sqrt(t.a * t.a + t.c * t.c);
            self.originalPinchDistance = [self distanceFrom:finger1Point to:finger2Point];
        }
        
        
    } else if (sender.state == UIGestureRecognizerStateChanged && sender.numberOfTouches == 2){
        CGPoint finger1Point = [sender locationOfTouch:0 inView:self.gestureView];
        CGPoint finger2Point = [sender locationOfTouch:1 inView:self.gestureView];
        
        float changedDistance = [self distanceFrom:finger1Point to:finger2Point];
        float changeScale = changedDistance/self.originalPinchDistance;
        
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(self.originalScaleRatio*changeScale, self.originalScaleRatio*changeScale);
        
        // 각도 변경
        CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(self.currentRotation);
        
        // 최종 적용
        self.currentItem.imageView.transform = CGAffineTransformConcat(scaleTransform, rotationTransform);
        
        // 중심값 이동
        CGPoint newPinchCenter = [sender locationInView:self.currentItem.baseView];
        float translationX = newPinchCenter.x - self.originalPinchCenter.x;
        float translationY = newPinchCenter.y - self.originalPinchCenter.y;
        
        // 센터가이드 적용
        CGPoint changedPoint = CGPointMake(self.originalItemViewCenter.x + translationX, self.originalItemViewCenter.y + translationY);
        self.currentItem.imageView.center = changedPoint;
    }

}

#pragma mark - 로테이션

-(void)gestureViewRotated:(UIRotationGestureRecognizer*)sender{
    
    if (sender.state == UIGestureRecognizerStateChanged && sender.numberOfTouches == 2) {
        
        float newRotation = self.lastRotation + sender.rotation;
        self.currentRotation = newRotation;
    } else if(sender.state == UIGestureRecognizerStateEnded){
        
        self.lastRotation = self.currentRotation;
        self.currentItem.rotationDegree = self.lastRotation;
    }
}



#pragma mark - Helper

-(Item *)getCurrentItem:(UIGestureRecognizer*)sender{
    
    CGPoint tappedLocation = [sender locationInView:self.gestureView];
    
    for (Item *item in self.items) {
        
        if ([item isKindOfClass:PhotoFrame.class]) {
            PhotoFrame *photoFrame = (PhotoFrame *)item;
            if (CGRectContainsPoint(photoFrame.baseView.frame, tappedLocation)) {
                return item;
            }
        } else {
            if (CGRectContainsPoint(item.baseView.frame, tappedLocation)) {
                return item;
            }
        }
    }
    return nil;
}

-(Item *)getCurrentItemForPinch:(UIGestureRecognizer *)sender{

    CGPoint finger1Point = [sender locationOfTouch:0 inView:self.gestureView];
    CGPoint finger2Point = [sender locationOfTouch:1 inView:self.gestureView];

    CGPoint centerOfFinger = CGPointMake((finger2Point.x + finger1Point.x)/2, (finger1Point.y +finger2Point.y)/2);
    for (Item *item in self.items) {
        if ([item isKindOfClass:PhotoFrame.class]) {
            if (CGRectContainsPoint(item.baseView.frame, centerOfFinger)) {
                return item;
            }
        } else {
            if (CGRectContainsPoint(item.baseView.frame, centerOfFinger)) {
                return item;
            }
        }
    }
    return nil;
}

-(BOOL)isImageViewOutOfBounds:(PhotoFrame *)photoFrame{
    
    CGPoint baseViewCenter = photoFrame.baseView.center;
    CGPoint imageViewOrigin = photoFrame.imageView.bounds.origin;
    CGSize imageViewSize =photoFrame.imageView.frameSize;
    
    
    if (baseViewCenter.x < imageViewOrigin.x // 오른쪽
        || baseViewCenter.y < imageViewOrigin.y // 아래
        || imageViewOrigin.x + imageViewSize.width < baseViewCenter.x // 왼쪽
        || imageViewOrigin.y + imageViewSize.height < baseViewCenter.y) { // 위
        return true;
    }
    return false;
}

-(float)distanceFrom:(CGPoint)point1 to:(CGPoint)point2 {
    
    CGFloat xDist = (point2.x - point1.x);
    CGFloat yDist = (point2.y - point1.y);
    return sqrt((xDist * xDist) + (yDist * yDist));
}


#pragma mark - 제스쳐 델리게이트

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return true;
}

@end
