//
//  NewWhistleViewController.m
//  SeetiTel
//
//  Created by Immanuel Amirtharaj on 5/3/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "NewWhistleViewController.h"
#import "DetailsViewController.h"
#import "ImageDescriptionViewController.h"

NSMutableArray *recentPosts;
NSString *selectedString;

NSString *stringy;


@interface NewWhistleViewController ()
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@end

@implementation NewWhistleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.refreshButton setImage:[UIImage imageNamed:@"update22"] forState:UIControlStateNormal];
    [[self.refreshButton imageView] setContentMode:UIViewContentModeScaleAspectFit];
    
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
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl setBackgroundColor:[UIColor lightGrayColor]];
    [self.refreshControl setTintColor:[UIColor whiteColor]];
    [self.refreshControl addTarget:self action:@selector(refreshUI) forControlEvents:UIControlEventValueChanged];
    [self.whistleTableView addSubview:self.refreshControl];


}

- (void)refreshUI{
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
    [self.whistleTableView reloadData];
    [self.refreshControl endRefreshing];
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
    
    if ([[dic objectForKey:@"type"] intValue] == 0)
    {
        [cell.imageView setImage:[UIImage imageNamed:@"text70.png"]];

    }

    else if ([[dic objectForKey:@"type"] intValue] == 2)
    {
        [cell.imageView setImage:[UIImage imageNamed:@"image2.png"]];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:[recentPosts objectAtIndex:indexPath.row]];
    
    NSNumber *idLong = [dic objectForKey:@"id"];
    selectedString = [dic objectForKey:@"teaser"];
    
    
    if ([[dic objectForKey:@"type"] integerValue] == 0)
        [self performSegueWithIdentifier:@"slidingToDetails" sender:self];
    
    
    else if ([[dic objectForKey:@"type"] integerValue] == 2)
    {
        
        NSString *idString = [[dic objectForKey:@"id"] stringValue];
        NSString *requestString = @"http://168.235.152.38:8080/api/v1/whistle/";
        requestString = [requestString stringByAppendingString:idString];
        NSURL *requestURL = [NSURL URLWithString:requestString];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
        
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            
            
            NSError *error = nil;
            
            //NSJSONReadingMutableContainers - Returns an Array of JSON objects
            
            
            NSDictionary *newArray = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingMutableContainers error:nil];
            
            //NSDictionary *dicky = [newArray objectAtIndex:2];
            
            NSString *endString = [newArray objectForKey:@"content"];
            

        
            stringy = @"http://168.235.152.38:8080";
        
        stringy = [stringy stringByAppendingString:endString];
        
        
        [self performSegueWithIdentifier:@"slidingToImagePost" sender:self];

        }];
    }
    

}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"slidingToDetails"]) {
        
            DetailsViewController *detail = [segue destinationViewController];
            detail.teaserString = selectedString;
    }
    else if ([segue.identifier isEqualToString:@"slidingToImagePost"]) {

        
        ImageDescriptionViewController *description = [segue destinationViewController];
        description.urlString = stringy;
    
    }
}

@end
