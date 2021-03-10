//
//  IAPViewController.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/10.
//

#import "IAPViewController.h"

@interface IAPViewController ()

@end

@implementation IAPViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self fetchAvailableProducts];

}

-(void)fetchAvailableProducts {
    NSSet *productIdentifiers = [NSSet setWithObjects:PRODUCT_ID,nil];
    self.productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
    self.productsRequest.delegate = self;
    [self.productsRequest start];
}

- (BOOL)canMakePurchases {
    return [SKPaymentQueue canMakePayments];
}

- (void)purchaseMyProduct:(SKProduct*)product {
    if ([self canMakePurchases]) {
        SKPayment *payment = [SKPayment paymentWithProduct:product];
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.view makeToast:@"Purchased" duration:3.0 position:CSToastPositionCenter];
        });
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.view makeToast:@"Purchases are disabled in your device" duration:3.0 position:CSToastPositionCenter];
        });
    }
}

#pragma mark StoreKit Delegate

-(void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    
    [self.view makeToastActivity:CSToastPositionCenter];
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchasing:
                NSLog(@"Purchasing");
                break;
                
            case SKPaymentTransactionStatePurchased:
                if ([transaction.payment.productIdentifier isEqualToString:PRODUCT_ID]) {
                    NSLog(@"Purchase is completed succesfully");
                    [self.view makeToast:@"AD has removed" duration:3.0 position:CSToastPositionCenter];
                    [self dismissViewControllerAnimated:true completion:nil];
                    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                }
                break;
                
            case SKPaymentTransactionStateRestored:
                NSLog(@"Restored ");
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
                
            case SKPaymentTransactionStateFailed:
                NSLog(@"Purchase failed ");
                break;
                
            default:
                break;
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.view hideAllToasts];
    });
}

-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    SKProduct *validProduct = nil;
    NSUInteger count = [response.products count];
    NSLog(@"request %@",request);
    if (count > 0) {
        self.validProducts = response.products;
        validProduct = [response.products objectAtIndex:0];
        
        if ([validProduct.productIdentifier
             isEqualToString:PRODUCT_ID]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.productTitleLabel setText:validProduct.localizedTitle];
                [self.productDescriptionLabel setText:validProduct.localizedDescription];
                NSString *priceString = [NSString stringWithFormat:@"구매 ($%@)",validProduct.price];
                self.productPriceLabel.text = priceString;
                
            });
        }
    } else {
        // 아이튠즈커넥트에서 계약 및 세금 금융 거래 항목을 작성하지 않아 발생됐음.
        NSLog(@"No products to purchase");
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view makeToast:@"No products to purchase" duration:3.0 position:CSToastPositionCenter];
            self.purchaseButton.hidden = YES;
            self.restorePurchaseButton.hidden = YES;
        });
        
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.purchaseButton.hidden = NO;
        self.restorePurchaseButton.hidden = NO;
    });
    
}


- (IBAction)restoreButtonTapped:(id)sender {
    
    [self.view makeToast:@"No additional charge if you have aleady subscribed." duration:3.0 position:CSToastPositionCenter];

    if (self.validProducts != nil) {
        [self purchaseMyProduct:[self.validProducts objectAtIndex:0]];
    }

}

- (IBAction)subscribeButtonTapped:(UIButton *)sender {
    
    if (self.validProducts != nil) {
        [self purchaseMyProduct:[self.validProducts objectAtIndex:0]];
    }

}
@end
