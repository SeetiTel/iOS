//
//  NewPostViewController.m
//  SeetiTel
//
//  Created by Immanuel Amirtharaj on 5/2/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "NewPostViewController.h"

@interface NewPostViewController ()

@end

@implementation NewPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    if (type == 0)
    {
        self.whistleTextView = [[UITextView alloc] initWithFrame:CGRectMake(50, 100, 200, 300)];
        
        [self.whistleTextView setBackgroundColor:[UIColor blueColor]];
        
        [self.whistleTextView setTextColor:[UIColor whiteColor]];
        
        [self.view addSubview:self.whistleTextView];
        
    }
    
    else if (type == 1)
    {
      
        self.whistleView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 10, 200, 300)];
        
        [self.whistleView setImage:self.whistleImage];
        
        [self.view addSubview:self.whistleView];

    
    }
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
}


- (IBAction)postButtonPressed:(id)sender {
    
//    NSURL *requestURL = [NSURL URLWithString:@"http://168.235.152.38:8080/api/v1/whistle/new/"];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL
//                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                       timeoutInterval:60.0];
//    
//    
//    NSString *whistleString = [self.whistleTextView text];
//    
//    NSString *postString = @"type=0&data=";
//    postString = [postString stringByAppendingString:whistleString];
//    
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request
//                                                                 delegate:self];

    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end
