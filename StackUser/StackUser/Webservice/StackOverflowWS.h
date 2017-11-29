//
//  StackOverflowWS.h
//  StackUser
//
//  Created by Fangzhou Liu on 11/28/17.
//  Copyright © 2017 Evan Inc. All rights reserved.
//

#ifndef StackOverflowWS_h
#define StackOverflowWS_h


#import <Foundation/Foundation.h>
@protocol StackOverflowResponseDelegate <NSObject>
@required
//we force an implementation of this so that we can pick up on the response.
-(void)didFinishRequest:(NSMutableArray *)response;
@end

@interface StackOverFlowWS : NSObject
@property (nonatomic, copy) NSString *url;
@property (nonatomic, retain) NSMutableArray *users;
@property (nonatomic, weak) NSObject < StackOverflowResponseDelegate > *delegate;

-(void)loadUsersFromURL:(NSString *) url;
@end

#endif /* StackOverflowWS_h */
