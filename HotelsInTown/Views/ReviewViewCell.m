//
//  ReviewViewCell.m
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import "ReviewViewCell.h"
#import "CommonFunction.h"

@implementation ReviewViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellWith:(ReviewObject *)rev_obj{
    
    self.lblComment.text = rev_obj.summary;
    if (rev_obj.title.length > 0) {
        self.lblTitle.text = rev_obj.title;
    }
    else{
        self.lblTitle.text = @"-";
    }
    
    if (rev_obj.recommendedBy.length > 0) {
        self.lblName.text = rev_obj.recommendedBy;
    }
    else{
        self.lblName.text = @"Unknown User";
    }
  
    self.lblDate.text = [CommonFunction formattedDateFor:rev_obj.postedOn withDateFormat:@"dd-MMM-yy"];
    
}
@end
