//
//  WhistleInfoViewController.h
//  SeetiTel
//
//  Created by Immanuel Amirtharaj on 5/2/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "ViewController.h"

@interface WhistleInfoViewController : ViewController <UIImagePickerControllerDelegate>
{
    int flag;
    
}


@property(strong, nonatomic) UIImagePickerController *cameraController;

- (IBAction)closeButtonPressed:(id)sender;





@end
