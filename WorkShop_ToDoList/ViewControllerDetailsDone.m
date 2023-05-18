//
//  ViewControllerDetailsDone.m
//  WorkShop_ToDoList
//
//  Created by Marina on 27/04/2023.
//

#import "ViewControllerDetailsDone.h"

@interface ViewControllerDetailsDone ()

@property NSMutableArray<Task*> *editArray;
@property NSMutableArray <Task*> *arrayDone;
@property (strong, nonatomic) IBOutlet UILabel *LabelNameDone;
@property (strong, nonatomic) IBOutlet UILabel *LabelDescriptionDone;
@property (strong, nonatomic) IBOutlet UIDatePicker *dataPickerDone;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seqPropirtyDone;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seqStatusDone;

@end

@implementation ViewControllerDetailsDone

-(void)viewDidLoad {
   [super viewDidLoad];
   // Do any additional setup after loading the view.
   _LabelNameDone.text= _inputTitle;
    _LabelDescriptionDone.text = _inputDescription;
      // _LabelDate.text = _inputDate;
       printf("%s :::::",[_inputPropirty UTF8String]);
       
       if([_inputPropirty isEqualToString:@"low"]){
           _seqPropirtyDone.selectedSegmentIndex = 0;
       }else if([_inputPropirty isEqualToString:@"mid"]){
           _seqPropirtyDone.selectedSegmentIndex = 1;
       }else{
           _seqPropirtyDone.selectedSegmentIndex = 2;
       }
   
   NSData *tasksData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tasks"];
   _editArray =[NSKeyedUnarchiver unarchiveObjectWithData:tasksData];
   
   self.arrayDone=[NSMutableArray new];
   
   
   for(int i =0; i< [_editArray count];i++){
       if([_editArray[i].status isEqual:@"2"]){
           [_arrayDone addObject:_editArray[i]];
       }
   }
}

- (void)viewWillAppear:(BOOL)animated{
   
   NSData *tasksData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tasks"];
   NSMutableArray<Task*> *editArray =[NSKeyedUnarchiver unarchiveObjectWithData:tasksData];
   
   
   _LabelNameDone.text= _myTask.titleTask;
   _LabelDescriptionDone.text= _myTask.descriptionTask;
   _dataPickerDone.date=_myTask.dateTask;
   
       printf("%s :::::",[_inputPropirty UTF8String]);
       
      if([_myTask.propirty isEqual:@"low"]){
           _seqPropirtyDone.selectedSegmentIndex = 0;
          
       }else if([_myTask.propirty  isEqual:@"mid"]){
           _seqPropirtyDone.selectedSegmentIndex = 1;
       }else{
           _seqPropirtyDone.selectedSegmentIndex = 2;
       }
   
   if([_myTask.status isEqual:@"0"]){
        _seqStatusDone.selectedSegmentIndex = 0;
       
       
    }else if([_myTask.status  isEqual:@"1"]){
        _seqStatusDone.selectedSegmentIndex = 1;
    }else{
        _seqStatusDone.selectedSegmentIndex = 2;
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
