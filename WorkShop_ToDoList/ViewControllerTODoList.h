//
//  ViewControllerTODoList.h
//  WorkShop_ToDoList
//
//  Created by Marina on 26/04/2023.
//

#import <UIKit/UIKit.h>
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerTODoList : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property NSMutableArray *searchResults;
@property NSMutableArray <Task*> *arrayTaskToDo;
@property NSMutableArray <Task*>*arrayTask;



@end

NS_ASSUME_NONNULL_END
