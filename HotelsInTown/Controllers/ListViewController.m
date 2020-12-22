//
//  ListViewController.m
//  HotelsInTown
//
//  Created by Arif Kunnath on 22/12/2020.
//

#import "ListViewController.h"
#import "AppConstants.h"
#import "NetworkManager.h"
#import "CommonFunction.h"
#import "HotelObject.h"
#import "ListViewCell.h"
#import "ReviewListViewController.h"

@interface ListViewController () {
    NSMutableArray* hotelArray;
}
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *tblviewList;
@property (strong, nonatomic) IBOutlet UILabel *lblNoData;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    
    hotelArray = [[NSMutableArray alloc] init];
    
    self.tblviewList.rowHeight = 55;
    
}

#pragma mark - UITableView Datasource & Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return hotelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListViewCell *cell = (ListViewCell *)[tableView dequeueReusableCellWithIdentifier:ListCellIdentifier forIndexPath:indexPath];
    HotelObject* hotel_obj = hotelArray[indexPath.row];
    [cell configureCellWith:hotel_obj];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    HotelObject* hotel_obj = hotelArray[indexPath.row];
    [self showReviewDetailsFor:hotel_obj];
}

#pragma mark - SearchBar Delegates
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    [searchBar resignFirstResponder];
    [self getHotelsLists];

}
#pragma mark - Button actions

- (IBAction)searchButtonAction:(UIBarButtonItem *)sender {
    [self getHotelsLists];
}

#pragma mark - Webservice Related
-(void)getHotelsLists{
    if (_searchBar.text.length > 0) {
        //call webservice
        [CommonFunction showLoaderInViewController:self];
        [[NetworkManager getInstance] getListOfHotelsFor:_searchBar.text Completion:^(BOOL success, id  _Nonnull responseObject, NSError * _Nonnull error) {
            [self->hotelArray removeAllObjects];
            
            if (success && [responseObject isKindOfClass:[NSArray class]]) {
                [self->hotelArray addObjectsFromArray:responseObject];
            }
            else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [CommonFunction showAlertWithTitle:@"" andMessage:error.localizedDescription inViewController:self Completion:^(BOOL dismissed) {
                        
                    }];
                });
               
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [CommonFunction removeLoaderFromViewController:self];
                if (self->hotelArray.count > 0) {
                    self.lblNoData.hidden = TRUE;
                }
                else{
                    self.lblNoData.hidden = FALSE;
                    
                }
                [self.tblviewList reloadData];
            });
            
            
        }];
    }
    else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [CommonFunction showAlertWithTitle:@"" andMessage:@"Please enter a city name and try !" inViewController:self Completion:^(BOOL dismissed) {
                [self.searchBar becomeFirstResponder];
            }];
        });
      
      
    }
    
}


#pragma mark - Navigate to Details
-(void)showReviewDetailsFor:(HotelObject *)hotelObj {
    
    ReviewListViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:reviewListIdentifier];
    vc.selectedHotel = hotelObj;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
