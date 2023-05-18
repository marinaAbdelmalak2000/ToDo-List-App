//
//  ViewControllerDetailsInProgress.m
//  WorkShop_ToDoList
//
//  Created by Marina on 27/04/2023.
//

#import "ViewControllerDetailsInProgress.h"
#import "Task.h"
#import "ViewControllerEditInProgress.h"

@interface ViewControllerDetailsInProgress ()
@property (strong, nonatomic) IBOutlet UILabel *LabelNameProgress;
@property (strong, nonatomic) IBOutlet UILabel *LabelDescriptionProgress;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePackerProgress;
@property (strong, nonatomic) IBOutlet UISegmentedControl *priortyProgress;
@property (strong, nonatomic) IBOutlet UISegmentedControl *statusProgress;
@property (strong, nonatomic) IBOutlet UIButton *editProgress;

@property NSMutableArray<Task*> *editArray;
@property NSMutableArray <Task*> *arrayrogress;

@end

@implementation ViewControllerDetailsInProgress

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _LabelNameProgress.text= _inputTitle;
        _LabelDescriptionProgress.text = _inputDescription;
       // _LabelDate.text = _inputDate;
        printf("%s :::::",[_inputPropirty UTF8String]);
        
        if([_inputPropirty isEqualToString:@"low"]){
            _priortyProgress.selectedSegmentIndex = 0;
        }else if([_inputPropirty isEqualToString:@"mid"]){
            _priortyProgress.selectedSegmentIndex = 1;
        }else{
            _priortyProgress.selectedSegmentIndex = 2;
        }
    
    NSData *tasksData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tasks"];
    _editArray =[NSKeyedUnarchiver unarchiveObjectWithData:tasksData];
    
    self.arrayrogress=[NSMutableArray new];
    
    
    for(int i =0; i< [_editArray count];i++){
        if([_editArray[i].status isEqual:@"1"]){
            [_arrayrogress addObject:_editArray[i]];
        }
    }
}
- (IBAction)goToEditInProgress:(id)sender {
    ViewControllerEditInProgress *edit = [self.storyboard instantiateViewControllerWithIdentifier:@"editInProgress"];
    
    edit.indexReplace=self.index;
    edit.inputTitle=self.LabelNameProgress.text;
    edit.inputDescription=self.LabelDescriptionProgress.text;
    
    [self.navigationController pushViewController:edit animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    
    NSData *tasksData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tasks"];
    NSMutableArray<Task*> *editArray =[NSKeyedUnarchiver unarchiveObjectWithData:tasksData];
    
    
    _LabelNameProgress.text= _myTask.titleTask;
    _LabelDescriptionProgress.text= _myTask.descriptionTask;
    _datePackerProgress.date=_myTask.dateTask;
    
        printf("%s :::::",[_inputPropirty UTF8String]);
        
       if([_myTask.propirty isEqual:@"low"]){
            _priortyProgress.selectedSegmentIndex = 0;
           
        }else if([_myTask.propirty  isEqual:@"mid"]){
            _priortyProgress.selectedSegmentIndex = 1;
        }else{
            _priortyProgress.selectedSegmentIndex = 2;
        }
    
    if([_myTask.status isEqual:@"0"]){
         _statusProgress.selectedSegmentIndex = 0;
        
        
     }else if([_myTask.status  isEqual:@"1"]){
         _statusProgress.selectedSegmentIndex = 1;
     }else{
         _statusProgress.selectedSegmentIndex = 2;
     }
    
   
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
