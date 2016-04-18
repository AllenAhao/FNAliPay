//
//  FNAliPay.h
//  Pods
//
//  Created by Allen on 16/4/13.
//
//

#import <Foundation/Foundation.h>
#import "FNAliPayParaModel.h"
#import "FNAliPayResultModel.h"

typedef void(^FNAliPayCompletion)(FNAliPayResultModel *result);

@interface FNAliPay : NSObject

+ (FNAliPay *)shareManager;

/**
 *  支付宝支付调用接口
 *
 *  @param paraModel  传入参数
 *  @param completion 返回结果
 */
- (void)createPayWithParaModel:(FNAliPayParaModel *)paraModel completion:(FNAliPayCompletion)completion;
/**
 *  需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用。
 *
 *  @param URL
 */
- (void)handleOpenURL:(NSURL *)URL;

@end
