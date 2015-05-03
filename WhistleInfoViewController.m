//
//  WhistleInfoViewController.m
//  SeetiTel
//
//  Created by Immanuel Amirtharaj on 5/2/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "WhistleInfoViewController.h"
UIImage *image;


@interface WhistleInfoViewController ()

@end

@implementation WhistleInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /*Pseudocode
        if it is an image, have an image view, if it is a text field, use that as well
     
    */
     //This means they want a picture
     if (flag == 0)
     {
         self.cameraController = [[UIImagePickerController alloc] init];
         [self.cameraController setSourceType:UIImagePickerControllerSourceTypeCamera];
         [self.cameraController setDelegate:self];
     }
     
     
    
    /*
    if ()
    {
     UIImageView *view = [UIImageView alloc] initWithImage:<#(UIImage *)#>
    }
   else
   {
    UITextField *description = [[UITextField alloc] initWithFrame:CGRectMake(40, 40, 100, 100)];
    
    [description setUserInteractionEnabled:NO];
    [description setTextColor:[UIColor whiteColor]];
    [description setText:<#(NSString *)#>];
   }
     
     */
    
    

    
}



-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    

    image = [UIImage imageNamed:[info objectForKey:@"UIImagePickerControllerOriginalImage"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeButtonPressed:(id)sender {
    
 //   [self dep]
}
@end
