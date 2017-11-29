//
//  ImageUtil.m
//  StackUser
//
//  Created by Fangzhou Liu on 11/28/17.
//  Copyright © 2017 Evan Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageUtil.h"

@implementation ImageUtil
+(NSString *)documentPathForFileName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    return [documentsPath stringByAppendingString:[NSString stringWithFormat:@"/%@", [name stringByAppendingString: @".png"]]];
}

+(UIImage *) getImageFromURL:(NSString *)url
{
    UIImage *image;
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    image = [UIImage imageWithData:data];
    return image;
}
+(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName
{
    [UIImagePNGRepresentation(image) writeToFile:[self documentPathForFileName:imageName] options:NSAtomicWrite error:nil];
}
+(UIImage *) loadImage:(NSString *)fileName
{
    UIImage *result = [UIImage imageWithContentsOfFile:[self documentPathForFileName:fileName]];
    return result;
}


@end
