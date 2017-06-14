//
//  Todo.m
//  Every.Do
//
//  Created by Noor Alhoussari on 2017-06-13.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import "Todo.h"

@implementation Todo


- (instancetype)init
{
    self = [super init];
    if (self) {
//        _todos = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithTitle: (NSString *) title andTodoDescription: (NSString *) todoDescription andPriorityNumber: (int) priorityNumber andIsCompletedIndicator: (BOOL)isCompletedIndicator
{
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = todoDescription;
        _priorityNumber = priorityNumber;
        _isCompletedIndicator = isCompletedIndicator;
    }
    return self;
}

//- (void) addTodoTasksToArray{
//    
//}

@end
