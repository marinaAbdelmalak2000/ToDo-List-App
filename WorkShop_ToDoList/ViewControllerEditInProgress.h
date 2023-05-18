//
//  ViewControllerEditInProgress.h
//  WorkShop_ToDoList
//
//  Created by Marina on 27/04/2023.
//

#import <UIKit/UIKit.h>
#import "AddProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerEditInProgress : UIViewController
@property id<AddProtocol> ref;
@property NSInteger indexReplace;
@property NSString * inputTitle;
@property NSString * inputDescription;
@property NSDate *inputDate;
@property NSString *inputPropirty;
@property NSString *inputStatus;
@end

NS_ASSUME_NONNULL_END
