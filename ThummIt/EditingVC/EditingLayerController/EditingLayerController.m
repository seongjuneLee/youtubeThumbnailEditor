//
//  EditingLayerController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/19.
//

#import "EditingLayerController.h"
#import "EditingViewController.h"
#import "EditingViewController+GestureControllerDelegate.h"

@implementation EditingLayerController
-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)bringCurrentItemToFront:(Item *)currentItem{
    
    self.currentItem = currentItem;
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    self.originalIndex = [editingVC.view.subviews indexOfObject:self.currentItem.baseView];
    [editingVC.view insertSubview:self.currentItem.baseView belowSubview:editingVC.gestureView];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[self.editingVC.view.subviews indexOfObject:item.baseView]];
    }
    
}

-(void)showTransparentView{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    if (!self.transparentView) {
        self.transparentView = [[UIView alloc] initWithFrame:editingVC.bgView.frame];
        self.transparentView.backgroundColor = UIColor.blackColor;
        self.transparentView.alpha = 0.4;
        [editingVC.view insertSubview:self.transparentView belowSubview:editingVC.gestureView];
    }
    
}

-(void)recoverOriginalLayer{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    [self.transparentView removeFromSuperview];
    self.transparentView = nil;
    [editingVC.view insertSubview:self.currentItem.baseView atIndex:self.originalIndex];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[self.editingVC.view.subviews indexOfObject:item.baseView]];
    }
}
-(void)hideTransparentView{
    [self.transparentView removeFromSuperview];
    self.transparentView = nil;
}

-(void)addItemLayerGestureRecognizers:(ItemLayer *)itemLayer{

    UITapGestureRecognizer *itemLayerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemLayerTapped:)];
    [itemLayer.barBaseView addGestureRecognizer:itemLayerTap];

    UILongPressGestureRecognizer *itemLayerlongPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(itemLayerLongPressed:)];
    itemLayerlongPress.minimumPressDuration = 0.5;
    [itemLayer.barBaseView addGestureRecognizer:itemLayerlongPress];
    
    UIPanGestureRecognizer *itemLayerPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(itemLayerPanned:)];
    [itemLayer.barBaseView addGestureRecognizer:itemLayerPan];
    
    
}

-(void)itemLayerTapped:(UITapGestureRecognizer *)sender{
//longtap일땐 여기로 안들어옴
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    ItemLayer *tappedItemLayer = [self getCurrentItemLayer:sender];
    Item *itemOfItemLayer = [[Item alloc] init];
    
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        if (tappedItemLayer.item == item) {
            itemOfItemLayer = item;
        }
    }
    [editingVC didSelectItem:itemOfItemLayer];
}

-(void)itemLayerLongPressed:(UILongPressGestureRecognizer *)sender{
    
    
    if(sender.state == UIGestureRecognizerStateBegan){
        self.pressedItemLayer = [self getCurrentItemLayer:sender];

       
        sender.state = UIGestureRecognizerStateCancelled;
        
        self.pressedItemLayer = [self getCurrentItemLayer:sender];
        self.pressedItemLayer.isLongPressed = YES;

    } else if(sender.state == UIGestureRecognizerStateChanged){
        
    } else if(sender.state == UIGestureRecognizerStateEnded){
        
    } else if(sender.state == UIGestureRecognizerStateCancelled){
    }
    
}

-(void)itemLayerPanned:(UIPanGestureRecognizer *)sender{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    //pressed된 아이템이 없거나 & longpressed되지 않았다면 pan 자체 못함
    if (!self.pressedItemLayer || !self.pressedItemLayer.isLongPressed){
        return;
    } else{
        
        CGPoint currentPoint = [sender locationInView:editingVC.itemLayerContentView];
        CGPoint deltaPoint = CGPointZero;
        
        if (sender.state == UIGestureRecognizerStateBegan) {
            
           self.previousPoint = [sender locationInView:editingVC.itemLayerContentView];
           
        } else if(sender.state == UIGestureRecognizerStateChanged){
            
            deltaPoint = CGPointMake(editingVC.itemLayerContentView.frameWidth/2 ,currentPoint.y - self.previousPoint.y);
            
            self.pressedItemLayer.barBaseView.centerY += deltaPoint.y;
            self.previousPoint = [sender locationInView:editingVC.itemLayerContentView];
            
            [self itemLayerArrange:deltaPoint:sender];
            
        } else if(sender.state == UIGestureRecognizerStateEnded){
            
            self.pressedItemLayer.isLongPressed = NO;

        }
        
    }

    
}

-(ItemLayer *)getCurrentItemLayer:(UIGestureRecognizer*)sender{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    CGPoint tappedLocation = [sender locationInView:editingVC.itemLayerContentView];
    NSMutableArray *foundItemLayers = [NSMutableArray new];
    for(ItemLayer *itemLayer in SaveManager.sharedInstance.currentProject.itemLayers){
        if (CGRectContainsPoint(itemLayer.barBaseView.frame, tappedLocation)) {
                [foundItemLayers addObject:itemLayer];
            }
        }
    return [foundItemLayers firstObject];
    
}

-(void)itemLayerArrange:(CGPoint)deltaPoint :(UIGestureRecognizer *)sender{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    NSInteger mainFrameImageViewIndex = [editingVC.view.subviews indexOfObject:editingVC.mainFrameImageView];

    
    NSInteger pressedItemOriginalCenterY;
    NSInteger nextItemOriginalCenterY;
    
    if(deltaPoint.y > 0){
        if(self.pressedItemLayer == SaveManager.sharedInstance.currentProject.itemLayers.firstObject){
            return;
        }
        self.nextItemLayer = SaveManager.sharedInstance.currentProject.itemLayers[self.pressedItemLayer.itemLayerIndex - 1];
        //dy > 0 이면 nextitem 위와 같음

        if(![self doesFirstObjectEqualToNextItemLayer:self.nextItemLayer]){
           //nextitemlayer가 array의 마지막 object 아닐때
            if(self.pressedItemLayer.barBaseView.centerY >= self.nextItemLayer.originalCenterY - self.nextItemLayer.barBaseView.frameHeight/2){

                pressedItemOriginalCenterY = self.pressedItemLayer.originalCenterY;
                nextItemOriginalCenterY = self.nextItemLayer.originalCenterY;               // 바꾸기 전 저장해놈
                [UIView animateWithDuration:0.2 animations:^{
                self.nextItemLayer.barBaseView.centerY = pressedItemOriginalCenterY;
                self.pressedItemLayer.barBaseView.centerY = nextItemOriginalCenterY; //실제위치를 바꿔줌
                }];
                 
                self.nextItemLayer.originalCenterY = pressedItemOriginalCenterY;
                self.pressedItemLayer.originalCenterY = nextItemOriginalCenterY;
                
                self.nextItemLayer.itemLayerIndex = self.pressedItemLayer.itemLayerIndex;
                [SaveManager.sharedInstance.currentProject.itemLayers removeObjectAtIndex:self.pressedItemLayer.itemLayerIndex];
                //itemLayers에서 presseditemlayer자기 원래 자리에서 제거
                self.pressedItemLayer.itemLayerIndex += -1;
                
                [SaveManager.sharedInstance.currentProject.itemLayers insertObject:self.pressedItemLayer atIndex:self.pressedItemLayer.itemLayerIndex];
                
                self.pressedItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.pressedItemLayer.itemLayerIndex + 1];
                self.nextItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.nextItemLayer.itemLayerIndex + 1];
                //itemlayer에 해당하는 item의 index in layer도 바뀐값으로 잘넣어줌
                
                [editingVC.view insertSubview:self.pressedItemLayer.item.baseView atIndex:self.pressedItemLayer.item.indexInLayer.integerValue];
                        // stacksave도 해야댐
            }
            
        } else{           //nextitemlayer가 array의 마지막 object일때는 nextitemlayer로 savemanager에서 받으면 튕기므로
            if(self.pressedItemLayer.barBaseView.centerY >= self.nextItemLayer.originalCenterY - self.nextItemLayer.barBaseView.frameHeight/2){

                pressedItemOriginalCenterY = self.pressedItemLayer.originalCenterY;
                nextItemOriginalCenterY = self.nextItemLayer.originalCenterY;        // 바꾸기 전 값 저장
                [UIView animateWithDuration:0.2 animations:^{
                self.nextItemLayer.barBaseView.centerY = pressedItemOriginalCenterY;
                self.pressedItemLayer.barBaseView.centerY = nextItemOriginalCenterY; //실제위치를 바꿔줌
                }];
                self.nextItemLayer.originalCenterY = pressedItemOriginalCenterY;
                self.pressedItemLayer.originalCenterY = nextItemOriginalCenterY;     //객체가 가진 위치값도 바꿔줌
                
                self.nextItemLayer.itemLayerIndex = self.pressedItemLayer.itemLayerIndex;
                [SaveManager.sharedInstance.currentProject.itemLayers    removeObjectAtIndex:self.pressedItemLayer.itemLayerIndex];
                
                self.pressedItemLayer.itemLayerIndex += -1;
                [SaveManager.sharedInstance.currentProject.itemLayers insertObject:self.pressedItemLayer atIndex:self.pressedItemLayer.itemLayerIndex];
                
                self.pressedItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.pressedItemLayer.itemLayerIndex + 1];
                self.nextItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.nextItemLayer.itemLayerIndex + 1];
                //itemlayer에 해당하는 item의 index in layer도 바뀐값으로 잘넣어줌
                
                [editingVC.view insertSubview:self.pressedItemLayer.item.baseView atIndex:self.pressedItemLayer.item.indexInLayer.integerValue];

                
                sender.state = UIGestureRecognizerStateEnded;
            }
            
        }
    } else if(deltaPoint.y < 0){
        
        if(self.pressedItemLayer == SaveManager.sharedInstance.currentProject.itemLayers.lastObject){
            return;
        }
        
        self.nextItemLayer = SaveManager.sharedInstance.currentProject.itemLayers[self.pressedItemLayer.itemLayerIndex + 1];
        if(![self doesLastObjectEqualToNextItemLayer:self.nextItemLayer]){
           //nextitemlayer가 array의 마지막 object 아닐때
            if(self.pressedItemLayer.barBaseView.centerY <= self.nextItemLayer.originalCenterY + self.nextItemLayer.barBaseView.frameHeight/2){

                pressedItemOriginalCenterY = self.pressedItemLayer.originalCenterY;
                nextItemOriginalCenterY = self.nextItemLayer.originalCenterY;               //바꾸기 전 값 저장
                [UIView animateWithDuration:0.2 animations:^{
                self.nextItemLayer.barBaseView.centerY = pressedItemOriginalCenterY;
                self.pressedItemLayer.barBaseView.centerY = nextItemOriginalCenterY;        //실제위치를 바꿔줌
                }];
                
                self.nextItemLayer.originalCenterY = pressedItemOriginalCenterY;
                self.pressedItemLayer.originalCenterY = nextItemOriginalCenterY;            //객체가 가지는 값도 바꿈
                
                //객체가 가지는 index값 바꿈 & arrary에 save도 자기 index에 맞게
                self.nextItemLayer.itemLayerIndex = self.pressedItemLayer.itemLayerIndex;
                [SaveManager.sharedInstance.currentProject.itemLayers removeObjectAtIndex:self.pressedItemLayer.itemLayerIndex];
                //itemLayers에서 presseditemlayer자기 원래 자리에서 제거
                
                self.pressedItemLayer.itemLayerIndex += 1;
                
                [SaveManager.sharedInstance.currentProject.itemLayers insertObject:self.pressedItemLayer atIndex:self.pressedItemLayer.itemLayerIndex];
                
                self.pressedItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.pressedItemLayer.itemLayerIndex + 1];
                self.nextItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.nextItemLayer.itemLayerIndex + 1];
                //itemlayer에 해당하는 item의 index in layer도 바뀐값으로 잘넣어줌
                
                [editingVC.view insertSubview:self.pressedItemLayer.item.baseView atIndex:self.pressedItemLayer.item.indexInLayer.integerValue];

                
                        // stacksave도 해야댐
            }
            
        } else{
            if(self.pressedItemLayer.barBaseView.centerY <= self.nextItemLayer.originalCenterY + self.nextItemLayer.barBaseView.frameHeight/2){

                pressedItemOriginalCenterY = self.pressedItemLayer.originalCenterY;
                nextItemOriginalCenterY = self.nextItemLayer.originalCenterY;
                
                [UIView animateWithDuration:0.2 animations:^{
                self.nextItemLayer.barBaseView.centerY = pressedItemOriginalCenterY;
                self.pressedItemLayer.barBaseView.centerY = nextItemOriginalCenterY;
                }];
                
                self.nextItemLayer.originalCenterY = pressedItemOriginalCenterY;
                self.pressedItemLayer.originalCenterY = nextItemOriginalCenterY;
                
                self.nextItemLayer.itemLayerIndex = self.pressedItemLayer.itemLayerIndex;
                [SaveManager.sharedInstance.currentProject.itemLayers    removeObjectAtIndex:self.pressedItemLayer.itemLayerIndex];
                
                self.pressedItemLayer.itemLayerIndex += +1;
                [SaveManager.sharedInstance.currentProject.itemLayers insertObject:self.pressedItemLayer atIndex:self.pressedItemLayer.itemLayerIndex];
                
                self.pressedItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.pressedItemLayer.itemLayerIndex + 1];
                self.nextItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.nextItemLayer.itemLayerIndex + 1];
                //itemlayer에 해당하는 item의 index in layer도 바뀐값으로 잘넣어줌
                
                [editingVC.view insertSubview:self.pressedItemLayer.item.baseView atIndex:self.pressedItemLayer.item.indexInLayer.integerValue];

                
                sender.state = UIGestureRecognizerStateEnded;
            }
            
        }
        
    }

}


-(BOOL)doesLastObjectEqualToNextItemLayer:(ItemLayer *)nextItemLayer{
    
    if(nextItemLayer == SaveManager.sharedInstance.currentProject.itemLayers.lastObject){
        return YES;
    } else{
        return NO;
    }
}
-(BOOL)doesFirstObjectEqualToNextItemLayer:(ItemLayer *)nextItemLayer{
    
    if(nextItemLayer == SaveManager.sharedInstance.currentProject.itemLayers.firstObject){
        return YES;
    } else{
        return NO;
    }
}

@end
