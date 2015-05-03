//
//  NewWhistleViewController.m
//  SeetiTel
//
//  Created by Immanuel Amirtharaj on 5/3/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "NewWhistleViewController.h"
#import "DetailsViewController.h"

NSMutableArray *recentPosts;
NSString *selectedString;


@interface NewWhistleViewController ()

@end

@implementation NewWhistleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSURL *requestURL = [NSURL URLWithString:@"http://168.235.152.38:8080/api/v1/whistles/0"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        NSError *error = nil;
        
        //NSJSONReadingMutableContainers - Returns an Array of JSON objects
        
        
        NSMutableArray *newArray = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingMutableContainers error:nil];
        
        if (!recentPosts)
        {
            recentPosts = [[NSMutableArray alloc] initWithArray:newArray];
        }
        [self.whistleTableView reloadData];
        
    }];
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellString = @"WhistleCell";
    
    UITableViewCell *cell = (UITableViewCell *) [self.whistleTableView dequeueReusableCellWithIdentifier:cellString];
    

    NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:[recentPosts objectAtIndex:indexPath.row]];
    
    [cell.textLabel setText:[dic objectForKey:@"teaser"]];
    
    if ([[dic objectForKey:@"type"] intValue] == 1)
    {
        [cell.imageView setImage:[UIImage imageNamed:@"image2.png"]];
    }

    else
        [cell.imageView setImage:[UIImage imageNamed:@"text70.png"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:[recentPosts objectAtIndex:indexPath.row]];
    
    NSNumber *idLong = [dic objectForKey:@"id"];
    selectedString = [dic objectForKey:@"teaser"];
    
    
    
    NSString *stringy = @"http://168.235.152.38:8080/api/v1/whistles/";
    NSString *idString = [idLong stringValue];
    stringy = [stringy stringByAppendingString:idString];
    
    
    NSURL *requestURL = [NSURL URLWithString:stringy];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        NSArray *selected = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        
        
        
        
        
        //NSJSONReadingMutableContainers - Returns an Array of JSON objects
        
        
    //    NSMutableArray *newArray = [[NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingMutableContainers error:nil];
        
        
    }];

    [self performSegueWithIdentifier:@"slidingToDetails" sender:self];

}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    DetailsViewController *detail = [segue destinationViewController];
    detail.teaserString = selectedString;
}


@end
