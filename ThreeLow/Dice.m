//
//  Dice.m
//  ThreeLow
//
//  Created by Jimmy Hoang on 2017-05-31.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(int)random {
    int random = arc4random_uniform(6)+1;
    self.value = random;
    return random;
}

-(NSString *)symbol:(int)dice {
    NSString* diceSide = [[NSString alloc] init];
    
    switch (dice) {
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
