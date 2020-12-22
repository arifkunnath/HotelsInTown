//
//  ReviewListViewController.m
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import "ReviewListViewController.h"
#import "NetworkManager.h"
#import "CommonFunction.h"
#import "ReviewViewCell.h"
#import "ReviewObject.h"
#import "AppConstants.h"


@interface ReviewListViewController () {
    NSMutableArray* reviewArray;
}
@property (strong, nonatomic) IBOutlet UITableView *tblviewReviewList;
@property (strong, nonatomic) IBOutlet UILabel *lblNoData;

@end

@implementation ReviewListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = _selectedHotel.name;
    
    reviewArray = [[NSMutableArray alloc] init];
    
    [self getReviewDetails];
}

#pragma mark - Webservice Related
-(void)getReviewDetails{
    
    [CommonFunction showLoaderInViewController:self];
    [[NetworkManager getInstance] getReivewForHotel:_selectedHotel Completion:^(BOOL success, id  _Nonnull responseObject, NSError * _Nonnull error) {
        if (success && [responseObject isKindOfClass:[NSArray class]]) {
            [self->reviewArray addObjectsFromArray:responseObject];
        }
        else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [CommonFunction showAlertWithTitle:@"" andMessage:error.localizedDescription inViewController:self Completion:^(BOOL dismissed) {
                    [self.navigationController popViewControllerAnimated:true];
                }];
            });
           
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [CommonFunction removeLoaderFromViewController:self];
            [self.tblviewReviewList reloadData];
        });
    }];
    
}



#pragma mark - UITableView Datasource & Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return reviewArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ReviewViewCell *cell = (ReviewViewCell *)[tableView dequeueReusableCellWithIdentifier:reviewCellIdentifier forIndexPath:indexPath];
    ReviewObject* rev_obj = reviewArray[indexPath.row];
    [cell configureCellWith:rev_obj];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    
}
@end
