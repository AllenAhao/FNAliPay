//
//  FNAliPayResultModel.h
//  Pods
//
//  Created by Allen on 16/4/13.
//
//

#import <Foundation/Foundation.h>

@interface FNAliPayResultModel : NSObject

/**
 *  支付是否成功
 */
@property (nonatomic, assign) BOOL success;

/**
 *  支付返回的result 信息
 */
@property (nonatomic, strong) id resultInfo;


@end
