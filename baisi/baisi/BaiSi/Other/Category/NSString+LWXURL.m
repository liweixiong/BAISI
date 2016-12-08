//
//  NSString+LWXURL.m
//  baisi
//
//  Created by Mac on 16/12/8.
//  Copyright © 2016年 gzjbwm. All rights reserved.
//

#import "NSString+LWXURL.h"

@implementation NSString (LWXURL)
-(NSURL*)lwx_url{
    return [NSURL URLWithString:self];
}
@end
