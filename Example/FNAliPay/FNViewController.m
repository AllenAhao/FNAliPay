//
//  FNViewController.m
//  FNAliPay
//
//  Created by Allen on 04/13/2016.
//  Copyright (c) 2016 Allen. All rights reserved.
//

#import "FNViewController.h"
#import "FNALiPay.h"
#import "FNAliPayParaModel.h"
#import "FNAliPayResultModel.h"

static NSString *korderInfo = @"partner=\"2088501566833063\"&seller_id=\"chenglianshiye@yeah.net\"&out_trade_no=\"201601090959014\"&subject=\"BMW X6\"&body=\"测试\"&total_fee=\"0.01\"&notify_url=\"http://app.cheguchina.com/wash/unionpay/mobilenotify\"&service=\"mobile.securitypay.pay\"&payment_type=\"1\"&_input_charset=\"utf-8\"&it_b_pay=\"30m\"&show_url=\"m.alipay.com\"&sign=\"LifTzpGUeyqxwhebmuSlBzyj8RkBTk25nGp8%2F9Z9kI2syNwM2OMbyKlXccLAkaU%2Bw6lvBYQDUzSuafyf1cSNIZtA7g5Mx6NSUhEeIteELKrVM68KIvQaypqQ86cyHUPzQgCY9RMM3Cua30hdHNrtUxj7APdE%2BymzyKoZVEKyevY%3D\"&sign_type=\"RSA\"";
@interface FNViewController ()

@end

@implementation FNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)payButton:(UIButton *)sender {
    FNAliPayParaModel *paraModel = [FNAliPayParaModel new];
    paraModel.aliPaySchema = @"";
    paraModel.orderInfo = korderInfo;
    [[FNAliPay shareManager] createPayWithParaModel:paraModel completion:^(FNAliPayResultModel *result) {
        
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
