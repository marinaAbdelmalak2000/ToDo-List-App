//
//  ViewControllerTODoList.m
//  WorkShop_ToDoList
//
//  Created by Marina on 26/04/2023.
//

#import "ViewControllerTODoList.h"
#import "ViewControllerAdd.h"
#import "AddProtocol.h"
#import "Task.h"
#import "ViewControllerDetails.h"

@interface ViewControllerTODoList ()


@property NSMutableArray *data;

@property (strong, nonatomic) IBOutlet UITableView *myTable;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation ViewControllerTODoList

- (void)viewDidLoad {
    [super viewDidLoad];
   
        _myTable.delegate =self;
        _myTable.dataSource = self;
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addTask)];
        self.navigationItem.rightBarButtonItem = addButton;

        
        NSData *tasksData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tasks"];
        if (tasksData) {
        self.arrayTask = [NSKeyedUnarchiver unarchiveObjectWithData:tasksData];
        } else {
        self.arrayTask = [NSMutableArray new];
        }
        self.searchBar.delegate = self;
        _myTable.tableHeaderView = self.searchBar;
        self.searchResults = [NSMutableArray arrayWithCapacity:self.arrayTask
        .count];
        printf("didddddddddddddd");

    
    
 
  
    
    [_myTable reloadData];

}
    -(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
        
        self.arrayTask = [NSMutableArray new];
    printf("willlllllllllllllllllllllllllllllll");
        
        NSData *tasksData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tasks"];
        _arrayTask =[NSKeyedUnarchiver unarchiveObjectWithData:tasksData];
     
        
        
        self.arrayTaskToDo=[NSMutableArray new];
        
        for(int i =0; i< [_arrayTask count];i++){
            if([_arrayTask[i].status isEqual:@"0"]){
                [_arrayTaskToDo addObject:_arrayTask[i]];
            }
        }

    [_myTable reloadData];

        
    }

    -(void)addTask{
        
        ViewControllerAdd *add=[self.storyboard instantiateViewControllerWithIdentifier:@"add"];
        
        add.ref=self;
        
        [self.navigationController pushViewController:add animated:YES];
        [_myTable reloadData];
    }



    -(void) addTask : (Task* ) task{
        if(_arrayTask!=nil){
            [_arrayTask addObject:task];
        }else{
            _arrayTask = [NSMutableArray new];
            [_arrayTask addObject:task];
        }
   
        NSData *tasksData = [NSKeyedArchiver archivedDataWithRootObject:self.arrayTask];
        [[NSUserDefaults standardUserDefaults] setObject:tasksData forKey:@"tasks"];
        [[NSUserDefaults standardUserDefaults] synchronize];
            
          
            [_myTable reloadData];
        
      /*  if([task.status isEqualToString:@"0"]){
        //    [_arrayTaskToDo addObject:task];
            printf("toDo");
        }
        else if([task.status isEqualToString:@"1"]){
            [_arrayTaskProgress addObject:task];
            printf("Progress");
            NSData *tasksData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tasksProgress"];
            if (tasksData) {
            self.arrayTaskProgress = [NSKeyedUnarchiver unarchiveObjectWithData:tasksData];
            } else {
            self.arrayTaskProgress = [NSMutableArray new];
            }
        }else{
            [_arrayTaskDone addObject:task];
            printf("Done");
        }*/

    }
    #pragma mark - Table view data source

    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    #warning Incomplete implementation, return the number of sections
    return 1;
    }

    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    #warning Incomplete implementation, return the number of rows
        if (self.searchBar.text.length > 0) {
        return self.searchResults.count;
        } else {
        return _arrayTaskToDo.count;

        }
      

    }


    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellToDo" forIndexPath:indexPath];

    // Configure the cell...
        Task *task ;
        if (self.searchBar.text.length > 0) {
        task = [_searchResults objectAtIndex:indexPath.row];
        cell.textLabel.text = task.titleTask;
        } else {
        task = [_arrayTaskToDo objectAtIndex:indexPath.row];
        cell.textLabel.text = task.titleTask;
          /*  if([task.propirty isEqualToString:@"low"]){
                cell.imageView.image = [UIImage imageNamed:@"g.png"];
            }else if([task.propirty isEqualToString:@"mid"]){
                cell.imageView.image = [UIImage imageNamed:@"y.png"];
            }else{
                cell.imageView.image = [UIImage imageNamed:@"r.png"];
            }*/
           
            cell.imageView.image = [UIImage imageNamed:task.image];
        }

        return cell;

    return cell;
    }

    -(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    if (searchText.length > 0) {
    self.searchResults = [NSMutableArray new];
    for (Task *task in _arrayTask) {
    NSRange nameRange = [task.titleTask rangeOfString:searchText options:NSCaseInsensitiveSearch];
    if (nameRange.location != NSNotFound) {
    [_searchResults addObject:task];
    }
    }
    } else {
    self.searchResults = nil;
    }

    [_myTable reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        
        printf("Selecttttttttttttttttt");
    ViewControllerDetails *details = [self.storyboard instantiateViewControllerWithIdentifier:@"details"];

        Task *task =[_arrayTaskToDo objectAtIndex:indexPath.row];

    /*    details.inputTitle= task.titleTask;
        details.inputDescription=task.descriptionTask;
        details.inputDate=task.dateTask;
        
        details.inputPropirty=task.propirty;
        
        details.inputStatus=task.status;*/
    
    
        details.index=indexPath.row;
    details.myTask = [_arrayTaskToDo objectAtIndex:indexPath.row];
    
        printf("Detaillls::::::: %S",[task.titleTask UTF8String]);

    [self.navigationController pushViewController:details animated:YES];
        
    }



    /*
    // Override to support conditional editing of the table view.
    - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
    }
    */


    // Override to support editing the table view.
    - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        UIAlertController *alertFaild=[UIAlertController alertControllerWithTitle:@"Delete" message:@"you are sure delete this item" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:NULL];
        
        UIAlertAction *actionTry = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            // Delete the row from the data source
            [self.arrayTaskToDo removeObjectAtIndex:indexPath.row];
            [self.arrayTask removeObjectAtIndex:indexPath.row];
          
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            

            NSData *tasksData = [NSKeyedArchiver archivedDataWithRootObject:self.arrayTask];
            [[NSUserDefaults standardUserDefaults] setObject:tasksData forKey:@"tasks"];
            [[NSUserDefaults standardUserDefaults] synchronize];
           
            printf("Dellete.....");
        }];
        
        [alertFaild addAction:actionOk];
        [alertFaild addAction:actionTry];
        [self presentViewController:alertFaild animated:YES completion:NULL];
       
      
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }


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
    #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
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
