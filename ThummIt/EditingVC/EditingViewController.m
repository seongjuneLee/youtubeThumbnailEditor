//
//  EditingViewController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/14.
//

#import "EditingViewController.h"
#import "EditingViewController+GestureControllerDelegate.h"
#import "EditingViewController+Buttons.h"
#import "EditingViewController+Text.h"
#import "UIImage+Additions.h"
@interface EditingViewController ()

@end

@implementation EditingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status)
     {
        if (PHPhotoLibrary.authorizationStatus == PHAuthorizationStatusAuthorized){
            dispatch_async(dispatch_get_main_queue(), ^{
                if (PhotoManager.sharedInstance.phassets.count == 0) {
                    PhotoManager.sharedInstance.phassets = [PhotoManager.sharedInstance fetchPhassets];
                }
            });
        }
        
    }];
    
    [self basicUIUXSetting];

    [self connectControllers];
    
    [self addExtraGestureToButtons];
    
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(respondToUndoRedo) name:@"isUndoRedoAvailable" object:nil];
    
    [self setUpSlider];
    
    self.layerController.impactFeedbackGenerator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
    [self.layerController.impactFeedbackGenerator prepare];
    
    self.isFirstLoadVIew = YES;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   NSString * segueName = segue.identifier;
   if ([segueName isEqualToString: @"itemCollectionVCSegue"]) {
       self.itemCollectionVC = (ItemCollectionViewController *) [segue destinationViewController];
       self.itemCollectionVC.editingVC = self;
   } else if ([segueName isEqualToString:@"BGColorVCSegue"]) {
       self.bgColorVC = (BGColorViewController *) [segue destinationViewController];
       self.bgColorVC.editingVC = self;
   }
}


-(void)viewDidLayoutSubviews{
    SaveManager.sharedInstance.bgViewRect = self.bgView.frame;
    if (!self.itemLoaded) {
        [self loadItems];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SaveManager.sharedInstance saveAndAddToStack];
        });
        self.bgColorTopConstraint.constant = self.itemCollectionTopConstraint.constant = self.view.frameHeight;
    }
    [self.buttonScrollView setContentSize:CGSizeMake(self.scrollContentView.frameWidth, self.scrollContentView.frameHeight)];
    
}

-(void)setUpSlider{
    
    UIImage *hueSliderImage = [UIImage imageNamed:@"hueSlider"];
    
    UIImage *maxImage = hueSliderImage;
    UIImage *minImage = hueSliderImage;
    [self.hueSlider setMaximumTrackImage:maxImage forState:UIControlStateNormal];
    [self.hueSlider setMinimumTrackImage:minImage forState:UIControlStateNormal];
    
    self.hueImageView = [[UIImageView alloc] initWithFrame:self.hueSlider.frame];
    self.hueImageView.image = hueSliderImage;
    
    CGRect trackRect = [self.hueSlider trackRectForBounds:self.hueSlider.bounds];
    CGRect thumbRect = [self.hueSlider thumbRectForBounds:self.hueSlider.bounds trackRect:trackRect value:self.hueSlider.value];
    
    self.thumbCircleView = [[UIView alloc] init];
    self.thumbCircleView.userInteractionEnabled = false;
    float scale = 0.7;
    self.thumbCircleView.layer.cornerRadius = (thumbRect.size.width*scale/2);
    self.thumbCircleView.frameWidth = (thumbRect.size.width)*scale;
    self.thumbCircleView.frameHeight = (thumbRect.size.height)*scale;

    [self.view addSubview:self.thumbCircleView];
}

-(void)basicUIUXSetting{
    
    self.bgView.userInteractionEnabled = true;
    
}

#pragma mark - controller 연결

-(void)connectControllers{
    
    [self connectEditingModeController];
    [self connectEditingGestureController];
    [self connectEditingLayerController];
    
    UIStoryboard *editing = [UIStoryboard storyboardWithName:@"Editing" bundle:NSBundle.mainBundle];

    self.albumVC = (AlbumViewController *)[editing instantiateViewControllerWithIdentifier:@"AlbumViewController"];
    self.albumVC.editingVC = self;
    
    self.bgColorVC = (BGColorViewController *)[editing instantiateViewControllerWithIdentifier:@"BGColorViewController"];
    self.bgColorVC.editingVC = self;
    
    self.editingPhotoVC = (EditingPhotoViewController *)[editing instantiateViewControllerWithIdentifier:@"EditingPhotoViewController"];
    self.editingPhotoVC.editingVC = self;
    
    self.editingPhotoButtonVC = (EditingPhotoButtonViewController *)[editing instantiateViewControllerWithIdentifier:@"EditingPhotoButtonViewController"];
    
}

-(void)connectEditingGestureController{
    
    self.gestureController = [[EditingGestureController alloc] init];
    self.gestureController.editingVC = self;
    [self.gestureController addGestureRecognizers];
    
}

-(void)connectEditingModeController{
    
    self.modeController = [[EditingModeController alloc] init];
    self.modeController.editingVC = self;
    
}

-(void)connectEditingLayerController{
    
    self.layerController = [[EditingLayerController alloc] init];
    self.layerController.editingVC = self;
    
}

#pragma mark - load Saved Data

-(void)loadItems{
    
    self.itemLoaded = true;
    Project *project = SaveManager.sharedInstance.currentProject;
    project.itemLayers = [NSMutableArray new];
    self.bgView.backgroundColor = project.backgroundColor;
    self.mainFrameImageView.image = [UIImage imageNamed:project.mainFrameImageName];
    for (Item *item in project.items) {
        [item loadView]; // 뷰 로드하기.
        
        if (item.isTemplateItem) {
            // 템플릿 상댓값 센터를 절댓값으로.
            float itemX = self.bgView.frameWidth * item.center.x;
            float itemY = self.bgView.frameY + self.bgView.frameHeight * item.center.y;
            CGPoint itemCenter = CGPointMake(itemX, itemY);
            item.center = itemCenter;
            
            // 템플릿 상댓값 스케일을 절댓값으로.
            float scale = self.view.frameWidth * item.scale/item.baseView.frameWidth;
            item.scale = scale;
        }
        
        [item setItemCenterAndScale];
        
        if ([item isKindOfClass:Text.class]){ // 텍스트 해주어야 할 일.
            Text *text = (Text *)item;
            text.textView.delegate = self;
            text.isTypedByUser = true;
        }
        
        if (item.isFixedPhotoFrame) { // fixed포토프레임일 때와 아닐 때
            item.baseView.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1.0];
            [self.view insertSubview:item.baseView belowSubview:self.mainFrameImageView];
        } else {
            [self.view insertSubview:item.baseView aboveSubview:self.mainFrameImageView];
        }

    }
    //fixedphotoframe을 제외한 item 개수 얻기위함
    int itemCountExceptFixedPhotoFrame = 0;
    for(Item *item in project.items){
        if(!item.isFixedPhotoFrame){
            itemCountExceptFixedPhotoFrame += 1;
        }
    }
    
    //얻은 값을 사용하여 contentview의 height를 정함(itemlayers count를 사용할 수 없는 시점 이므로)
    ItemLayer *anyItemLayer = [ItemLayer new];
    self.itemLayerContentViewHeightConstraint.constant = - self.itemLayerScrollView.frameHeight + anyItemLayer.barBaseViewHeight/2 * (3*itemCountExceptFixedPhotoFrame + 1);
    self.itemLayerScrollView.contentSize = CGSizeMake(self.itemLayerContentView.frameWidth, self.itemLayerContentView.frameHeight);
    self.itemLayerContentView.backgroundColor = UIColor.systemBlueColor;

    NSUInteger mainFrameImageViewIndex = [self.view.subviews indexOfObject:self.mainFrameImageView];
    
    for (Item *item in project.items) {
        NSInteger itemIndex;
        
        if(self.isFirstLoadVIew){
            itemIndex = item.indexInLayer.integerValue; //템플릿에서 설정한 초기 index
        } else{
            itemIndex = item.indexInLayer.integerValue - mainFrameImageViewIndex -1;
        }
        
        if(!item.isFixedPhotoFrame){
            // 만들기
            ItemLayer *itemLayer = [[ItemLayer alloc] init];
            itemLayer.item = item;
            //각 itemLayer객체는 일치하는 item을 가짐 이후에 변동 없음
            [itemLayer makeView];
            //각 객체의 뷰 생성
            
            float itemLayerX = (self.itemLayerContentView.frameWidth)/2;
            float itemLayerY = (self.itemLayerContentView.frameHeight) - ((itemLayer.barBaseViewHeight/2) * (3 * (itemIndex + 1) - 1));
            
            itemLayer.barBaseView.center = CGPointMake(itemLayerX, itemLayerY);
            itemLayer.originalCenterY = itemLayerY;
            
            //arrange에 쓰이는 original값에 정해진 y값 넣어줌
            
            [self.itemLayerContentView addSubview:itemLayer.barBaseView];
            [self.layerController addItemLayerGestureRecognizers:itemLayer];
            [SaveManager.sharedInstance.currentProject.itemLayers addObject:itemLayer];
            itemLayer.itemLayerIndex = [SaveManager.sharedInstance.currentProject.itemLayers indexOfObject:itemLayer];
        }
    }
    
    if(!self.isFirstLoadVIew){
        NSMutableArray *itemLayersCopy = [NSMutableArray new];
        NSInteger i = 0;

        for(ItemLayer *itemLayer in SaveManager.sharedInstance.currentProject.itemLayers){
            itemLayer.itemLayerIndex = itemLayer.item.indexInLayer.integerValue - mainFrameImageViewIndex - 1;
            [itemLayersCopy addObject:itemLayer];
        }
        for(i = 0; i < itemLayersCopy.count; i++){
             ItemLayer *itemLayer = [itemLayersCopy objectAtIndex:i];
            [SaveManager.sharedInstance.currentProject.itemLayers replaceObjectAtIndex:itemLayer.itemLayerIndex withObject:itemLayer];
        }
    }

    // 인덱스 맞춰주기
    for (Item *item in project.items) {
        if (!item.isFixedPhotoFrame) {
            if (item.isTemplateItem) {
                item.indexInLayer = [NSString stringWithFormat:@"%ld",mainFrameImageViewIndex + [item.indexInLayer integerValue] + 1];
                [self.view insertSubview:item.baseView atIndex:item.indexInLayer.integerValue];
            } else {
                [self.view insertSubview:item.baseView atIndex:item.indexInLayer.integerValue];
            }
        }
        
        item.isTemplateItem = false;
    }
    
    [SaveManager.sharedInstance save];
    
    self.isFirstLoadVIew = NO;
}

-(void)respondToUndoRedo{
    
    self.undoButton.enabled = UndoManager.sharedInstance.isUndoRemains;
    self.redoButton.enabled = UndoManager.sharedInstance.isRedoRemains;
    
}

-(void)showItemsForNormalMode{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.undoButton.alpha =
        self.redoButton.alpha =
        self.leftItem.alpha =
        self.rightItem.alpha = 1.0;
        self.buttonScrollView.hidden = false;
        self.rightItem.alpha =
        self.itemLayerScrollView.alpha = 1.0;
        self.buttonScrollView.alpha = 1.0;
    }];

}
-(void)hideItemsForItemMode{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.undoButton.alpha =
        self.redoButton.alpha =
        self.leftItem.alpha =
        self.rightItem.alpha = 0;
        self.buttonScrollView.hidden = true;
        self.rightItem.alpha =
        self.itemLayerScrollView.alpha = 
        self.buttonScrollView.alpha = 0;
    }];

}

-(void)addExtraGestureToButtons{
    
    [self.photoFrameButton addTarget:self action:@selector(photoFrameButtonHoldDown) forControlEvents:UIControlEventTouchDown];
    [self.photoFrameButton addTarget:self action:@selector(photoFrameButtonHoldDown) forControlEvents:UIControlEventTouchDragEnter];
    [self.photoFrameButton addTarget:self action:@selector(photoFrameButtonHoldRelease) forControlEvents:UIControlEventTouchDragExit];
    [self.photoFrameButton addTarget:self action:@selector(photoFrameButtonHoldRelease) forControlEvents:UIControlEventTouchUpInside];
    [self.photoFrameButton addTarget:self action:@selector(photoFrameButtonHoldRelease) forControlEvents:UIControlEventTouchUpOutside];
    [self.photoFrameButton addTarget:self action:@selector(photoFrameButtonHoldRelease) forControlEvents:UIControlEventTouchCancel];

    [self.textButton addTarget:self action:@selector(textButtonHoldDown) forControlEvents:UIControlEventTouchDown];
    [self.textButton addTarget:self action:@selector(textButtonHoldDown) forControlEvents:UIControlEventTouchDragEnter];
    [self.textButton addTarget:self action:@selector(textButtonHoldRelease) forControlEvents:UIControlEventTouchUpInside];
    [self.textButton addTarget:self action:@selector(textButtonHoldRelease) forControlEvents:UIControlEventTouchDragExit];
    [self.textButton addTarget:self action:@selector(textButtonHoldRelease) forControlEvents:UIControlEventTouchUpOutside];
    [self.textButton addTarget:self action:@selector(textButtonHoldRelease) forControlEvents:UIControlEventTouchCancel];

    [self.stickerButton addTarget:self action:@selector(stickerButtonHoldDown) forControlEvents:UIControlEventTouchDown];
    [self.stickerButton addTarget:self action:@selector(stickerButtonHoldDown) forControlEvents:UIControlEventTouchDragEnter];
    [self.stickerButton addTarget:self action:@selector(stickerButtonHoldRelease) forControlEvents:UIControlEventTouchUpInside];
    [self.stickerButton addTarget:self action:@selector(stickerButtonHoldRelease) forControlEvents:UIControlEventTouchDragExit];
    [self.stickerButton addTarget:self action:@selector(stickerButtonHoldRelease) forControlEvents:UIControlEventTouchUpOutside];
    [self.stickerButton addTarget:self action:@selector(stickerButtonHoldRelease) forControlEvents:UIControlEventTouchCancel];

    [self.bgColorButton addTarget:self action:@selector(bgColorButtonHoldDown) forControlEvents:UIControlEventTouchDown];
    [self.bgColorButton addTarget:self action:@selector(bgColorButtonHoldDown) forControlEvents:UIControlEventTouchDragEnter];
    [self.bgColorButton addTarget:self action:@selector(bgColorButtonHoldRelease) forControlEvents:UIControlEventTouchUpInside];
    [self.bgColorButton addTarget:self action:@selector(bgColorButtonHoldRelease) forControlEvents:UIControlEventTouchDragExit];
    [self.bgColorButton addTarget:self action:@selector(bgColorButtonHoldRelease) forControlEvents:UIControlEventTouchUpOutside];
    [self.bgColorButton addTarget:self action:@selector(bgColorButtonHoldRelease) forControlEvents:UIControlEventTouchCancel];

}

-(void)setUpPhotoAlbums{
    
    
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status)
     {
         if (status == PHAuthorizationStatusAuthorized)
         {
             
             dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                 PhotoManager.sharedInstance.phassets = [PhotoManager.sharedInstance fetchPhassets];
             });
         }
    }];

}


@end
