//
//  ViewControllerDone.h
//  WorkShop_ToDoList
//
//  Created by Marina on 27/04/2023.
//

#import <UIKit/UIKit.h>
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerDone : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property NSMutableArray <Task*> *arrayDone;
@property NSMutableArray <Task*> *alltask;
@property NSMutableArray <Task*> *lowArray;
@property NSMutableArray <Task*> *midArray;
@property NSMutableArray <Task*> *heighArray;
@end

NS_ASSUME_NONNULL_END
