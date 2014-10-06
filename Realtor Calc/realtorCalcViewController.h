//
//  realtorCalcViewController.h
//  Realtor Calc
//
//  Created by Matthew Perejda on 6/9/14.
//  Copyright (c) 2014 Matthew Perejda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface realtorCalcViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *secondInterestRate;
@property (weak, nonatomic) IBOutlet UITextField *interestRate;
@property (weak, nonatomic) IBOutlet UITextField *secondMortgage;
@property (weak, nonatomic) IBOutlet UITextField *mortgage;

@property (weak, nonatomic) IBOutlet UILabel *taxStampsLabel;
@property (weak, nonatomic) IBOutlet UITextField *salePrice;
@property (weak, nonatomic) IBOutlet UITextField *brokerCommission;
@property (weak, nonatomic) IBOutlet UITextField *legalFees;
@property (weak, nonatomic) IBOutlet UITextField *recordsFees;
@property (weak, nonatomic) IBOutlet UITextField *miscCosts;
@property (weak, nonatomic) IBOutlet UILabel *postClosingProfit;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end
