//
//  Dice.h
//  ThreeLow
//
//  Created by Jimmy Hoang on 2017-05-31.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property (nonatomic) int value;

-(int)random;
-(NSString*)symbol:(int)dice;

@end
