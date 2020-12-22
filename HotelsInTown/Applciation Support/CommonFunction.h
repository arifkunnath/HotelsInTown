//
//  CommonFunction.h
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommonFunction : NSObject
+(CommonFunction *) getInstance;

+(NSError*)errorFromErrormessage:(NSString*)errorMessage;
+(NSMutableDictionary *) dictionaryByReplacingNullsWithStrings:(id)dict;
+(NSMutableArray *)arrayByReplacingNullsWithStrings:(id)sourceArray;
+(void)removeLoaderFromViewController:(UIViewController*)vc;
+(void)showLoaderInViewController:(UIViewController*)vc;
+(void)showAlertWithTitle:(NSString *)titleStr andMessage:(NSString *)msgStr inViewController:(UIViewController *)vc Completion:(void (^)(BOOL dismissed))completion;
+(NSURL *)escapedTextUrlFrom:(NSString *)urlstr;
+(NSString *)formattedDateFor:(NSString *)time_stamp withDateFormat:(NSString *)date_formatter;
@end

NS_ASSUME_NONNULL_END
