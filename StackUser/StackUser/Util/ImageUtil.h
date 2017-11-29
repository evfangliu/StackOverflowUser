//
//  ImageUtil.h
//  StackUser
//
//  Created by Fangzhou Liu on 11/28/17.
//  Copyright © 2017 Evan Inc. All rights reserved.
//

#ifndef ImageUtil_h
#define ImageUtil_h
#import <UIKit/UIKit.h>

@interface ImageUtil : NSObject
+(UIImage *) getImageFromURL:(NSString *)url;
+(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName;
+(UIImage *) loadImage:(NSString *)fileName;
@end

#endif /* ImageUtil_h */
