//
//  ViewControllerDone.m
//  WorkShop_ToDoList
//
//  Created by Marina on 27/04/2023.
//

#import "ViewControllerDone.h"
#import "ViewControllerDetailsDone.h"

@interface ViewControllerDone ()
@property (strong, nonatomic) IBOutlet UITableView *myTableDone;
@property BOOL  isFiltered;

@end

@implementation ViewControllerDone

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _myTableDone.delegate =self;
    _myTableDone.dataSource = self;
    
    _isFiltered=NO;
    
    NSData *tasksData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tasks"];
    if (tasksData) {
    self.alltask= [NSKeyedUnarchiver unarchiveObjectWithData:tasksData];
    } else {
    self.alltask = [NSMutableArray new];
    }
    
 
    [_myTableDone reloadData];
    
}
- (IBAction)goFilter:(id)sender {
   /* if(_isFiltered==YES)
        _isFiltered=NO;
    else
        _isFiltered=YES;
    printf("filteeeeeeerrrrrrr\n");
    [self.myTableDone reloadData];*/
    
    _isFiltered= !_isFiltered;
    [self.myTableDone reloadData];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
        
        self.alltask = [NSMutableArray new];
    printf("willlllllllllllllllllllllllllllllll");
        
        NSData *tasksData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tasks"];
        _alltask =[NSKeyedUnarchiver unarchiveObjectWithData:tasksData];
     
        
        
        self.arrayDone=[NSMutableArray new];
        self.lowArray = [NSMutableArray new];
        self.midArray = [NSMutableArray new];
       self.heighArray = [NSMutableArray new];
   

    for(int i =0; i< [_alltask count];i++){
        if([_alltask[i].status isEqual:@"2"]){
            [_arrayDone addObject:_alltask[i]];
            
            
            if([_alltask[i].propirty isEqual:@"low"]){
                [_lowArray addObject:_alltask[i]];
            }
            
            if([_alltask[i].propirty isEqual:@"mid"]){
                [_midArray addObject:_alltask[i]];
            }
            
            if([_alltask[i].propirty isEqual:@"heigh"]){
                [_heighArray addObject:_alltask[i]];
            }
        }
    }

    [_myTableDone reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    if(_isFiltered)
        return 3;
return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
   
    
     if(_isFiltered){
         switch (section) {
             case 0:
                 return [_heighArray count];
                 break;
             case 1:
                 return [_midArray count];
                 break;
             case 2:
                 return [_lowArray count];
                 break;
             default:
                 break;
         }
     }
    
    return _arrayDone.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellDone" forIndexPath:indexPath];

// Configure the cell...
  
    Task *task=[_arrayDone objectAtIndex:indexPath.row];
    
    if(_isFiltered){
        switch (indexPath.section) {
            case 0:
                cell.textLabel.text =[_heighArray objectAtIndex:indexPath.row].titleTask;
                cell.imageView.image =  [UIImage imageNamed:@"r"];
                break;
                
            case 1:
                cell.textLabel.text =[_midArray objectAtIndex:indexPath.row].titleTask;
                cell.imageView.image =  [UIImage imageNamed:@"y"];
                break;
                
            case 2:
                cell.textLabel.text =[_lowArray objectAtIndex:indexPath.row].titleTask;
                cell.imageView.image = [UIImage imageNamed:@"g"];
                break;
                
            default:
                break;
        }
        
    }else{
        
        cell.textLabel.text = task.titleTask;
        cell.imageView.image = [UIImage imageNamed:task.image];
    }
    

return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
if (editingStyle == UITableViewCellEditingStyleDelete) {
    
    UIAlertController *alertFaild=[UIAlertController alertControllerWithTitle:@"Delete" message:@"you are sure delete this item" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:NULL];
    
    UIAlertAction *actionTry = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        // Delete the row from the data source
        [self.arrayDone removeObjectAtIndex:indexPath.row];
        [self.alltask removeObjectAtIndex:indexPath.row];
      
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        

        NSData *tasksData = [NSKeyedArchiver archivedDataWithRootObject:self.alltask];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        
        printf("Selecttttttttttttttttt");
       ViewControllerDetailsDone *details = [self.storyboard instantiateViewControllerWithIdentifier:@"detailsDone"];

        details.index=indexPath.row;
    details.myTask = [_arrayDone objectAtIndex:indexPath.row];
    
     

    [self.navigationController pushViewController:details animated:YES];
        
    }

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   NSString *string;
   UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
      
       UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
       [label setFont:[UIFont boldSystemFontOfSize:12]];
   label.textColor =[UIColor whiteColor];
  
   if(_isFiltered){
       switch (section) {
           case 0:
               string =@"High Priorty Tasks";
               break;
           case 1:
               string =@"Medium Priorty Tasks";
               break;
           case 2:
               string =@"Low Priorty Tasks";
               break;
       }}else{
           string =@"All Tasks";
       }
   
       [label setText:string];
       [view addSubview:label];
       [view setBackgroundColor:[UIColor grayColor]];
       return view;
   
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
