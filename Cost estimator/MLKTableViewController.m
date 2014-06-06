//
//  MLKTableViewController.m
//  Cost estimator
//
//  Created by Michael Kosmicki on 5/28/14.
//  Copyright (c) 2014 ___kozi___. All rights reserved.
//

#import "MLKTableViewController.h"
#import "MLKJob.h"

@interface MLKTableViewController ()
@property (strong, nonatomic) NSMutableArray *jobs;
@end

@implementation MLKTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.jobs = [NSKeyedUnarchiver unarchiveObjectWithFile:self.resourcePath];
    if (!self.jobs) {
        self.jobs = [[NSMutableArray alloc] init];
    
}
}

- (NSString *)resourcePath {
    return [NSBundle.mainBundle.resourcePath  stringByAppendingPathComponent:@"jobs"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"AddNewSegue"]) {
        MLKViewController *vc = (MLKViewController *)segue.destinationViewController;
        vc.delegate = self;
    }
    if ([[segue identifier] isEqualToString:@"EditSegue"]) {
        MLKViewController *vc = (MLKViewController *)segue.destinationViewController;
       // vc.job = ;
       //need to pass job in detail view controller
        
    }
    
   
}
- (void)createJob:(NSString *)job withTotalLabel:(UILabel *)totalLabel {
    MLKJob *item = [[MLKJob alloc] init];
    item.projectTitle = job;
    [self.jobs addObject:item];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"projectTitle" ascending:YES];
    [self.jobs sortUsingDescriptors:@[sortDescriptor]];
    
    [NSKeyedArchiver archiveRootObject:self.jobs toFile:self.resourcePath];
    
    [self.tableView reloadData];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)updateJob:(NSString *)job withTotalLabel:(UILabel *)totalLabel atRow:(NSUInteger)row {
    
    MLKJob *item = [[MLKJob alloc] init];
    item.projectTitle = job;
    [self.jobs replaceObjectAtIndex:row withObject:item];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"dueDate" ascending:YES];
    [self.jobs sortUsingDescriptors:@[sortDescriptor]];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *jobData = [NSKeyedArchiver archivedDataWithRootObject:self.jobs];
    [userDefaults setObject:jobData forKey:@"jobs"];
    [userDefaults synchronize];
    
    
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
    
}



- (void)didReceiveMemoryWarning
{
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
    return self.jobs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier =@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    MLKJob *job = self.jobs[indexPath.row];
    cell.textLabel.text = job.projectTitle;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.jobs removeObjectAtIndex:indexPath.row];
        
        [NSKeyedArchiver archiveRootObject:self.jobs toFile:self.resourcePath];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
