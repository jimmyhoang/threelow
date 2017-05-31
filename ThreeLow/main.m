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
            [gameController.dices addObject:[[Dice alloc] init]];
        }
   
        while (again) {
            NSLog(@"What do you want to do?:");
            NSLog(@"- roll -");
            
            choice = [input input];
            
            if ([choice localizedCaseInsensitiveContainsString:@"roll"]) {
                BOOL hold = YES;
                NSLog(@"Which dice do you want to hold?");
                while (hold) {
                    for (Dice* d in gameController.dices) {
                        NSLog(@"%@",[d random]);
                    }
                    choice = [input input];
                    [gameController holdDie:[choice intValue]];
                    
                    NSLog(@"Do you want to hold another dice? (y/n)");
                    choice = [input input];
                    
                    if ([choice localizedCaseInsensitiveContainsString:@"n"]) {
                        hold = NO;
                        for (Dice* di in gameController.heldDices) {
                            NSLog(@"%@",di.value);
                        }
                    }
                    
                }
            }
            
            
        }
    }
    return 0;
}
