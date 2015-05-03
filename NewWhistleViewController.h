//
//  NewWhistleViewController.h
//  SeetiTel
//
//  Created by Immanuel Amirtharaj on 5/3/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "ViewController.h"

@interface NewWhistleViewController : ViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *whistleTableView;
@property (strong, nonatomic) IBOutlet UIButton *refreshButton;
- (void)refreshUI;
@end
