//
//  ViewControllerEdit.m
//  WorkShop_ToDoList
//
//  Created by Marina on 27/04/2023.
//

#import "ViewControllerEdit.h"
#import "Task.h"

@interface ViewControllerEdit ()

@property NSMutableArray <Task*> *arrayToDo;
@property NSMutableArray<Task*> *editArray;

@property (strong, nonatomic) IBOutlet UITextField *textFieldEditName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldEditDes;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePickerEdit;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seqPriortyEdit;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seqStatusEdit;

@end

@implementation ViewControllerEdit

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(EditTask)];
       self.navigationItem.rightBarButtonItem = addButton;
       
      // _textFieldEditName.placeholder=@"Name..";
      // _textFieldEditDes.placeholder=@"Description..";
    _textFieldEditName.text=_inputTitle;
    _textFieldEditDes.text = _inputDescription;
    
    NSData *tasksData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tasks"];
    _editArray =[NSKeyedUnarchiver unarchiveObjectWithData:tasksData];
    
    self.arrayToDo=[NSMutableArray new];
    
    for(int i =0; i< [_editArray count];i++){
        if([_editArray[i].status isEqual:@"0"]){
            [_arrayToDo addObject:_editArray[i]];
        }
    }
}

-(void)EditTask{
    
    printf("\nEdit:::::::::::::::::::\n\n");
    
    NSLog(@"Edit");
    
    [_editArray removeObject:_arrayToDo[_indexReplace]];
    [_arrayToDo removeObjectAtIndex:_indexReplace];
    
    
    
    Task *task =[Task new];
    
    [task setTitleTask:_textFieldEditName.text];
    [task setDescriptionTask:_textFieldEditDes.text];
    [task setDateTask:_datePickerEdit.date];
    [task setPropirty:_seqPriortyEdit];
    [task setStatus:_seqStatusEdit];
  //  [task setImage:editArray[_indexReplace].image];
    
    if (_seqPriortyEdit.selectedSegmentIndex == 0) {
        task.image=@"g.png";
        
    }else if (_seqPriortyEdit.selectedSegmentIndex == 1){
        task.image=@"y.png";
    }else{
        task.image=@"r.png";
    }
    
    
    if(_seqStatusEdit.selectedSegmentIndex == 0){
        task.status=@"0";
    }
    if(_seqStatusEdit.selectedSegmentIndex == 1){
        task.status=@"1";
    }
    if(_seqStatusEdit.selectedSegmentIndex == 2)
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
