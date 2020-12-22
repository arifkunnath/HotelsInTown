//
//  ReviewObject.m
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import "ReviewObject.h"
#import "CommonFunction.h"

@implementation ReviewObject


- (id) initWithDetails :(NSDictionary *)dic
{
    /*
     {7 items
     "formattedRating":"1.0"
     "postedOn":"1601856000000"
     "qualitativeBadgeText":"Poor"
     "rating":1
     "recommendedBy":""
     "summary":"DONT GO! This place advertises what they dont have. The pictures are photoshopped and the rooms are disgusting! Parking was free and the location was great. The room was disgusting and no update to furniture. Pictures showed remodeled rooms. There were cigarettes in the closet and the toilet did not work. After talking to the front desk about the condition of my room they wouldn't change my room to one that was cleaned. I left with my wife and we were not refunded. We slept in out car in the free parking. "
     "title":""
     }
     */
    if (self = [super init])
    {
        if (![dic isKindOfClass:[NSDictionary class]]) {
            
            return self;
        }
        
        //formattedRating;
        NSString *formattedRating_ = @"";
        if (dic[@"formattedRating"] != (id)[NSNull null] && dic[@"formattedRating"]) {
            formattedRating_ = [NSString stringWithFormat:@"%@", dic[@"formattedRating"]];
        }
        self.formattedRating = formattedRating_;
        
        //postedOn;
        NSString *postedOn_ = @"";
        if (dic[@"postedOn"] != (id)[NSNull null] && dic[@"postedOn"]) {
            postedOn_ = [NSString stringWithFormat:@"%@", dic[@"postedOn"]];
        }
        self.postedOn = postedOn_;
        
        //qualitativeBadgeText;
        NSString *qualitativeBadgeText_ = @"";
        if (dic[@"qualitativeBadgeText"] != (id)[NSNull null] && dic[@"qualitativeBadgeText"]) {
            qualitativeBadgeText_ = [NSString stringWithFormat:@"%@", dic[@"qualitativeBadgeText"]];
        }
        self.qualitativeBadgeText = qualitativeBadgeText_;
        
        //rating;
        NSString *rating_ = @"";
        if (dic[@"rating"] != (id)[NSNull null] && dic[@"rating"]) {
            rating_ = [NSString stringWithFormat:@"%@", dic[@"rating"]];
        }
        self.rating = rating_;
        
        //recommendedBy;
        NSString *recommendedBy_ = @"";
        if (dic[@"recommendedBy"] != (id)[NSNull null] && dic[@"recommendedBy"]) {
            recommendedBy_ = [NSString stringWithFormat:@"%@", dic[@"recommendedBy"]];
        }
        self.recommendedBy = recommendedBy_;
        
        //summary;
        NSString *summary_ = @"";
        if (dic[@"summary"] != (id)[NSNull null] && dic[@"summary"]) {
            summary_ = [NSString stringWithFormat:@"%@", dic[@"summary"]];
        }
        self.summary = summary_;
        
        //title;
        NSString *title_ = @"";
        if (dic[@"title"] != (id)[NSNull null] && dic[@"title"]) {
            title_ = [NSString stringWithFormat:@"%@", dic[@"title"]];
        }
        self.title = title_;
       
    }
    return self;
}


@end
