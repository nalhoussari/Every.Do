//
//  AddTodoViewController.h
//  Every.Do
//
//  Created by Noor Alhoussari on 2017-06-13.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@protocol AddingDelegate <NSObject>

- (void) newTodoInfo: (Todo *) newTodo;

@end

@interface AddTodoViewController : UIViewController

@property (nonatomic, weak) id <AddingDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *todoNewTitle;
@property (weak, nonatomic) IBOutlet UITextField *todoNewPriority;
@property (weak, nonatomic) IBOutlet UITextField *todoNewDescription;
@property (nonatomic) Todo *todo;

@end
