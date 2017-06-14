//
//  Todo.h
//  Every.Do
//
//  Created by Noor Alhoussari on 2017-06-13.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *todoDescription;
@property (nonatomic) int priorityNumber;
@property (nonatomic) BOOL isCompletedIndicator;

//@property (nonatomic) NSMutableArray *todos;

- (instancetype)initWithTitle: (NSString *) title andTodoDescription: (NSString *) todoDescription andPriorityNumber: (int) priorityNumber andIsCompletedIndicator: (BOOL)isCompletedIndicator;

@end
