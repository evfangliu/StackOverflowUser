//
//  StackUser.h
//  StackUser
//
//  Created by Fangzhou Liu on 11/28/17.
//  Copyright © 2017 Evan Inc. All rights reserved.
//

#ifndef StackUser_h
#define StackUser_h

#import <Foundation/Foundation.h>
@interface StackUser : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *imageURL;
@property (nonatomic, assign) NSInteger userID;
@property (nonatomic, assign) NSInteger goldCount;
@property (nonatomic, assign) NSInteger silverCount;
@property (nonatomic, assign) NSInteger bronzeCount;

@end

#endif /* StackUser_h */
