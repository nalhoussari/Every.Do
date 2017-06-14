//
//  TodoCellTableViewCell.h
//  Every.Do
//
//  Created by Noor Alhoussari on 2017-06-13.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *todoTitle;
@property (weak, nonatomic) IBOutlet UILabel *todoDescription;
@property (weak, nonatomic) IBOutlet UILabel *priorityLevel;
//@property (weak, nonatomic) IBOutlet UILabel *taskCompleted;




@end
