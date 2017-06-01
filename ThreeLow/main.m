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
        
        
        for (int i = 0;i < 5; i++) {
            Dice* dice = [[Dice alloc] init];
            [gameController.dices insertObject:dice atIndex:i];
            [dice random];
        }
        
        
        while (again) {
            NSLog(@"What do you want to do?:");
            NSLog(@"- roll -");
            NSLog(@"- unhold -");
            NSLog(@"- reset -");
            
            choice = [input input];
            
            if ([choice localizedCaseInsensitiveContainsString:@"roll"]) {
                BOOL hold = YES;
                for (Dice* d in gameController.dices) {
                    if (d.value == 0) {
                        NSLog(@"[XX]");
                    } else {
                        NSLog(@"%@",[d symbol:d.value]);
                    }
                    
                }
                while (hold) {
                    NSLog(@"Which dice do you want to hold?");
                    choice = [input input];
                    [gameController holdDie:[choice intValue]];
                    NSLog(@"Do you want to hold another dice? (y/n)");
                    choice = [input input];
                    if ([choice localizedCaseInsensitiveContainsString:@"n"]) {
                        hold = NO;
                        for (Dice* d in gameController.heldDices) {
                            if (d.value == 0) {
                                NSLog(@"[XX]");
                            } else {
                                NSLog(@"[%@]",[d symbol:d.value]);
                            }
                        }
                    } else {
                        for (Dice* d in gameController.dices) {
                            if (d.value == 0) {
                                NSLog(@"[XX]");
                            } else {
                                NSLog(@"[%@]",[d symbol:d.value]);
                                
                            }
                        }
                      }
                    
                }
            } else if ([choice localizedCaseInsensitiveContainsString:@"unhold"]) {
                do {
                    for (Dice* d in gameController.heldDices) {
                        if (d.value == 0) {
                            NSLog(@"[XX]");
                        } else {
                            NSLog(@"[%@]",[d symbol:d.value]);
                            
                        }
                    }
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
