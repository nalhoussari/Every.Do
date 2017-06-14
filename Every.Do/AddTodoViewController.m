//
//  AddTodoViewController.m
//  Every.Do
//
//  Created by Noor Alhoussari on 2017-06-13.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import "AddTodoViewController.h"

@interface AddTodoViewController ()

@end

@implementation AddTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    
- (IBAction)pushMyNewViewController{
    self.todo = [[Todo alloc] initWithTitle: self.todoNewTitle.text andTodoDescription: self.todoNewDescription.text andPriorityNumber:[self.todoNewPriority.text intValue] andIsCompletedIndicator:NO];
    
    [self.delegate newTodoInfo: self.todo];

    // modal dismissing viewController
    [self dismissViewControllerAnimated:YES completion:nil];
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
