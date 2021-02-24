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

-(void)addGestureRecognizers{
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureViewPanned:)];
    [self.gestureView addGestureRecognizer:pan];

    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(gestureViewPinched:)];
    [self.gestureView addGestureRecognizer:pinch];
    pinch.delegate = self;
    
}


@end
