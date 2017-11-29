//
//  ViewController.m
//  StackUser
//
//  Created by Fangzhou Liu on 11/28/17.
//  Copyright © 2017 Evan Inc. All rights reserved.
//

#import "MainViewController.h"
#import "StackUserCell.h"
#import "StackUser.h"
#import "ImageUtil.h"
@interface MainViewController ()
@property NSMutableArray *userRequests;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    StackOverFlowWS *stackOverFlowWS = [[StackOverFlowWS alloc] init];
    stackOverFlowWS.delegate = self;
    [stackOverFlowWS loadUsersFromURL:@"https://api.stackexchange.com/2.2/users?site=stackoverflow"];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)didFinishRequest:(NSMutableArray *)response{
    //Response to loading the pull requests;
    if(response != nil)
    {
        self.userRequests = response;
        dispatch_async(dispatch_get_main_queue(), ^{
            //reload table when the pull requests load in.
            [self.tableView reloadData];
            
        });
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"StackUserCellIdentifier";
    
    StackUserCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(cell == nil)
    {
        cell = [[StackUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    StackUser *stackUser = self.userRequests[indexPath.row];
    cell.userName.text = stackUser.userName;
    cell.goldLabel.text = [NSString stringWithFormat:@"%ld", stackUser.goldCount];
    cell.silverLabel.text = [NSString stringWithFormat:@"%ld", stackUser.silverCount];
    cell.bronzeLabel.text = [NSString stringWithFormat:@"%ld", stackUser.bronzeCount];
    UIImage *cellImage = [ImageUtil loadImage:[NSString stringWithFormat:@"%ld", stackUser.userID]];
    if(cellImage)
    {
        cell.gravatar.image = cellImage;
        cell.gravatar.layer.borderColor = [UIColor lightGrayColor].CGColor;
        cell.gravatar.layer.borderWidth = 1.0;
        [cell.gravatar setHidden:false];
        [cell.loadingAnimation setHidden:true];
        
    }
    else
    {
        
        cell.loadingAnimation.layer.borderColor = [UIColor lightGrayColor].CGColor;
        cell.loadingAnimation.layer.borderWidth = 1.0;
        [cell.gravatar setHidden:TRUE];
        [cell.loadingAnimation setHidden:false];
        [cell.loadingAnimation startAnimating];
      
        // dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^ {
        dispatch_async(dispatch_get_main_queue(), ^{
        UIImage *profileImage = [ImageUtil getImageFromURL:stackUser.imageURL];
        [ImageUtil saveImage:profileImage withFileName:[NSString stringWithFormat:@"%ld", stackUser.userID]];
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        });
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.userRequests != nil)
    {
    return self.userRequests.count;
    }
    else
    return 0;
}

//Used to update the UI of the cells.
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row % 2 == 0){
        cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    else
    {
        cell.backgroundColor = [UIColor whiteColor];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.contentView.layer.borderWidth = 1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
