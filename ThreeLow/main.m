//
//  main.m
//  ThreeLow
//
//  Created by Jimmy Hoang on 2017-05-31.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Welcome to Threelow!");
        InputHandler* input = [[InputHandler alloc] init];
        GameController *gameController = [[GameController alloc] init];
        BOOL again = YES;
        NSString* choice = [[NSString alloc] init];
        
        
        while (again) {
            NSLog(@"What do you want to do?:");
            NSLog(@"- roll -");
            NSLog(@"- unhold -");
            NSLog(@"- reset -");
            
            choice = [input input];
            
            if ([choice localizedCaseInsensitiveContainsString:@"roll"]) {
                BOOL hold = YES;
                [gameController printDice];
                
                while (hold) {
                    NSLog(@"Which dice do you want to hold?");
                    choice = [input input];
                    [gameController holdDie:[choice intValue]];
                    NSLog(@"Do you want to hold another dice? (y/n)");
                    choice = [input input];
                    if ([choice localizedCaseInsensitiveContainsString:@"n"]) {
                        hold = NO;
                        [gameController printheldDice];

                    } else {
                        [gameController printDice];
                    }
                    
                }
            } else if ([choice localizedCaseInsensitiveContainsString:@"unhold"]) {
                do {
                    [gameController printheldDice];
                    NSLog(@"Which dice do you want to unhold?");
                    choice = [input input];
                    [gameController holdDie:[choice intValue]];
                } while (!gameController.heldDices || [gameController.heldDices count]);
                
                NSLog(@"No held dices");
                
                
            } else if ([choice localizedCaseInsensitiveContainsString:@"reset"]) {
                [gameController resetDie];
                NSLog(@"All held dices reset!");
            }

            [gameController score];

        }
    }
    return 0;
}
