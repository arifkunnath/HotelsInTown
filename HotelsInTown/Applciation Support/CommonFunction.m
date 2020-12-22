//
//  CommonFunction.m
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import "CommonFunction.h"
static CommonFunction *sharedInstance = nil;

@interface CommonFunction()
@end

@implementation CommonFunction


+(CommonFunction *) getInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CommonFunction alloc] init];
    });
    return sharedInstance;
}



+(NSError*)errorFromErrormessage:(NSString*)errorMessage
{
    NSMutableDictionary* userInfo = [NSMutableDictionary dictionary];
    
    
    [userInfo setValue:errorMessage forKey:NSLocalizedDescriptionKey];
    
    NSError *error1=[[NSError alloc] initWithDomain:@"" code:0 userInfo:userInfo];
    return error1;
}


+(NSMutableDictionary *) dictionaryByReplacingNullsWithStrings:(id)dict {
    
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary: dict];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for (NSString *key in dict) {
        const id object = [dict objectForKey: key];
        if (object == nul || [object isKindOfClass:[NSNull class]]) {
            [replaced setObject: blank forKey: key];
        }
        
        else if ([object isKindOfClass: [NSArray class]]) {
            
            [replaced setObject: [self arrayByReplacingNullsWithStrings:object] forKey: key];
            
        }
        else if ([object isKindOfClass: [NSDictionary class]]) {
            [replaced setObject: [self dictionaryByReplacingNullsWithStrings:object] forKey: key];
        }
    }
    return replaced;
}

+(NSMutableArray *)arrayByReplacingNullsWithStrings:(id)sourceArray
{
    
    NSMutableArray *replaced = [[NSMutableArray alloc] initWithArray:sourceArray];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    int cnt = 0;
    for (id  key in sourceArray) {
        
        if ([key isKindOfClass:[NSDictionary class]])
        {
            [replaced replaceObjectAtIndex:[replaced indexOfObject:key] withObject:[self dictionaryByReplacingNullsWithStrings:key]];
        }
        else if (key == nul || [key isKindOfClass:[NSNull class]])
        {
            [replaced replaceObjectAtIndex:cnt withObject:blank];
        }
        else if ([key isKindOfClass: [NSArray class]])
        {
            [replaced replaceObjectAtIndex:[replaced indexOfObject:key] withObject:[self arrayByReplacingNullsWithStrings:key]];
        }
        
        cnt++;
    }
    
    return replaced;
}

+(void)removeLoaderFromViewController:(UIViewController*)vc
{
    [MBProgressHUD hideHUDForView:vc.view animated:YES];
}

+(void)showLoaderInViewController:(UIViewController*)vc
{
    
    [MBProgressHUD showHUDAddedTo:vc.view animated:YES];
    
}

+(void)showAlertWithTitle:(NSString *)titleStr andMessage:(NSString *)msgStr inViewController:(UIViewController *)vc Completion:(void (^)(BOOL dismissed))completion{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:titleStr
                               message:msgStr
                               preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
        completion(TRUE);
    }];

    [alert addAction:defaultAction];
    [vc presentViewController:alert animated:YES completion:nil];
}
+(NSURL *)escapedTextUrlFrom:(NSString *)urlstr{
    NSString* urlTextEscaped = [urlstr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL* url = [NSURL URLWithString:urlTextEscaped];
    return url;
}

+(NSString *)formattedDateFor:(NSString *)time_stamp withDateFormat:(NSString *)date_formatter{
    double timeStamp = [time_stamp doubleValue];
    NSTimeInterval timeInterval = timeStamp/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:date_formatter];//@"dd-MM-yyyy"
    NSString *dateString = [dateformatter stringFromDate:date];
    return dateString;
}

@end
