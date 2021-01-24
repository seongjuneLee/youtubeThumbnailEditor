//
//  GuideLineManager.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/23.
//

#import "GuideLineManager.h"
#import "Item.h"
#import "GuideLine.h"
#import "GuideTarget.h"
#import "SaveManager.h"
@implementation GuideLineManager

+ (GuideLineManager *)sharedInstance {
    
    static GuideLineManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GuideLineManager alloc] init];
    });
    
    return sharedInstance;
    
}

-(NSMutableArray *)frameTargetsWithCurrentItem:(Item *)item{
    
    NSMutableArray *criterias = [NSMutableArray array];
    

    GuideTarget *topLeftTarget = [[GuideTarget alloc] init];
    topLeftTarget.targetPoint = item.baseView.frameOrigin;
    topLeftTarget.guideTargetType = GuideTargetTopLeft;
    
    GuideTarget *topRightTarget = [[GuideTarget alloc] init];
    topRightTarget.targetPoint = CGPointMake(item.baseView.frameX + item.baseView.frameWidth, item.baseView.frameY);
    topRightTarget.guideTargetType = GuideTargetTopRight;

    GuideTarget *bottomLeftTarget = [[GuideTarget alloc] init];
    bottomLeftTarget.targetPoint = CGPointMake(item.baseView.frameX, item.baseView.frameY + item.baseView.frameHeight);
    bottomLeftTarget.guideTargetType = GuideTargetBottomLeft;

    GuideTarget *bottomRightTarget = [[GuideTarget alloc] init];
    bottomRightTarget.targetPoint = CGPointMake(item.baseView.frameX + item.baseView.frameWidth, item.baseView.frameY + item.baseView.frameHeight);
    bottomRightTarget.guideTargetType = GuideTargetBottomRight;
    
    GuideTarget *centerTarget = [[GuideTarget alloc] init];
    centerTarget.targetPoint = item.baseView.center;
    centerTarget.guideTargetType = GuideTargetCenter;
    
    [criterias addObject:topLeftTarget];
    [criterias addObject:topRightTarget];
    [criterias addObject:bottomLeftTarget];
    [criterias addObject:bottomRightTarget];
    [criterias addObject:centerTarget];
    
    return criterias;
    
}

-(NSMutableArray *)criteriasForFrameWithBGView:(UIView *)bgView{
    
    NSMutableArray *criterias = [NSMutableArray array];
    
    float padding = 4;
    float guideLineThickness = 2;
    GuideLine *centerXGuide = [[GuideLine alloc] init];
    centerXGuide.guideLineView.frame = CGRectMake(bgView.centerX - guideLineThickness, bgView.frameY, guideLineThickness, bgView.frameHeight);
    CGRect centerX = CGRectMake(bgView.centerX - padding, bgView.frameY, padding*2, bgView.frameHeight);
    centerXGuide.guideArea = centerX;
    centerXGuide.guideValue = bgView.centerX;
    
    
    GuideLine *centerYGuide = [[GuideLine alloc] init];
    centerYGuide.guideLineView.frame = CGRectMake(0, bgView.centerY - guideLineThickness, bgView.frameWidth, guideLineThickness);
    CGRect centerY = CGRectMake(0, bgView.centerY - padding, bgView.frameWidth, padding*2);
    centerYGuide.guideArea = centerY;
    centerYGuide.guideValue = bgView.centerY;

    CGRect top = CGRectMake(0, bgView.frameY - padding, bgView.frameWidth, padding*2);
    GuideLine *topGuide = [[GuideLine alloc] init];
    topGuide.guideLineView.frame = CGRectMake(0, bgView.frameY, bgView.frameWidth, guideLineThickness);
    topGuide.guideArea = top;
    topGuide.guideValue = bgView.frameY;

    CGRect bottom = CGRectMake(0, bgView.frameY + bgView.frameHeight - padding, bgView.frameWidth, padding*2);
    GuideLine *bottomGuide = [[GuideLine alloc] init];
    bottomGuide.guideLineView.frame =CGRectMake(0, bgView.frameY + bgView.frameHeight - guideLineThickness/2, bgView.frameWidth, guideLineThickness);
    bottomGuide.guideArea = bottom;
    bottomGuide.guideValue = bgView.frameY + bgView.frameHeight;

    CGRect leading = CGRectMake(-padding, bgView.frameY, padding*2, bgView.frameHeight);
    GuideLine *leadingGuide = [[GuideLine alloc] init];
    leadingGuide.guideLineView.frame =CGRectMake(0, bgView.frameY, guideLineThickness, bgView.frameHeight);
    leadingGuide.guideArea = leading;
    leadingGuide.guideValue = bgView.frameWidth;

    CGRect trailing = CGRectMake(bgView.frameWidth-padding, bgView.frameY, padding*2, bgView.frameHeight);
    GuideLine *trailingGuide = [[GuideLine alloc] init];
    trailingGuide.guideLineView.frame =CGRectMake(bgView.frameWidth-guideLineThickness, bgView.frameY, guideLineThickness, bgView.frameHeight);
    trailingGuide.guideArea = trailing;
    trailingGuide.guideValue = 0;

    [criterias addObject:centerXGuide];
    [criterias addObject:centerYGuide];
    [criterias addObject:topGuide];
    [criterias addObject:bottomGuide];
    [criterias addObject:leadingGuide];
    [criterias addObject:trailingGuide];
    
    return criterias;
}


-(NSMutableArray *)criteriasForItemFrameWithCurrentItem:(Item *)currentItem withBGView:(UIView *)bgView{
    
    NSMutableArray *criterias = [NSMutableArray array];
    float padding = 5;
    float guideLineThickness = 2;

    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        if (currentItem != item) {
            float maxFrameY = MAX(item.baseView.frameY, currentItem.baseView.frameY);
            float minFrameY = MIN(item.baseView.frameY, currentItem.baseView.frameY);

            float maxFrameX = MAX(item.baseView.frameX, currentItem.baseView.frameX);
            float minFrameX = MIN(item.baseView.frameX, currentItem.baseView.frameX);
            
            Item *maxFrameXItem;
            if (item.baseView.frameX == maxFrameX) {
                maxFrameXItem = item;
            } else {
                maxFrameXItem = currentItem;
            }
            
            Item *maxFrameYItem;
            if (item.baseView.frameY == maxFrameX) {
                maxFrameYItem = item;
            } else {
                maxFrameYItem = currentItem;
            }

            CGRect centerX = CGRectMake(item.baseView.centerX - padding, bgView.frameY, 10, bgView.frameHeight);
            GuideLine *centerXGuide = [[GuideLine alloc] init];
            centerXGuide.dashedGuideLineView.frame =CGRectMake(item.baseView.centerX,minFrameY- guideLineThickness/2,guideLineThickness,(maxFrameY + maxFrameYItem.baseView.frameHeight) - minFrameY);
            [centerXGuide.dashedGuideLineView makeViewDashed];
            centerXGuide.guideArea = centerX;
            centerXGuide.guideValue = item.baseView.centerX;

            CGRect centerY = CGRectMake(0, item.baseView.centerY - padding, bgView.frameWidth, 10);
            GuideLine *centerYGuide = [[GuideLine alloc] init];
            centerYGuide.dashedGuideLineView.frame =CGRectMake(minFrameX, item.baseView.centerY, (maxFrameX +maxFrameXItem.baseView.frameWidth) - minFrameX, guideLineThickness);
            [centerYGuide.dashedGuideLineView makeViewDashed];
            centerYGuide.guideArea = centerY;
            centerYGuide.guideValue = item.baseView.centerY;

            CGRect top = CGRectMake(0, item.baseView.frameY - padding, bgView.frameWidth, 10);
            GuideLine *topGuide = [[GuideLine alloc] init];
            topGuide.dashedGuideLineView.frame =CGRectMake(minFrameX, item.baseView.frameY, (maxFrameX +maxFrameXItem.baseView.frameWidth) - minFrameX, guideLineThickness);
            [topGuide.dashedGuideLineView makeViewDashed];
            topGuide.guideArea = top;
            topGuide.guideValue = item.baseView.frameY;

            CGRect bottom = CGRectMake(0, item.baseView.frameY + item.baseView.frameHeight - padding, bgView.frameWidth, 10);
            GuideLine *bottomGuide = [[GuideLine alloc] init];
            bottomGuide.dashedGuideLineView.frame =CGRectMake(minFrameX, item.baseView.frameY + item.baseView.frameHeight, (maxFrameX +maxFrameXItem.baseView.frameWidth) - minFrameX, guideLineThickness);
            [bottomGuide.dashedGuideLineView makeViewDashed];
            bottomGuide.guideArea = bottom;
            bottomGuide.guideValue = item.baseView.frameY + item.baseView.frameHeight;

            CGRect leading = CGRectMake(item.baseView.frameX - padding, bgView.frameY, 10, bgView.frameHeight);
            GuideLine *leadingGuide = [[GuideLine alloc] init];
            leadingGuide.dashedGuideLineView.frame =CGRectMake(item.baseView.frameX, minFrameY, guideLineThickness, (maxFrameY +maxFrameYItem.baseView.frameHeight) - minFrameY);
            [leadingGuide.dashedGuideLineView makeViewDashed];
            leadingGuide.guideArea = leading;
            leadingGuide.guideValue = item.baseView.frameX;

            CGRect trailing = CGRectMake(item.baseView.frameX + item.baseView.frameWidth-padding, bgView.frameY, 10, bgView.frameHeight);
            GuideLine *trailingGuide = [[GuideLine alloc] init];
            trailingGuide.dashedGuideLineView.frame =CGRectMake(item.baseView.frameX + item.baseView.frameWidth, minFrameY, guideLineThickness, (maxFrameY +maxFrameYItem.baseView.frameHeight) - minFrameY);
            [trailingGuide.dashedGuideLineView makeViewDashed];
            trailingGuide.guideArea = trailing;
            leadingGuide.guideValue = item.baseView.frameX + item.baseView.frameWidth;
            
            [criterias addObject:centerXGuide];
            [criterias addObject:centerYGuide];
            [criterias addObject:topGuide];
            [criterias addObject:bottomGuide];
            [criterias addObject:leadingGuide];
            [criterias addObject:trailingGuide];
        }
    }
    
    return criterias;
}

-(NSMutableArray *)criteriasForSizesWithBGView:(UIView *)bgView {
    NSMutableArray *criterias = [NSMutableArray array];

    return criterias;
}

-(NSMutableArray *)criteriasForRadians{
    NSMutableArray *criterias = [NSMutableArray array];

    return criterias;
}

- (CGFloat)distanceBetweenRect:(CGRect)rect andPoint:(CGPoint)point
{
    // first of all, we check if point is inside rect. If it is, distance is zero
    if (CGRectContainsPoint(rect, point)) return 0.f;

    // next we see which point in rect is closest to point
    CGPoint closest = rect.origin;
    if (rect.origin.x + rect.size.width < point.x)
        closest.x += rect.size.width; // point is far right of us
    else if (point.x > rect.origin.x)
        closest.x = point.x; // point above or below us
    if (rect.origin.y + rect.size.height < point.y)
        closest.y += rect.size.height; // point is far below us
    else if (point.y > rect.origin.y)
        closest.y = point.y; // point is straight left or right

    // we've got a closest point; now pythagorean theorem
    // distance^2 = [closest.x,y - closest.x,point.y]^2 + [closest.x,point.y - point.x,y]^2
    // i.e. [closest.y-point.y]^2 + [closest.x-point.x]^2
    CGFloat a = powf(closest.y-point.y, 2.f);
    CGFloat b = powf(closest.x-point.x, 2.f);
    return sqrtf(a + b);
}

@end
