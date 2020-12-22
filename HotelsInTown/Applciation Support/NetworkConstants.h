//
//  NetworkConstants.h
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#ifndef NetworkConstants_h
#define NetworkConstants_h

static NSString *hotelListPredicate = @"group == 'HOTEL_GROUP'";

static NSString *hotelListAPIEndPoint = @"/suggest/v1.7/json?locale=en_US&query=";
static NSString *reviewAPIEndPoint = @"/mobile_service/property-content/v1/hotels.com/property/";

static NSString *hotelListAPIEmptyError = @"Hotels are not available for given city !";
static NSString *hotelListAPIError = @"Unable to process the search !";
static NSString *reviewAPIEmptyError = @"0 Reviews !";

#endif /* NetworkConstants_h */
