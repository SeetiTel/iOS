//
//  DetailsViewController.h
//  SeetiTel
//
//  Created by Immanuel Amirtharaj on 5/3/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "ViewController.h"

@interface DetailsViewController : ViewController
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionLabel;

@property NSString *teaserString;

@end
