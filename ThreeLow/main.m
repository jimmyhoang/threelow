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
            [gameController addDice:dice];
        }
   
        while (again) {
            NSLog(@"What do you want to do?:");
            NSLog(@"- roll -");
            
            choice = [input input];
            
            if ([choice localizedCaseInsensitiveContainsString:@"roll"]) {
                for (int i = 0; i < 5; i++) {
                    NSLog(@"%@",[gameController.dices[i] random]);
                }
            }
            
        }
    }
    return 0;
}
