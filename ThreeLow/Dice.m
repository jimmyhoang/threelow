//
//  Dice.m
//  ThreeLow
//
//  Created by Jimmy Hoang on 2017-05-31.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(NSString* )random {
    int value = arc4random_uniform(6)+1;
    NSString* diceSide = [[NSString alloc] init];
    
    
    switch (value) {
        case 1: {
            diceSide = [NSString stringWithFormat:@"⚀"];
            break;
        }
        case 2: {
            diceSide = [NSString stringWithFormat:@"⚁"];
            break;
        }
        case 3: {
            diceSide = [NSString stringWithFormat:@"⚂"];
            break;
        }
        case 4: {
            diceSide = [NSString stringWithFormat:@"⚃"];
            break;
        }
        case 5: {
            diceSide = [NSString stringWithFormat:@"⚄"];
            break;
        }
        case 6: {
            diceSide = [NSString stringWithFormat:@"⚅"];
            break;
        }
    }
    return diceSide;
}

@end
