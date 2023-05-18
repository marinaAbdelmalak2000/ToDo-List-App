//
//  Task.h
//  WorkShop_ToDoList
//
//  Created by Marina on 26/04/2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject

@property NSString *titleTask;
@property NSString *descriptionTask;
@property NSDate *dateTask;
@property NSString *propirty;
@property NSString *status;
@property NSString *image;

@end

NS_ASSUME_NONNULL_END
