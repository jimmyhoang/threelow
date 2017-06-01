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
        
        for (int i = 0;i < 5; i++) {
            Dice* dice = [[Dice alloc] init];
            [dice random];
            [self.dices insertObject:dice atIndex:i];
        }

        for (int i = 0;i < 5; i++) {
            [self.heldDices addObject:[[Dice alloc] init]];
        }
    }
    return self;
}

-(void)holdDie:(int)i {
    int index = i - 1;
    Dice* replacement = [[Dice alloc] init];
    replacement.value = 0;
    BOOL exists = [self.heldDices containsObject:self.dices[index]];
    
    if (!exists) {
        [self.heldDices replaceObjectAtIndex:index withObject:self.dices[index]];
        [self.dices replaceObjectAtIndex:index withObject:replacement];
    } else  {
        [self.heldDices removeObject:self.dices[index]];
    }
}


-(void)resetDie {
    [self.heldDices removeAllObjects];
}

-(void)score {
    int score = 0;

    for (Dice* d in self.heldDices) {
        if (d.value == 3) {
            score += 0;
        } else if ((d.value != 0)) {
            score += d.value;
        }
    }
        NSLog(@"Score:%d",score);

}

-(void)printDice {
    for (Dice* d in self.dices) {
        if (d.value == 0) {
            NSLog(@"[XX]");
        } else {
            NSLog(@"[%@]",[d symbol:d.value]);
        }
    }
}

-(void)printheldDice {
    for (Dice* d in self.heldDices) {
        if (d.value == 0) {
            NSLog(@"[XX]");
        } else {
            NSLog(@"[%@]",[d symbol:d.value]);
            
        }
    }
    
}
@end

