//
//  DIAChooseDishViewController.m
//  Diahelper
//
//  Created by Victoria Globa on 10/30/14.
//

#import "DIAChooseDishViewController.h"
#import "DIADish.h"

@interface DIAChooseDishViewController ()

@property (nonatomic, strong) IBOutlet UILabel* tmpLabel;

@end

@implementation DIAChooseDishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureInterfaceForChangedDish];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDish:(DIADish *)dish
{
    if (_dish != dish)
    {
        _dish = dish;
        self.title = dish.name;
        [self configureInterfaceForChangedDish];
    }
}

- (void)configureInterfaceForChangedDish
{
    self.tmpLabel.text = self.dish.name;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
