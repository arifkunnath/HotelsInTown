//
//  ListViewCell.h
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import <UIKit/UIKit.h>
#import "HotelObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListViewCell : UITableViewCell


-(void)configureCellWith:(HotelObject *)hotel_obj;

@end

NS_ASSUME_NONNULL_END
