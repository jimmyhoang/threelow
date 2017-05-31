//
//  GameController.m
//  ThreeLow
//
//  Created by Jimmy Hoang on 2017-05-31.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dices = [[NSMutableArray alloc] init];
        _heldDices = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)holdDie:(int)i {
    int index = i - 1;
    [self.heldDices addObject:self.dices[index]];
    [self.dices removeObjectAtIndex:index];
}

@end
