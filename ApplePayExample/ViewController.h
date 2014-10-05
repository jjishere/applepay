//
//  ViewController.h
//  ApplePayExample
//
//  Created by JJ on 10/5/14.
//  Copyright (c) 2014 Jay Lei. All rights reserved.
//  Site: www.appsharenow.com
//

#import <UIKit/UIKit.h>
#import <PassKit/PassKit.h>


@interface ViewController : UIViewController<PKPaymentAuthorizationViewControllerDelegate>


/*
 * Button events
 */
-(IBAction)handlesApplePay:(id)sender;

@end

