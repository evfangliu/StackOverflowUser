//
//  StackUserCell.h
//  StackUser
//
//  Created by Fangzhou Liu on 11/28/17.
//  Copyright © 2017 Evan Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StackUserCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingAnimation;
@property (nonatomic, weak) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIImageView *gravatar;
@property (weak, nonatomic) IBOutlet UILabel *goldLabel;
@property (weak, nonatomic) IBOutlet UILabel *silverLabel;
@property (weak, nonatomic) IBOutlet UILabel *bronzeLabel;
@end
