//
//  NewPostViewController.h
//  SeetiTel
//
//  Created by Immanuel Amirtharaj on 5/2/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "ViewController.h"

@interface NewPostViewController : ViewController
{
    
    NSInteger type;
}

@property NSInteger type;

@property(strong, nonatomic) UIImageView *whistleView;
@property(strong, nonatomic) UIImage *whistleImage;
- (IBAction)postButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *whistleTextView;

@end
