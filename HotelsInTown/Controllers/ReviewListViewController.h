//
//  ReviewListViewController.h
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import <UIKit/UIKit.h>
#import "HotelObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReviewListViewController : UIViewController
@property(nonatomic, strong) HotelObject* selectedHotel;
@end

NS_ASSUME_NONNULL_END
