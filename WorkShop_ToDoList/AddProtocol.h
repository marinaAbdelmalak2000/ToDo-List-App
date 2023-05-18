//
//  AddProtocol.h
//  WorkShop_ToDoList
//
//  Created by Marina on 26/04/2023.
//

#import <Foundation/Foundation.h>
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AddProtocol <NSObject>
-(void) addTask : (Task* ) task;
@end

NS_ASSUME_NONNULL_END
