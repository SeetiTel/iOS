//
//  SearchViewController.h
//  SeetiTel
//
//  Created by Immanuel Amirtharaj on 5/2/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "ViewController.h"

@interface SearchViewController : ViewController <UISearchBarDelegate, UISearchControllerDelegate, UISearchDisplayDelegate, UISearchResultsUpdating>

@property (strong, nonatomic) IBOutlet UITextField *searchLabel;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
- (IBAction)cancelButtonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UISearchBar *whistleSearchBar;

@end
