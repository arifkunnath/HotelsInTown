//
//  ReviewObject.h
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReviewObject : NSObject

@property (nonatomic, retain) NSString *formattedRating;
@property (nonatomic, retain) NSString *postedOn;
@property (nonatomic, retain) NSString *qualitativeBadgeText;
@property (nonatomic, retain) NSString *rating;
@property (nonatomic, retain) NSString *recommendedBy;
@property (nonatomic, retain) NSString *summary;
@property (nonatomic, retain) NSString *title;

- (id) initWithDetails :(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
