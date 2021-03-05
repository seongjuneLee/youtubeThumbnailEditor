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

-(void)bringCurrentItemToFront{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    //바꾸기전 index를 저장해놓고
    self.originalIndex = [editingVC.view.subviews indexOfObject:editingVC.currentItem.baseView];
    //item을 젤 위로 올리고
    [editingVC.view insertSubview:editingVC.currentItem.baseView belowSubview:editingVC.gestureView];
    //올려진 상태로 다시 indexinlayer 값 모든 item들에 대해 저장
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
    //transparentview 제거 & 원래 index위치에 currentitem 위치시킴 & 위치시킨 대로 indexinlayer 저장
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    [self.transparentView removeFromSuperview];
    self.transparentView = nil;
    
    [editingVC.view insertSubview:editingVC.currentItem.baseView atIndex:self.originalIndex];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[self.editingVC.view.subviews indexOfObject:item.baseView]];
    }
}

-(void)hideTransparentView{
    //transparentview만 제거
    [self.transparentView removeFromSuperview];
    self.transparentView = nil;
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

-(void)addItemLayerGestureRecognizers:(ItemLayer *)itemLayer{

    UITapGestureRecognizer *itemLayerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemLayerTapped:)];
    [itemLayer.barBaseView addGestureRecognizer:itemLayerTap];

    UILongPressGestureRecognizer *itemLayerlongPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(itemLayerLongPressed:)];
    itemLayerlongPress.minimumPressDuration = 0.3;
    [itemLayer.barBaseView addGestureRecognizer:itemLayerlongPress];
    
}

-(void)itemLayerTapped:(UITapGestureRecognizer *)sender{
    
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
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

        CGPoint currentPoint = [sender locationInView:editingVC.itemLayerContentView];
        CGPoint deltaPoint = CGPointZero;
    
        if(sender.state == UIGestureRecognizerStateBegan){
            
            [self.impactFeedbackGenerator performSelector:@selector(impactOccurred) withObject:nil afterDelay:0.0f];
            self.pressedItemLayer = [self getCurrentItemLayer:sender];
            self.previousPoint = [sender locationInView:editingVC.itemLayerContentView];
            
        } else if(sender.state == UIGestureRecognizerStateChanged){
            
            deltaPoint = CGPointMake(editingVC.itemLayerContentView.frameWidth/2 ,currentPoint.y - self.previousPoint.y);
            
            self.pressedItemLayer.barBaseView.centerY += deltaPoint.y;
            self.previousPoint = [sender locationInView:editingVC.itemLayerContentView];
            
            [self itemLayerArrange:deltaPoint withSender:sender];
            
            
        } else if(sender.state == UIGestureRecognizerStateEnded){
            
            [UIView animateWithDuration:0.2 animations:^{
            self.pressedItemLayer.barBaseView.centerY = self.pressedItemLayer.originalCenterY;
            }];
            [SaveManager.sharedInstance saveAndAddToStack];//여기
        }
    
}

-(void)itemLayerArrange:(CGPoint)deltaPoint withSender:(UIGestureRecognizer *)sender{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    NSInteger mainFrameImageViewIndex = [editingVC.view.subviews indexOfObject:editingVC.mainFrameImageView];
    NSInteger pressedItemOriginalCenterY;
    NSInteger nextItemOriginalCenterY;
    
    if(deltaPoint.y > 0){
        //y > 0 인 case에 대해, 젤 아래 itemlayer가 선택되면 nextitem 존재 x -> return 시켜서 아래로 pan 불가하게
        if(self.pressedItemLayer == SaveManager.sharedInstance.currentProject.itemLayers.firstObject || self.directionShouldChange){
            self.directionShouldChange = NO;
            return;
        }
        //dy > 0 이면 nextitem 다음과 같음
        self.nextItemLayer = SaveManager.sharedInstance.currentProject.itemLayers[self.pressedItemLayer.itemLayerIndex - 1];

        if(![self doesNextItemLayerEqualToFirstObject:self.nextItemLayer]){
           //nextitemlayer가 array의 마지막 object 아닐때
            if(self.pressedItemLayer.barBaseView.centerY >= self.nextItemLayer.originalCenterY - self.nextItemLayer.barBaseView.frameHeight/2){
                
                //바꾸기 전 값 임시저장
                pressedItemOriginalCenterY = self.pressedItemLayer.originalCenterY;
                nextItemOriginalCenterY = self.nextItemLayer.originalCenterY;
                //실제위치 변경
                [UIView animateWithDuration:0.2 animations:^{
                self.nextItemLayer.barBaseView.centerY = pressedItemOriginalCenterY;
//                self.pressedItemLayer.barBaseView.centerY = nextItemOriginalCenterY;
                }];
                //객체가 가진 위치값도 변경
                self.nextItemLayer.originalCenterY = pressedItemOriginalCenterY;
                self.pressedItemLayer.originalCenterY = nextItemOriginalCenterY;
                                
                //nextitem의 itemlayerindex 변경
                self.nextItemLayer.itemLayerIndex = self.pressedItemLayer.itemLayerIndex;
                //presseditem를 array에서 제거
                [SaveManager.sharedInstance.currentProject.itemLayers removeObjectAtIndex:self.pressedItemLayer.itemLayerIndex];
                //변경된 값에 맞추어 array에 다시 넣음
                self.pressedItemLayer.itemLayerIndex += -1;
                //pressed & next item의 indexinlayer을 itemlayerindex에 맞추어 다시 설정
                [SaveManager.sharedInstance.currentProject.itemLayers insertObject:self.pressedItemLayer atIndex:self.pressedItemLayer.itemLayerIndex];
                //pressed & next item의 indexinlayer을 itemlayerindex에 맞추어 다시 설정
                self.pressedItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.pressedItemLayer.itemLayerIndex + 1];
                self.nextItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.nextItemLayer.itemLayerIndex + 1];
                //indexinlayer에 맞추어 bgview에서도 위치 변경
                [editingVC.view insertSubview:self.pressedItemLayer.item.baseView atIndex:self.pressedItemLayer.item.indexInLayer.integerValue];
                
                [self.impactFeedbackGenerator performSelector:@selector(impactOccurred) withObject:nil afterDelay:0.0f];

            }
            
            //nextitemlayer가 array의 마지막 object일때는 nextitemlayer를 받으면 튕기는 현상에 대한 대응
        } else{
            if(self.pressedItemLayer.barBaseView.centerY >= self.nextItemLayer.originalCenterY - self.nextItemLayer.barBaseView.frameHeight/2){
                
                // 바꾸기 전 값 저장
                pressedItemOriginalCenterY = self.pressedItemLayer.originalCenterY;
                nextItemOriginalCenterY = self.nextItemLayer.originalCenterY;
                //실제위치 변경
                [UIView animateWithDuration:0.2 animations:^{
                self.nextItemLayer.barBaseView.centerY = pressedItemOriginalCenterY;
                self.pressedItemLayer.barBaseView.centerY = nextItemOriginalCenterY;
                }];
                //객체가 가진 위치값도 변경
                self.nextItemLayer.originalCenterY = pressedItemOriginalCenterY;
                self.pressedItemLayer.originalCenterY = nextItemOriginalCenterY;
                                
                //nextitem의 itemlayerindex 변경
                self.nextItemLayer.itemLayerIndex = self.pressedItemLayer.itemLayerIndex;
                //presseditem를 array에서 제거
                [SaveManager.sharedInstance.currentProject.itemLayers    removeObjectAtIndex:self.pressedItemLayer.itemLayerIndex];
                //presseditem의 itemlayerindex 변경
                self.pressedItemLayer.itemLayerIndex += -1;
                //변경된 값에 맞추어 array에 다시 넣음
                [SaveManager.sharedInstance.currentProject.itemLayers insertObject:self.pressedItemLayer atIndex:self.pressedItemLayer.itemLayerIndex];
                //pressed & next item의 indexinlayer을 itemlayerindex에 맞추어 다시 설정
                self.pressedItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.pressedItemLayer.itemLayerIndex + 1];
                self.nextItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.nextItemLayer.itemLayerIndex + 1];
                //indexinlayer에 맞추어 bgview에서도 위치 변경
                [editingVC.view insertSubview:self.pressedItemLayer.item.baseView atIndex:self.pressedItemLayer.item.indexInLayer.integerValue];
                
                //nextitemlayer = first object 일시 state end시켜줘서 튕김 방어(이후 다른 방법 생각)
                self.directionShouldChange = YES;
                }
            
            [self.impactFeedbackGenerator performSelector:@selector(impactOccurred) withObject:nil afterDelay:0.0f];

        }
    } else if(deltaPoint.y < 0){
        
        if(self.pressedItemLayer == SaveManager.sharedInstance.currentProject.itemLayers.lastObject || self.directionShouldChange){
            self.directionShouldChange = NO;
            return;
        }
        
        self.nextItemLayer = SaveManager.sharedInstance.currentProject.itemLayers[self.pressedItemLayer.itemLayerIndex + 1];
        if(![self doesNextItemLayerEqualToLastObject:self.nextItemLayer]){

            if(self.pressedItemLayer.barBaseView.centerY <= self.nextItemLayer.originalCenterY + self.nextItemLayer.barBaseView.frameHeight/2){

                pressedItemOriginalCenterY = self.pressedItemLayer.originalCenterY;
                nextItemOriginalCenterY = self.nextItemLayer.originalCenterY;
                [UIView animateWithDuration:0.2 animations:^{
                self.nextItemLayer.barBaseView.centerY = pressedItemOriginalCenterY;
//                self.pressedItemLayer.barBaseView.centerY = nextItemOriginalCenterY;
                }];
                
                self.nextItemLayer.originalCenterY = pressedItemOriginalCenterY;
                self.pressedItemLayer.originalCenterY = nextItemOriginalCenterY;
                
                self.nextItemLayer.itemLayerIndex = self.pressedItemLayer.itemLayerIndex;
                [SaveManager.sharedInstance.currentProject.itemLayers removeObjectAtIndex:self.pressedItemLayer.itemLayerIndex];
                
                self.pressedItemLayer.itemLayerIndex += 1;
                
                [SaveManager.sharedInstance.currentProject.itemLayers insertObject:self.pressedItemLayer atIndex:self.pressedItemLayer.itemLayerIndex];
                
                self.pressedItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.pressedItemLayer.itemLayerIndex + 1];
                self.nextItemLayer.item.indexInLayer = [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + self.nextItemLayer.itemLayerIndex + 1];
                
                
                [editingVC.view insertSubview:self.pressedItemLayer.item.baseView atIndex:self.pressedItemLayer.item.indexInLayer.integerValue];
                
                [self.impactFeedbackGenerator performSelector:@selector(impactOccurred) withObject:nil afterDelay:0.0f];

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
                
                [editingVC.view insertSubview:self.pressedItemLayer.item.baseView atIndex:self.pressedItemLayer.item.indexInLayer.integerValue];
                
                [self.impactFeedbackGenerator performSelector:@selector(impactOccurred) withObject:nil afterDelay:0.0f];

                self.directionShouldChange = YES;
            }
        }
    }
}

-(BOOL)doesNextItemLayerEqualToLastObject:(ItemLayer *)nextItemLayer{
    
    if(nextItemLayer == SaveManager.sharedInstance.currentProject.itemLayers.lastObject){
        return YES;
    } else{
        return NO;
    }
}
-(BOOL)doesNextItemLayerEqualToFirstObject:(ItemLayer *)nextItemLayer{
    
    if(nextItemLayer == SaveManager.sharedInstance.currentProject.itemLayers.firstObject){
        return YES;
    } else{
        return NO;
    }
}

-(void)itemLayerDelete{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    NSInteger deletedItemLayerIndex = 0;
    ItemLayer *foundItemLayer;
    ItemLayer *anyItemLayer = [ItemLayer new];
    
    //itemCollectionView가 올라와있는 경우 pan을 통해 내릴 때, contentview가 한칸 줄어드는 경우 방어
    BOOL ButtonsInScrollViewSelected = YES;
    for(Item *item in SaveManager.sharedInstance.currentProject.items){
        if(editingVC.currentItem == item){
            ButtonsInScrollViewSelected = NO;
            break;
        } else{
            ButtonsInScrollViewSelected = YES;
        }
    }
    
    if(!ButtonsInScrollViewSelected){
        for(ItemLayer *itemLayer in SaveManager.sharedInstance.currentProject.itemLayers){
                if(itemLayer.item == editingVC.currentItem){
                        foundItemLayer = itemLayer;
                        [itemLayer.barBaseView removeFromSuperview];
                        deletedItemLayerIndex = itemLayer.itemLayerIndex;
                     }
            }
        
        [SaveManager.sharedInstance.currentProject.itemLayers removeObject:foundItemLayer];
        
        for(ItemLayer *itemLayer in SaveManager.sharedInstance.currentProject.itemLayers){
            if(itemLayer.itemLayerIndex > deletedItemLayerIndex){
                itemLayer.itemLayerIndex -= 1;
            }
        }
        [UIView animateWithDuration:0.2 animations:^{
        editingVC.itemLayerContentViewHeightConstraint.constant -= anyItemLayer.barBaseViewHeight/2 * 3;
        }];
        
        for(ItemLayer *itemLayer in SaveManager.sharedInstance.currentProject.itemLayers){
            if(itemLayer.itemLayerIndex < deletedItemLayerIndex){
                
                [UIView animateWithDuration:0.2 animations:^{
                    itemLayer.barBaseView.centerY -= itemLayer.barBaseViewHeight/2 * 3;
                }];
                itemLayer.originalCenterY -= itemLayer.barBaseViewHeight/2 * 3;
               
            }
        }
    }
    
}

@end
