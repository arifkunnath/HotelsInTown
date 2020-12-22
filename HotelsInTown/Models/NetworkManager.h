//
//  NetworkManager.h
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import <Foundation/Foundation.h>
#import "HotelObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+(NetworkManager *) getInstance;


- (void)getListOfHotelsFor:(NSString *)city Completion:(void (^)(BOOL success,id responseObject, NSError *error))completion;
- (void)getReivewForHotel:(HotelObject *)hotel Completion:(void (^)(BOOL success,id responseObject, NSError *error))completion;
@end

NS_ASSUME_NONNULL_END
