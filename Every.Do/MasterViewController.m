//
//  MasterViewController.m
//  Every.Do
//
//  Created by Noor Alhoussari on 2017-06-13.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "TodoCellTableViewCell.h"
#import "AddTodoViewController.h"

@interface MasterViewController () <UITableViewDelegate, UITableViewDataSource, AddingDelegate>

@property NSMutableArray *objects;
@property (nonatomic, strong) NSIndexPath *currentlySelectedIndexPath;
//@property (nonatomic) AddTodoViewController *addTodoViewController;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    Todo *visit = [[Todo alloc] initWithTitle:@"Visit a friend" andTodoDescription:@"visit a friend in Victoria" andPriorityNumber:2 andIsCompletedIndicator:NO];
    
    Todo *watering = [[Todo alloc] initWithTitle:@"watering plants" andTodoDescription:@"in the living room and balconey" andPriorityNumber:3 andIsCompletedIndicator:NO];
    
    Todo *followUp = [[Todo alloc] initWithTitle:@"Following up" andTodoDescription:@"follwoing up on assignments" andPriorityNumber:1 andIsCompletedIndicator:NO];
    
    Todo *go = [[Todo alloc] initWithTitle:@"Car Free Day" andTodoDescription:@"Hgo on car free day on Sunday" andPriorityNumber:1 andIsCompletedIndicator:NO];
    
    Todo *appointment = [[Todo alloc] initWithTitle:@"Hair cut appointment" andTodoDescription:@"take a hair cut appointment for next month" andPriorityNumber:1 andIsCompletedIndicator:NO];
    
    self.objects = [[NSMutableArray alloc] initWithObjects: visit, watering, followUp, go, appointment, nil];
    
}


- (void)viewWillAppear:(BOOL)animated {
}

- (void) newTodoInfo: (Todo *) newTodo{
    if (newTodo != nil){
        [self.objects addObject:newTodo];
        [self.tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)pushMyNewViewController{
//    AddTodoViewController *addTodoNewController = [[AddTodoViewController alloc] init];
//    
//    // do any setup you need for myNewVC
//    
//    [self presentModalViewController:myNewVC animated:YES];
//}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    AddTodoViewController *addTodoViewController = [[AddTodoViewController alloc] init];
    [self performSegueWithIdentifier:@"AddingTodo" sender:self];
}

#pragma mark - Segues

// the following method is enough to go to the destinated VC as we already set the segue in storyBoard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        
        [controller setDetailItem: self.objects[indexPath.row]];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

    } else if ([[segue identifier] isEqualToString:@"AddingTodo"]) {
        AddTodoViewController *addTodoViewController = (AddTodoViewController *) [segue destinationViewController];
        addTodoViewController.delegate = self;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

//This get called when the cell displayed
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TodoCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //Setting the cell info
    if (!([self.objects[indexPath.row] isCompletedIndicator])){
        
        NSString *title = [self.objects[indexPath.row] title];
        cell.todoTitle.text = title;
    
        cell.todoDescription.text = [self.objects[indexPath.row] todoDescription];
    
        NSString *prioriotyNumberAsString = [NSString stringWithFormat:@"%d", [self.objects[indexPath.row] priorityNumber]];
        cell.priorityLevel.text = prioriotyNumberAsString;
        
    } else {
        NSString *taskCompleted = [NSString stringWithFormat: @"%@ is completed", [self.objects[indexPath.row] title]];
        cell.todoDescription.text = taskCompleted;
        NSString *title = [self.objects[indexPath.row] title];
        cell.todoTitle.text = title;
//        cell.priorityLevel.text = @"Done";
    }

    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
