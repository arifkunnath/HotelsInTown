//
//  HotelObject.h
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HotelObject : NSObject

@property (nonatomic, retain) NSString *caption;
@property (nonatomic, retain) NSString *destinationId;
@property (nonatomic, retain) NSString *geoId;
@property (nonatomic, retain) NSString *landmarkCityDestinationId;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *longitude;
@property (nonatomic, retain) NSString *name;

- (id) initWithDetails :(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
