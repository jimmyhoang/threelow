//
//  GameController.h
//  ThreeLow
//
//  Created by Jimmy Hoang on 2017-05-31.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject

@property (nonatomic, strong) NSMutableArray* dices;
@property (nonatomic, strong) NSMutableArray* heldDices;

-(void)addDice:(Dice*) dice;

@end
