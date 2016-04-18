//
//  FNAliPay.m
//  Pods
//
//  Created by Allen on 16/4/13.
//
//

#import "FNAliPay.h"
#import <AlipaySDK/AlipaySDK.h>

@interface FNAliPay ()
@property (nonatomic, copy) NSString *scheme;
@property (nonatomic, copy) FNAliPayCompletion completion;
@end

@implementation FNAliPay

+ (FNAliPay *)shareManager {
    static FNAliPay *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[FNAliPay alloc]init];
    });
    return manager;
}

- (void)createPayWithParaModel:(FNAliPayParaModel *)paraModel completion:(FNAliPayCompletion)completion {
    self.scheme = paraModel.aliPaySchema;
    __weak typeof (self) weakself = self;
    [[AlipaySDK defaultService] payOrder:paraModel.orderInfo fromScheme:self.scheme callback:^(NSDictionary *resultDic) {
        [weakself handleAliPayWithResultDic:resultDic];
    }];
}


- (void)handleOpenURL:(NSURL *)URL {
    NSString *scheme = URL.scheme;
    if ([scheme isEqualToString:self.scheme])
    {
        if ([[URL host] compare:@"safepay"] == NSOrderedSame || [[URL host] compare: @"alipay"] == NSOrderedSame)
        {
            __weak typeof(self) weakSelf = self;
            [[AlipaySDK defaultService] processOrderWithPaymentResult:URL standbyCallback:^(NSDictionary *resultDic) {
                [weakSelf handleAliPayWithResultDic:resultDic];
            }];
        }
    }

}


- (void)handleAliPayWithResultDic:(NSDictionary *)resultDic
{
    FNAliPayResultModel *resultModel = [FNAliPayResultModel new];
    resultModel.resultInfo = resultDic;
    NSInteger resultStatusCode = [[resultDic objectForKey:@"resultStatus"] integerValue];
    if (resultStatusCode == 9000 || resultStatusCode == 9001) {
        resultModel.success = YES;
    } else {
        resultModel.success = NO;
    }
    if (_completion) {
        _completion(resultModel);
    }
}

@end
