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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Welcome to Threelow!");
        InputHandler* input = [[InputHandler alloc] init];
        Dice* dice = [[Dice alloc] init];
        Dice* dice2 = [[Dice alloc] init];
        Dice* dice3 = [[Dice alloc] init];
        Dice* dice4 = [[Dice alloc] init];
        Dice* dice5 = [[Dice alloc] init];
        BOOL again = YES;
        NSString* choice = [[NSString alloc] init];
        
        
        while (again) {
            NSLog(@"What do you want to do?:");
            NSLog(@"roll");
            
            choice = [input input];
            
            if ([choice localizedCaseInsensitiveContainsString:@"roll"]) {
                NSLog(@"%@",[dice random]);
                NSLog(@"%@",[dice2 random]);
                NSLog(@"%@",[dice3 random]);
                NSLog(@"%@",[dice4 random]);
                NSLog(@"%@",[dice5 random]);
            }
            
        }
    }
    return 0;
}
