//
//  PictureOrTextSelectionViewController.m
//  SeetiTel
//
//  Created by Immanuel Amirtharaj on 5/2/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "PictureOrTextSelectionViewController.h"
#import "NewPostViewController.h"
#import "PictureOrTextSelectionViewController.h"

NSInteger whistleType;
UIImagePickerController *camera;

UIImage *whistleImage;


@interface PictureOrTextSelectionViewController ()

@end

@implementation PictureOrTextSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.cameraButton setBackgroundImage:[UIImage imageNamed:@"camera90.png"] forState:UIControlStateNormal];

    
    [self.view setBackgroundColor:[UIColor redColor]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NewPostViewController *post = [segue destinationViewController];
    
    
    post.whistleImage = whistleImage;
    post.type = whistleType;
    [self performSegueWithIdentifier:@"slidingToNewPost" sender:self];
    
    
    
    
}


- (IBAction)cameraButtonPressed:(id)sender {
    
    whistleType = 1;
    
    camera = [[UIImagePickerController alloc] init];
    [camera setSourceType:UIImagePickerControllerSourceTypeCamera];
    
    camera = [[UIImagePickerController alloc] init];
    [camera setDelegate:self];
    [camera setSourceType:UIImagePickerControllerSourceTypeCamera];
    camera.allowsEditing = NO;
    [camera startVideoCapture];
    [self presentViewController:camera animated:YES completion:NULL];
    //[self performSegueWithIdentifier:@"slidingToNewPost" sender:self];

}

- (IBAction)listButtonPressed:(id)sender {
    
    whistleType = 0;
    
    [self performSegueWithIdentifier:@"slidingToNewPost" sender:self];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)editingInfo {
    [camera dismissViewControllerAnimated:YES completion:^{
        whistleImage = [editingInfo objectForKey:UIImagePickerControllerOriginalImage];
        
    }];
}


@end
