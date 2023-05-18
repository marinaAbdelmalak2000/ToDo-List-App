//
//  ViewControllerAdd.h
//  WorkShop_ToDoList
//
//  Created by Marina on 26/04/2023.
//

#import <UIKit/UIKit.h>
#import "AddProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerAdd : UIViewController

@property id<AddProtocol> ref;

@end

NS_ASSUME_NONNULL_END
