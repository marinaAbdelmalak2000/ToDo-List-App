//
//  ViewControllerAdd.m
//  WorkShop_ToDoList
//
//  Created by Marina on 26/04/2023.
//

#import "ViewControllerAdd.h"

#import "Task.h"

@interface ViewControllerAdd ()

//@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;

@property (strong, nonatomic) IBOutlet UITextField *testFieldTitle;
@property (strong, nonatomic) IBOutlet UITextField *textFildDescription;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seqInputPrp;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seqStatus;
@property (strong, nonatomic) IBOutlet UIDatePicker *DatePicher;


@end

@implementation ViewControllerAdd

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(saveTask)];
       self.navigationItem.rightBarButtonItem = addButton;
       
       _testFieldTitle.placeholder=@"Name..";
       _textFildDescription.placeholder=@"Description..";
     //  _textFieldDate.placeholder =@"Date";
       
       
   }

   -(void)saveTask{
       
       printf("SSSAAAVE:::::::::::::::::::\n\n");
       
       Task *task =[Task new];
       if ([_testFieldTitle.text isEqualToString:@""]) {
           
           UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Add"
                                                                          message:@"Please, enter name."
                                                                   preferredStyle:UIAlertControllerStyleAlert];
           
           UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction * action) {}];
           
           [alert addAction:defaultAction];
           [self presentViewController:alert animated:YES completion:nil];
           
       }/*else if([_textFieldDate.text isEqualToString:@""]){
           UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Add"
                                                                          message:@"Please, enter Date."
                                                                   preferredStyle:UIAlertControllerStyleAlert];
           
           UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction * action) {}];
           
           [alert addAction:defaultAction];
           [self presentViewController:alert animated:YES completion:nil];
       }*/else{
           task.titleTask = _testFieldTitle.text;
           task.descriptionTask = _textFildDescription.text;
         //  task.dateTask = _textFieldDate.text;
           
           if(_seqStatus.selectedSegmentIndex == 0){
               task.status=@"0";
           }else if(_seqStatus.selectedSegmentIndex == 1){
               task.status=@"1";
           }else{
               task.status=@"2";
           }
           
           if (_seqInputPrp.selectedSegmentIndex == 0 ) {
               task.propirty=@"low";
               task.image=@"g.png";
               
           }else if (_seqInputPrp.selectedSegmentIndex == 1){
               task.propirty=@"mid";
               task.image=@"y.png";
           }else{
               task.propirty=@"heigh";
               task.image=@"r.png";
           }
           
           // Set initial date for the date picker
           //    self.DatePicher.date = [NSDate date];
          
           NSDate *selectedDate = self.DatePicher.date;

           NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
           [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"America/New_York"]];
           [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

           NSString *formattedDate = [dateFormatter stringFromDate:selectedDate];
           
           task.dateTask=selectedDate;
           
           [_ref addTask:task];
           
           [self.navigationController popViewControllerAnimated:YES];
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
