//
//  ViewControllerDetails.h
//  WorkShop_ToDoList
//
//  Created by Marina on 26/04/2023.
//

#import <UIKit/UIKit.h>
#import "Task.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerDetails : UIViewController
@property NSString * inputTitle;
@property NSString * inputDescription;
@property NSDate *inputDate;
@property NSString *inputPropirty;
@property NSString *inputStatus;
@property NSInteger index;

@property Task *myTask;

@end

NS_ASSUME_NONNULL_END
