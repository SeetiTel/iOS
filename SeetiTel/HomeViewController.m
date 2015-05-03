//
//  HomeViewController.m
//  SeetiTel
//
//  Created by Immanuel Amirtharaj on 5/2/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "HomeViewController.h"
#import "whistleCollectionViewCell.h"

NSMutableArray *recentPosts1;




@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setItemSize:CGSizeMake(280, 400)];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.whistleCollectionView setPagingEnabled:YES];
    
    
    
    [layout setSectionInset:UIEdgeInsetsMake(0, 50, 0, 20)];
    
    [self.whistleCollectionView setCollectionViewLayout:layout];
    
    
    

    
    
    // registering the nib to use as a collectionview cell
  //  UINib *cellNib = [UINib nibWithNibName:@"WhistleCell" bundle:nil];
  //  [self.whistleCollectionView registerNib:cellNib forCellWithReuseIdentifier:@"WhistleCell"];

    
 //   [self.whistleCollectionView registerClass:[whistleCollectionViewCell class] forCellWithReuseIdentifier:@"WhistleCell"];
    
    
    
  //  [self.view setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:176.0/255.0 blue:104.0/255.0 alpha:1]];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
   // self.whistleCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(100, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 50)];
    
    [self.whistleCollectionView setBackgroundColor:[UIColor clearColor]];
    
    
    
    
    [self.view addSubview:self.whistleCollectionView];
    
    
    NSURL *requestURL = [NSURL URLWithString:@"http://168.235.152.38:8080/api/v1/whistles/0"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        NSError *error = nil;
        
        //NSJSONReadingMutableContainers - Returns an Array of JSON objects
        
        
        NSMutableArray *newArray = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingMutableContainers error:nil];
        
        if (!recentPosts1)
        {
            recentPosts1 = [[NSMutableArray alloc] initWithArray:newArray];
        }
        [self.whistleCollectionView reloadData];
        
        
        //recentPosts = [[NSMutableArray alloc] initWithArray:recentPosts];

       // self.text = [[greeting objectForKey:@"created"] stringValue];
        
        
    }];

    
    
    NSLog(@"@%@", recentPosts1);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.whistleCollectionView cellForItemAtIndexPath:indexPath];
    
    
      //  [cell setBackgroundColor:[UIColor greenColor]];
    
   
}




- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 50; //the spacing between cells is 2 px here
}




-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //return [recentPosts count];
    
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellString = @"WhistleCell";
    
    
    whistleCollectionViewCell *cell = (whistleCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellString forIndexPath:indexPath];
    
    
    if(!cell)
    {
      //  [collectionView registerNib:[UINib nibWithNibName:@"WhistleCell" bundle:nil] forCellWithReuseIdentifier:cellString];
        /*
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WhistleCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
         */
    }
    
   // [cell setBackgroundColor:[UIColor colorWithRed:103.0/255.0 green:116.0/255.0 blue:255.0/255.0 alpha:1]];
    //[cell setBackgroundColor:[UIColor colorWithRed:64.0/255.0 green:71.0/255.0 blue:153.0/255.0 alpha:1]];
    
    
    for (UILabel *lbl in cell.contentView.subviews)
    {
        if ([lbl isKindOfClass:[UILabel class]])
        {
            [lbl removeFromSuperview];
        }
    }
    
    [cell setBackgroundColor:[UIColor blackColor]];
    
  //  NSDictionary *dic = [[NSDictionary alloc] initWithObjects:recentPosts forKeys:[NSArray arrayWithObjects:@"teaser", @"id", @"created", @"type", nil]];
    
    NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:[recentPosts1 objectAtIndex:indexPath.row]];
    
   // if ([[dic objectForKey:@"type"] integerValue] == 0)
   // {
        cell.descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(15, 30, 240, 500)];
        [cell.descriptionView setTextColor:[UIColor whiteColor]];
        [cell.descriptionView setBackgroundColor:[UIColor clearColor]];
        cell.descriptionView.font = [UIFont boldSystemFontOfSize:25.0f];
         
         [cell.descriptionView setText:[dic objectForKey:@"teaser"]];
    
    [cell addSubview:cell.descriptionView];

    
   // }
    
//    else if ([[dic objectForKey:@"type"] integerValue] == 1)
//    {
//        UIImageView *whistleView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 30, 240, 340)];
//        [whistleView setImage:[dic objectForKey:@"content"]];
//        [cell addSubview:whistleView];
//    }
 
   // NSLog(@"@%@", [dic objectForKey:@"created"]) ;
   // [cell.teaserLabel setText:@"Hallo"];
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)reloadButtonPressed:(id)sender {
    
    NSURL *requestURL = [NSURL URLWithString:@"http://168.235.152.38:8080/api/v1/whistles/0"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        NSError *error = nil;
        
        //NSJSONReadingMutableContainers - Returns an Array of JSON objects
        
        
        NSMutableArray *newArray = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingMutableContainers error:nil];

        
    [self.whistleCollectionView reloadData];
    }];
}
     
@end
