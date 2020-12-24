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

    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(gestureViewRotated:)];
    [self.gestureView addGestureRecognizer:rotation];
    
}

-(void)gestureViewTapped:(UITapGestureRecognizer *)sender{
    
    if ([self getCurrentItem:sender]) {
        if (self.editingModeController.editingMode == EditingItemMode) {
            [self.delegate changeSelectedItem:[self getCurrentItem:sender]];
        } else {
            [self.delegate didSelectItem:[self getCurrentItem:sender]];
        }
    }
        
}

-(void)gestureViewPanned:(UIPanGestureRecognizer *)sender{
    
    CGPoint currentPoint = [sender locationInView:self.gestureView];
    CGPoint deltaPoint = CGPointZero;
    
    if (self.editingModeController.editingMode == NormalMode) {
        
        // 일반 상태
        if (sender.state == UIGestureRecognizerStateBegan) {
            
            if ([self getCurrentItem:sender]) {
                self.currentItem = [self getCurrentItem:sender];
                self.originalPoint = [sender locationInView:self.gestureView];
                [self.delegate pangestureBeganForNoramlMode];
            } else {
                return;
            }
            
        } else if (sender.state == UIGestureRecognizerStateChanged){
            
            deltaPoint = CGPointMake(currentPoint.x - self.originalPoint.x,currentPoint.y - self.originalPoint.y);
            [self.delegate pangestureChangedInNormalMode:self.currentItem withDelta:deltaPoint withFingerPoint:currentPoint];
            self.originalPoint = [sender locationInView:self.gestureView];
        } else if (sender.state == UIGestureRecognizerStateEnded){
            [self.delegate pangestureEndedForNoramlMode:self.currentItem withFingerPoint:currentPoint];
            self.currentItem = nil;
        }
    } else {
        
        // 아이템 편집 상태
        if (sender.state == UIGestureRecognizerStateBegan) {
            if ([self getCurrentItem:sender]) {
                self.currentItem = [self getCurrentItem:sender];
                self.originalPoint = [sender locationInView:self.gestureView];
            } else {
                return;
            }
        } else if (sender.state == UIGestureRecognizerStateChanged){
            deltaPoint = CGPointMake(currentPoint.x - self.originalPoint.x,currentPoint.y - self.originalPoint.y);
            [self.delegate pangestureChangedInEditingItemMode:self.currentItem withDelta:deltaPoint];
            self.originalPoint = [sender locationInView:self.gestureView];
        } else if (sender.state == UIGestureRecognizerStateEnded){
            self.currentItem = nil;
        }
        
    }
    
}

-(void)gestureViewPinched:(UIPinchGestureRecognizer *)sender{
    
    //    if (sender.state == UIGestureRecognizerStateBegan && sender.numberOfTouches == 2) {
//
//        self.currentItem = [self getCurrentItem:sender];
//
//    }
    if (sender.numberOfTouches ==2) {
        CGPoint finger1Point = [sender locationOfTouch:0 inView:self.gestureView];
        
        CGPoint finger2Point = [sender locationOfTouch:1 inView:self.gestureView];

    }

}

-(void)gestureViewRotated:(UIRotationGestureRecognizer *)sender{
    
    
    
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
            if (CGRectContainsPoint(item.imageView.frame, centerOfFinger)) {
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

@end
