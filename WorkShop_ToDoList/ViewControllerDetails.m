//
//  ViewControllerDetails.m
//  WorkShop_ToDoList
//
//  Created by Marina on 26/04/2023.
//

#import "ViewControllerDetails.h"
#import "ViewControllerEdit.h"

@interface ViewControllerDetails ()


//@property (weak, nonatomic) IBOutlet UILabel *LabelDate;
@property (strong, nonatomic) IBOutlet UILabel *LabelName;
@property (strong, nonatomic) IBOutlet UILabel *LabelDescription;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seqPriorty;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seqStatus;
@property (strong, nonatomic) IBOutlet UIButton *buttonEdit;
@property (strong, nonatomic) IBOutlet UIDatePicker *dateDetaild;
@property NSMutableArray<Task*> *editArray;
@property NSMutableArray <Task*> *arrayToDo;

@end

@implementation ViewControllerDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _LabelName.text= _inputTitle;
        _LabelDescription.text = _inputDescription;
       // _LabelDate.text = _inputDate;
        printf("%s :::::",[_inputPropirty UTF8String]);
        
        if([_inputPropirty isEqualToString:@"low"]){
            _seqPriorty.selectedSegmentIndex = 0;
        }else if([_inputPropirty isEqualToString:@"mid"]){
            _seqPriorty.selectedSegmentIndex = 1;
        }else{
            _seqPriorty.selectedSegmentIndex = 2;
        }
    
    NSData *tasksData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tasks"];
    _editArray =[NSKeyedUnarchiver unarchiveObjectWithData:tasksData];
    
    self.arrayToDo=[NSMutableArray new];
    
    
    for(int i =0; i< [_editArray count];i++){
        if([_editArray[i].status isEqual:@"0"]){
            [_arrayToDo addObject:_editArray[i]];
        }
    }
}
    
    
    
    
       
  //  [self.navigationController popViewControllerAnimated:YES];

- (IBAction)goToEdit:(id)sender {
    ViewControllerEdit *edit = [self.storyboard instantiateViewControllerWithIdentifier:@"edit"];
    
    edit.indexReplace=self.index;
    edit.inputTitle=self.LabelName.text;
    edit.inputDescription=self.LabelDescription.text;
    
    [self.navigationController pushViewController:edit animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    
    
   
    _LabelName.text= _arrayToDo[_index].titleTask;
    _LabelDescription.text= _arrayToDo[_index].descriptionTask;
    _dateDetaild.date=_arrayToDo[_index].dateTask;
    
        printf("%s :::::",[_inputPropirty UTF8String]);
        
    if([_myTask.propirty isEqual:@"low"]){
            _seqPriorty.selectedSegmentIndex = 0;
           
        }if([_myTask.propirty   isEqual:@"mid"]){
            _seqPriorty.selectedSegmentIndex = 1;
        }if([_myTask.propirty   isEqual:@"heigh"]){
            _seqPriorty.selectedSegmentIndex = 2;
        }
    
    if([_myTask.status  isEqual:@"0"]){
         _seqStatus.selectedSegmentIndex = 0;
        
        
     } if([_myTask.status  isEqual:@"1"]){
         _seqStatus.selectedSegmentIndex = 1;
     }if([_myTask.status  isEqual:@"2"]){
         _seqStatus.selectedSegmentIndex = 2;
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
