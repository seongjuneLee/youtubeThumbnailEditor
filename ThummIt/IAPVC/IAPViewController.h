//
//  IAPViewController.h
//  ThummIt
//
//  Created by 이성준 on 2021/03/10.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
NS_ASSUME_NONNULL_BEGIN
#define PRODUCT_ID @"thummitSubcribe"

@interface IAPViewController : UIViewController <SKProductsRequestDelegate,SKPaymentTransactionObserver>

@property (strong, nonatomic) SKProductsRequest *productsRequest;
@property (strong, nonatomic) NSArray *validProducts;

@property (weak, nonatomic) IBOutlet UILabel *productTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *productDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *purchaseButton;
@property (weak, nonatomic) IBOutlet UIButton *restorePurchaseButton;


- (void)fetchAvailableProducts;
- (BOOL)canMakePurchases;
- (void)purchaseMyProduct:(SKProduct*)product;

- (IBAction)subscribeButtonTapped:(id)sender;
- (IBAction)restoreButtonTapped:(id)sender;

@end

NS_ASSUME_NONNULL_END
 
