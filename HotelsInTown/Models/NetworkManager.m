//
//  NetworkManager.m
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import "NetworkManager.h"
#import "AppConstants.h"
#import "CommonFunction.h"
#import "NetworkConstants.h"
#import "ReviewObject.h"

static NetworkManager *sharedInstance = nil;
@interface NetworkManager()

@end

@implementation NetworkManager


- (id)init
{
    self = [super init];
    if (self) {
     }
    return self;
}


+(NetworkManager *) getInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)getListOfHotelsFor:(NSString *)city Completion:(void (^)(BOOL success,id responseObject, NSError *error))completion{
   
    NSString* urlString = [NSString stringWithFormat:@"https://%@%@%@",[[NSUserDefaults standardUserDefaults] valueForKey:baseURL],hotelListAPIEndPoint,city];
    NSURL* url = [CommonFunction escapedTextUrlFrom:urlString];
    [self commonGETMethodFor:url Completion:^(BOOL success, id responseObject, NSError *error) {
        if (success) {
            NSDictionary* response_null_removed = [CommonFunction dictionaryByReplacingNullsWithStrings:responseObject];
            if (response_null_removed[@"suggestions"] && [response_null_removed[@"suggestions"] isKindOfClass:[NSArray class]]) {
                NSArray * suggestions_array = response_null_removed[@"suggestions"];
                NSPredicate *predicate = [NSPredicate predicateWithFormat:hotelListPredicate];
                NSArray *hotel_groups = [suggestions_array filteredArrayUsingPredicate:predicate];
                if (hotel_groups.count > 0) {
                    NSArray* response_hotel_array = [hotel_groups firstObject][@"entities"];
                    NSMutableArray* list_array = [[NSMutableArray alloc] init];
                    for (NSDictionary * single_dict in response_hotel_array){
                        HotelObject* hotel_object = [[HotelObject alloc] initWithDetails:single_dict];
                        [list_array addObject:hotel_object];
                    }
                    if (list_array.count > 0) {
                        completion(success,list_array,error);
                    }
                    else{
                        NSError *error = [CommonFunction errorFromErrormessage:hotelListAPIEmptyError];
                        completion(FALSE,nil,error);
                    }
                }
                else{
                    NSError *error = [CommonFunction errorFromErrormessage:hotelListAPIEmptyError];
                    completion(FALSE,nil,error);
                }
            }
        }
        else{
            completion(success,responseObject,error);
        }
        
    }];
}

- (void)getReivewForHotel:(HotelObject *)hotel Completion:(void (^)(BOOL success,id responseObject, NSError *error))completion{
    
    NSString* urlString = [NSString stringWithFormat:@"https://%@%@%@/reviews?loc=en_US&page=1",[[NSUserDefaults standardUserDefaults] valueForKey:baseURL],reviewAPIEndPoint,hotel.destinationId];
    NSURL* url = [CommonFunction escapedTextUrlFrom:urlString];
    [self commonGETMethodFor:url Completion:^(BOOL success, id responseObject, NSError *error) {
        if (success) {
            NSDictionary* response_null_removed = [CommonFunction dictionaryByReplacingNullsWithStrings:responseObject];
            if (response_null_removed[@"reviewData"]) {
                NSDictionary * review_data = response_null_removed[@"reviewData"];
                if (review_data[@"guestReviewGroups"]) {
                    NSArray* guest_review_array = review_data[@"guestReviewGroups"][@"guestReviews"];
                    if (guest_review_array) {
                        NSDictionary* first_item = [guest_review_array firstObject];
                        if (first_item) {
                            NSArray* reviews = first_item[@"reviews"];

                            if (reviews) {
                                NSMutableArray* list_array = [[NSMutableArray alloc] init];

                                for (NSDictionary * single_dict in reviews){
                                    ReviewObject* review_object = [[ReviewObject alloc] initWithDetails:single_dict];
                                    [list_array addObject:review_object];
                                }
                                
                                if (list_array.count > 0) {
                                    completion(success,list_array,error);
                                }
                                else{
                                    NSError *error = [CommonFunction errorFromErrormessage:reviewAPIEmptyError];
                                    completion(FALSE,nil,error);
                                }
                                return;
                            }
                        }
                    }
                }
            }
            
            NSError *error = [CommonFunction errorFromErrormessage:reviewAPIEmptyError];
            completion(FALSE,nil,error);
        }
        else{
            completion(success,responseObject,error);
        }
        
    }];
}

#pragma mark - Common Network Methods
-(void)commonGETMethodFor:(NSURL *)url  Completion:(void (^)(BOOL success,id responseObject, NSError *error))completion{
    NSDictionary *headers = @{ @"x-rapidapi-key": [[NSUserDefaults standardUserDefaults] valueForKey:APIKey],
                               @"x-rapidapi-host": [[NSUserDefaults standardUserDefaults] valueForKey:baseURL] };

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                        completion(FALSE,nil,error);
                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                        NSDictionary *serializedData = [NSJSONSerialization JSONObjectWithData: data options:kNilOptions error:nil];
                                                        if ([serializedData isKindOfClass:[NSDictionary class]]) {
                                                            if (httpResponse.statusCode == 200) {
                                                                completion(TRUE,serializedData,nil);
                                                            }
                                                            else{
                                                                if (serializedData[@"message"]) {
                                                                    NSError *error = [CommonFunction errorFromErrormessage:serializedData[@"message"]];
                                                                    completion(FALSE,nil,error);

                                                                }
                                                            }
                                                        }
                                                        else{
                                                            NSError *error = [CommonFunction errorFromErrormessage:hotelListAPIError];
                                                            completion(FALSE,nil,error);
                                                        }
                                                       
                                                    }
                                                }];
    [dataTask resume];
}
@end
