//
//  ReviewViewCell.h
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import <UIKit/UIKit.h>
#import "ReviewObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReviewViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblComment;

-(void)configureCellWith:(ReviewObject *)rev_obj;
@end

NS_ASSUME_NONNULL_END
