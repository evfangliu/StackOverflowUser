//
//  StackOverflowWS.m
//  StackUser
//
//  Created by Fangzhou Liu on 11/28/17.
//  Copyright © 2017 Evan Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowWS.h"
#import "StackUser.h"
#import <UIKit/UIKit.h>
#import "ImageUtil.h"
//#import "PullRequest.h"
@implementation StackOverFlowWS

-(id)init{
    if((self = [super init])){
    }
    return self;
}


-(void)loadUsersFromURL:(NSString *) url
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    if (!self.users) {
        self.users = [[NSMutableArray alloc] init];
    }
    
    [[session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error: &error];
          NSDictionary *items = [JSON objectForKey:@"items"];
              for (NSDictionary *user in items)
              {
                  long userID = [[user objectForKey:@"user_id"] longValue];
                  NSString *userName = [user objectForKey:@"display_name"];
                  NSDictionary *badgeCounts = [user objectForKey:@"badge_counts"];
                  long goldCount = [[badgeCounts objectForKey:@"gold"] longValue];
                  long silverCount = [[badgeCounts objectForKey:@"silver"] longValue];
                  long bronzeCount = [[badgeCounts objectForKey:@"bronze"] longValue];
                  NSString *imageURL = [user objectForKey:@"profile_image"];
                  /*
                  UIImage *profileImage = [ImageUtil getImageFromURL:imageURL];
                  UIImage *imageFromFile = [ImageUtil loadImage:[NSString stringWithFormat:@"%ld", userID]];
                  if(imageFromFile)
                  {
                      //do nothing
                  }
                  else
                  {
                      [ImageUtil saveImage:profileImage withFileName:[NSString stringWithFormat:@"%ld", userID]];
                  }
                   */
                  StackUser *stackUser = [[StackUser alloc] init];
                  stackUser.userName = userName;
                  stackUser.userID = userID;
                  stackUser.goldCount = goldCount;
                  stackUser.silverCount = silverCount;
                  stackUser.bronzeCount = bronzeCount;
                  stackUser.imageURL = imageURL;
   
              [self.users insertObject:stackUser atIndex:0];
              }

          //Call the delegated function.
          [self.delegate didFinishRequest:self.users];
      }] resume];
}


@end
