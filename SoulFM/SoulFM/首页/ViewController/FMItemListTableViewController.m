//
//  FMItemListTableViewController.m
//  SoulFM
//
//  Created by lijinghua on 15/12/19.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMItemListTableViewController.h"
#import "FMItemListTableViewCell.h"
#import "HotFMModel.h"
#import "FMContentViewController.h"

@interface FMItemListTableViewController ()<FMNetEngineDelegate>
@property(nonatomic)NSMutableArray *itemListArray;
@end

@implementation FMItemListTableViewController


- (id)initWithCategory:(FMCategoryType)type
{
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //注册单元格
    UINib *nib = [UINib nibWithNibName:@"FMItemListTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cellId"];
    
    [self fetchNetData];
}

- (void)fetchNetData
{
    FMNetEngine *netEngine = [[FMConfigration sharedInstance] configrationOfKey:kFMItemListDataEngine];
    netEngine.delegate = self;
    [netEngine setRequestValue:@(self.type)    forKey:@"categoryType"];
    [netEngine setRequestValue:self.model.id   forKey:@"typeId"];
    [netEngine setRequestValue:@(0)            forKey:@"pageNo"];
    [netEngine setRequestValue:self.model.name forKey:@"modelName"];
    [netEngine fetchNetworkData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - FMNetEngineDelegate
- (void)netEngine:(FMNetEngine*)engine dataSource:(id)dataSource
{
    self.itemListArray = dataSource;
    [self.tableView reloadData];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemListArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FMItemListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    HotFMModel *model = [self.itemListArray objectAtIndex:indexPath.row];
    [cell updateWithModel:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FMContentViewController *contentViewController = [FMContentViewController sharedInstance];
    contentViewController.hidesBottomBarWhenPushed = YES;
    contentViewController.modelArray   = self.itemListArray;
    contentViewController.currentIndex = indexPath.row;
    [self.navigationController pushViewController:contentViewController animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
