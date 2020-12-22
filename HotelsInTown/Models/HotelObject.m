//
//  HotelObject.m
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import "HotelObject.h"
#import "CommonFunction.h"
@implementation HotelObject


- (id) initWithDetails :(NSDictionary *)dic
{
    /*
     {
         caption = "<span class='highlighted'>Dubai</span> International Airport Terminal 3 Hotel, Dubai, United Arab Emirates";
         destinationId = 246326;
         geoId = 1100000000000246326;
         landmarkCityDestinationId = "";
         latitude = "25.248473";
         longitude = "55.361756";
         name = "Dubai International Airport Terminal 3 Hotel";
         redirectPage = "DEFAULT_PAGE";
         type = HOTEL;
     }
     */
    if (self = [super init])
    {
        if (![dic isKindOfClass:[NSDictionary class]]) {
            
            return self;
        }
        
        //caption;
        NSString *caption_ = @"";
        if (dic[@"caption"] != (id)[NSNull null] && dic[@"caption"]) {
            caption_ = [NSString stringWithFormat:@"%@", dic[@"caption"]];
        }
        self.caption = caption_;
        
        //destinationId;
        NSString *destinationId_ = @"";
        if (dic[@"destinationId"] != (id)[NSNull null] && dic[@"destinationId"]) {
            destinationId_ = [NSString stringWithFormat:@"%@", dic[@"destinationId"]];
        }
        self.destinationId = destinationId_;
        
        //geoId;
        NSString *geoId_ = @"";
        if (dic[@"geoId"] != (id)[NSNull null] && dic[@"geoId"]) {
            geoId_ = [NSString stringWithFormat:@"%@", dic[@"geoId"]];
        }
        self.geoId = geoId_;
        
        //landmarkCityDestinationId;
        NSString *landmarkCityDestinationId_ = @"";
        if (dic[@"landmarkCityDestinationId"] != (id)[NSNull null] && dic[@"landmarkCityDestinationId"]) {
            landmarkCityDestinationId_ = [NSString stringWithFormat:@"%@", dic[@"landmarkCityDestinationId"]];
        }
        self.landmarkCityDestinationId = landmarkCityDestinationId_;
        
        //latitude;
        NSString *latitude_ = @"";
        if (dic[@"latitude"] != (id)[NSNull null] && dic[@"latitude"]) {
            latitude_ = [NSString stringWithFormat:@"%@", dic[@"latitude"]];
        }
        self.latitude = latitude_;
        
        //longitude;
        NSString *longitude_ = @"";
        if (dic[@"longitude"] != (id)[NSNull null] && dic[@"longitude"]) {
            longitude_ = [NSString stringWithFormat:@"%@", dic[@"longitude"]];
        }
        self.longitude = longitude_;
        
        //name;
        NSString *name_ = @"";
        if (dic[@"name"] != (id)[NSNull null] && dic[@"name"]) {
            name_ = [NSString stringWithFormat:@"%@", dic[@"name"]];
        }
        self.name = name_;
       
    }
    return self;
}


@end
