//
//  ViewController.m
//  ApplePayExample
//
//  Created by JJ on 10/5/14.
//  Copyright (c) 2014 Jay Lei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * This call back method gets call once user's payment is authorized
 */
-(void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didAuthorizePayment:(PKPayment *)payment completion:(void (^)(PKPaymentAuthorizationStatus))completion
{
    NSLog(@"Payment is authorized");
}

/*
 * This call back method gets call once the authorize payment is completed
 */
-(void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller
{
    NSLog(@"payment authorize did finish");
}

/*
 * Invoke this button event to when user wants to do apple pay
 */
-(IBAction)handlesApplePay:(id)sender
{
    @try {
        PKPaymentSummaryItem *paymentSummary = [PKPaymentSummaryItem summaryItemWithLabel:@"Credit Card" amount:[NSDecimalNumber decimalNumberWithString:@"20.00"]];
        
        NSArray *summaryItem = [[NSArray alloc] initWithObjects:paymentSummary, nil];
        NSArray *supportPaymentType = [[NSArray alloc] initWithObjects:PKPaymentNetworkAmex, PKPaymentNetworkMasterCard, PKPaymentNetworkVisa, nil];
        
        PKPaymentRequest *paymentRequest = [[PKPaymentRequest alloc]init];
        paymentRequest.merchantIdentifier = @"merchant.com.ApplePay";
        paymentRequest.paymentSummaryItems = summaryItem;
        paymentRequest.countryCode = @"EN";
        paymentRequest.currencyCode = @"USD";
        paymentRequest.supportedNetworks = supportPaymentType;
        paymentRequest.merchantCapabilities = PKMerchantCapabilityEMV;
        
        PKPaymentAuthorizationViewController *paymentAuthController = [[PKPaymentAuthorizationViewController alloc]initWithPaymentRequest:paymentRequest];
        paymentAuthController.delegate = self;
        
        [self presentViewController:paymentAuthController animated:YES completion:nil];
    }
    @catch (NSException *exception) {
        
    }

    
}

@end
