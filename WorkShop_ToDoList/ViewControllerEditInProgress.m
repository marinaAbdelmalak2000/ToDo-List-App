//
//  ViewControllerEditInProgress.m
//  WorkShop_ToDoList
//
//  Created by Marina on 27/04/2023.
//

#import "ViewControllerEditInProgress.h"
#import "Task.h"

@interface ViewControllerEditInProgress ()

@property NSMutableArray <Task*> *arrayProgress;
@property NSMutableArray<Task*> *editArray;
@property (strong, nonatomic) IBOutlet UITextField *textFieldName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldDescription;

@property (strong, nonatomic) IBOutlet UIDatePicker *datePickerProgress;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seqPriorty;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seqStatus;

@end

@implementation ViewControllerEditInProgress

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(EditTask)];
       self.navigationItem.rightBarButtonItem = addButton;
       
      // _textFieldEditName.placeholder=@"Name..";
      // _textFieldEditDes.placeholder=@"Description..";
    _textFieldName.text=_inputTitle;
    _textFieldDescription.text = _inputDescription;
    
    NSData *tasksData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tasks"];
    _editArray =[NSKeyedUnarchiver unarchiveObjectWithData:tasksData];
    
    self.arrayProgress=[NSMutableArray new];
    
    for(int i =0; i< [_editArray count];i++){
        if([_editArray[i].status isEqual:@"1"]){
            [_arrayProgress addObject:_editArray[i]];
        }
    }
}

-(void)EditTask{
    
    printf("\nEdit:::::::::::::::::::\n\n");
    
    NSLog(@"Edit");
    
    [_editArray removeObject:_arrayProgress[_indexReplace]];
    [_arrayProgress removeObjectAtIndex:_indexReplace];
    
    
    
    Task *task =[Task new];
    
    [task setTitleTask:_textFieldName.text];
    [task setDescriptionTask:_textFieldDescription.text];
    [task setDateTask:_datePickerProgress.date];
    [task setPropirty:_seqPriorty];
    [task setStatus:_seqStatus];
  //  [task setImage:editArray[_indexReplace].image];
    
    if (_seqPriorty.selectedSegmentIndex == 0) {
        task.image=@"g.png";
        
    }else if (_seqPriorty.selectedSegmentIndex == 1){
        task.image=@"y.png";
    }else{
        task.image=@"r.png";
    }
    
    
    if(_seqStatus.selectedSegmentIndex == 0){
        task.status=@"0";
    }
    if(_seqStatus.selectedSegmentIndex == 1){
        task.status=@"1";
    }
    if(_seqStatus.selectedSegmentIndex == 2)
    {
        task.status=@"2";
    }
    
   // NSLog(@"Editttttttttttttttt %s count %d",[task.titleTask UTF8String],editArray.count);
    
 //   [editArray replaceObjectAtIndex:self.indexReplace withObject:task];
   // _editArray[_indexReplace]=task;
  //  Task  * task0 = _editArray[self.indexReplace];
  //  NSLog(@"%s",[task0.titleTask UTF8String]);
    
  
    [_editArray addObject:task];
    
    NSData *tasksDataEdit = [NSKeyedArchiver archivedDataWithRootObject:_editArray];
    [[NSUserDefaults standardUserDefaults] setObject:tasksDataEdit forKey:@"tasks"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"Editttttttttttttttt %s count %d",[task.titleTask UTF8String],_editArray.count);
    
  //  [_ref addTask:task];
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
