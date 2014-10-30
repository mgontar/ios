//
//  DIACategoryListViewController.m
//  Diahelper
//
//  Created by Victoria Globa on 10/30/14.
//

#import "DIACategoryListViewController.h"
#import "DIADishListViewController.h"
#import "DIADish.h"

@interface DIACategoryListViewController ()

@end

@implementation DIACategoryListViewController

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

#pragma mark - 

- (NSUInteger)numberOfCategories
{
    return 1;
}

- (NSString*)nameForCategoryAtIndex:(NSUInteger)index
{
    return NSLocalizedString(@"Favorite Dishes", @"Favorites category name");
}

- (NSArray*)dishesForCategoryAtIndex:(NSUInteger)index
{
    DIADish* dish1 = [DIADish new];
    dish1.name = @"Apple";
    
    DIADish* dish2 = [DIADish new];
    dish2.name = @"Bread";
    
    DIADish* dish3 = [DIADish new];
    dish3.name = @"Milk";

    return @[dish1, dish2, dish3];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self numberOfCategories];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self nameForCategoryAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - 

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DishListViewControllerSegue"])
    {
        NSIndexPath* indexPath = self.tableView.indexPathForSelectedRow;
        
        if (indexPath.row < [self numberOfCategories])
        {
            NSAssert3([segue.destinationViewController isKindOfClass:[DIADishListViewController class]], @"%@ expected for %@ from %@", NSStringFromClass([DIADishListViewController class]), segue.identifier, NSStringFromClass([self class]));
            DIADishListViewController* destinationViewController = segue.destinationViewController;

            NSArray* dishes = [self dishesForCategoryAtIndex:indexPath.row];
            destinationViewController.dishes = dishes;
        }
    }
}

@end
