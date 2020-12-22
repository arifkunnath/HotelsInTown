//
//  ListViewCell.m
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import "ListViewCell.h"
#import "AppConstants.h"

@implementation ListViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.textLabel.textColor = [UIColor colorNamed:AppTextColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - Cell UI setup

-(void)configureCellWith:(HotelObject *)hotel_obj{
    self.textLabel.text = hotel_obj.name;

}
@end
