//
//  ImageDescriptionViewController.m
//  SeetiTel
//
//  Created by Immanuel Amirtharaj on 5/3/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "ImageDescriptionViewController.h"

@interface ImageDescriptionViewController ()

@end

@implementation ImageDescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self.descriptionWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
    
    
    
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

@end
