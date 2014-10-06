//
//  realtorCalcViewController.m
//  Realtor Calc
//
//  Created by Matthew Perejda on 6/9/14.
//  Copyright (c) 2014 Matthew Perejda. All rights reserved.
//

#import "realtorCalcViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface realtorCalcViewController ()
- (IBAction)miscCostsExit:(id)sender;
- (IBAction)secondInterestRateExit:(id)sender;
- (IBAction)secondMortgageExit:(id)sender;
- (IBAction)interestRateExit:(id)sender;
- (IBAction)mortgageExit:(id)sender;
- (IBAction)legalFeesExit:(id)sender;
- (IBAction)brokerComisssionExit:(id)sender;
- (IBAction)salePriceExit:(id)sender;
- (IBAction)contactUs:(id)sender;
- (IBAction)calcProfit:(id)sender;
- (IBAction)clearCalc:(id)sender;

@end

@implementation realtorCalcViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView.userInteractionEnabled = TRUE;
    
    self.scrollView.contentSize =CGSizeMake(0, 700);
    
    self.scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    
    self.scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
   
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.scrollView endEditing:YES];
}



- (IBAction)calcProfit:(id)sender {
    
    [_miscCosts resignFirstResponder];

    //Sale Price
    NSString *salePriceString = [_salePrice text];
    
    salePriceString = [[salePriceString stringByReplacingOccurrencesOfString:@"," withString:@""]mutableCopy];
    
    salePriceString = [[salePriceString stringByReplacingOccurrencesOfString:@"$" withString:@""]mutableCopy];
    
    float salePriceFloat = [salePriceString floatValue];
    //
    
   
    
    //Broker Commission
    NSString *brokerComissionString = [_brokerCommission text];
    
    brokerComissionString = [[brokerComissionString stringByReplacingOccurrencesOfString:@"\%" withString:@""]mutableCopy];
    
    float brokerCommissionFloat = ([brokerComissionString floatValue]/100)*salePriceFloat;
    //
    
    //Recording Fees
    NSString *recordsFeesString = [_recordsFees text];
    
    recordsFeesString = [[recordsFeesString stringByReplacingOccurrencesOfString:@"$" withString:@""]mutableCopy];
    
    float recordsFeesFloat = [recordsFeesString floatValue];
    //
    
    //Legal Fees
    NSString *legalFeesString = [_legalFees text];
    
    legalFeesString = [[legalFeesString stringByReplacingOccurrencesOfString:@"$" withString:@""]mutableCopy];
    
    legalFeesString = [[legalFeesString stringByReplacingOccurrencesOfString:@"," withString:@""]mutableCopy];
    
    float legalFeesFloat = [legalFeesString floatValue];
    
    //Mortgage
    NSString *mortgageString = [_mortgage text];
    
    mortgageString = [[mortgageString stringByReplacingOccurrencesOfString:@"," withString:@""]mutableCopy];
    
    mortgageString = [[mortgageString stringByReplacingOccurrencesOfString:@"$" withString:@""]mutableCopy];
    
    float mortgageStringFloat = [mortgageString floatValue];
    //
    
    //Interest Rate
    NSString *interestRateString = [_interestRate text];
    
    interestRateString = [[interestRateString stringByReplacingOccurrencesOfString:@"%" withString:@""]mutableCopy];
    
    float interestRateStringFloat = (mortgageStringFloat*([interestRateString floatValue]/1200));
    
    NSLog(@"#1 %f", interestRateStringFloat);
    //
    
    //Second Mortgage
    NSString *secondMortgageString = [_secondMortgage text];
    
    secondMortgageString = [[secondMortgageString stringByReplacingOccurrencesOfString:@"," withString:@""]mutableCopy];
    
    secondMortgageString = [[secondMortgageString stringByReplacingOccurrencesOfString:@"$" withString:@""]mutableCopy];
    
    float secondMortgageStringFloat = [secondMortgageString floatValue];
    //
    
    //Second Interest Rate
    NSString *secondInterestRateString = [_secondInterestRate text];
    
    secondInterestRateString = [[secondInterestRateString stringByReplacingOccurrencesOfString:@"%" withString:@""]mutableCopy];
    
    float secondInterestRateStringFloat = ((secondMortgageStringFloat*[secondInterestRateString floatValue]/1200));
    
    NSLog(@"#2 %f", secondInterestRateStringFloat);
    //
    
    //Miscellaneous Costs
    NSString *miscCostsString = [_miscCosts text];
    
    miscCostsString = [[miscCostsString stringByReplacingOccurrencesOfString:@"$" withString:@""]mutableCopy];
    
    miscCostsString = [[miscCostsString stringByReplacingOccurrencesOfString:@"," withString:@""]mutableCopy];
    float miscCostsFloat = [miscCostsString floatValue];
    //
    
    //Tax Stamps
    float taxStampsFloat = 4.56*(salePriceFloat/1000);
    //
    
    //Rounding Profit to Integer
    
    float profit = salePriceFloat-mortgageStringFloat-interestRateStringFloat-secondMortgageStringFloat-secondInterestRateStringFloat-brokerCommissionFloat-recordsFeesFloat-legalFeesFloat-miscCostsFloat-taxStampsFloat;
    
    float roundedProfit = (int)roundf ((profit * 100) / 100.0);
    //
    
    //Formatting Profit for Display
    
    NSString *formattedProfit = [NSNumberFormatter localizedStringFromNumber:@(roundedProfit)
                                                         numberStyle:NSNumberFormatterDecimalStyle];
    //
    
    
    NSString *displayProfit = [NSString stringWithFormat: @"Your post-closing profit is $%@", formattedProfit];
    
    self.postClosingProfit.text=displayProfit;
    //
    
    //Formatting Tax Stamps and Display
    
    NSString *formattedTaxStamps = [NSNumberFormatter localizedStringFromNumber:@(taxStampsFloat)
                                                                 numberStyle:NSNumberFormatterDecimalStyle];
    NSString *displayTaxStamps = [NSString stringWithFormat:@"$%@", formattedTaxStamps];
    
    self.taxStampsLabel.text= displayTaxStamps;
    
}

//Link logo to contact page

- (IBAction)miscCostsExit:(id)sender {
    [_miscCosts resignFirstResponder];
}

- (IBAction)secondInterestRateExit:(id)sender {
    [_secondInterestRate resignFirstResponder];
}

- (IBAction)secondMortgageExit:(id)sender {
    [_secondMortgage resignFirstResponder];
}

- (IBAction)interestRateExit:(id)sender {
    [_interestRate resignFirstResponder];
}

- (IBAction)mortgageExit:(id)sender {
    [_mortgage resignFirstResponder];
}

- (IBAction)legalFeesExit:(id)sender {
    [_legalFees resignFirstResponder];
}

- (IBAction)brokerComisssionExit:(id)sender {
    [_brokerCommission resignFirstResponder];
}

- (IBAction)salePriceExit:(id)sender {
    [_salePrice resignFirstResponder];
}

- (IBAction)contactUs:(id)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.liebermanlawoffice.com/mobile.html"]];
};


//Clear calc session
- (IBAction)clearCalc:(id)sender {
    self.salePrice.text=nil;
    self.mortgage.text=nil;
    self.brokerCommission.text=nil;
    self.recordsFees.text=nil;
    self.legalFees.text=nil;
    self.postClosingProfit.text=nil;
    self.miscCosts.text=nil;
    self.secondMortgage.text=nil;
    self.taxStampsLabel.text= @"4.56*(Sale Price)/1000";
    self.interestRate.text=nil;
    self.secondInterestRate.text=nil;
    
}


@end
