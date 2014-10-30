//
//  DIADishListViewController.m
//  Diahelper
//
//  Created by Victoria Globa on 10/30/14.
//

#import "DIADishListViewController.h"
#import "DIAChooseDishViewController.h"
#import "DIADish.h"

@interface DIADishListViewController ()
@end

@implementation DIADishListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dishes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DishCell" forIndexPath:indexPath];
    
    DIADish* dish = self.dishes[indexPath.row];
    cell.textLabel.text = dish.name;
    
    return cell;
}

#pragma mark - 

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ChooseDishViewControllerSegue"])
    {
        NSIndexPath* indexPath = self.tableView.indexPathForSelectedRow;

        if (indexPath.row < self.dishes.count)
        {
            NSAssert3([segue.destinationViewController isKindOfClass:[DIAChooseDishViewController class]], @"%@ expected for %@ from %@", NSStringFromClass([DIAChooseDishViewController class]), segue.identifier, NSStringFromClass([self class]));
            DIAChooseDishViewController* destinationViewController = segue.destinationViewController;
            destinationViewController.dish = self.dishes[indexPath.row];
        }
    }
}

@end
