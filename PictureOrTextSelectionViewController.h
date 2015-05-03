//
//  PictureOrTextSelectionViewController.h
//  SeetiTel
//
//  Created by Immanuel Amirtharaj on 5/2/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "ViewController.h"

@interface PictureOrTextSelectionViewController : ViewController <UIImagePickerControllerDelegate>

- (IBAction)cameraButtonPressed:(id)sender;
- (IBAction)listButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *cameraButton;
@property (strong, nonatomic) IBOutlet UIButton *listButton;
@end
