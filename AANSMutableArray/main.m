//
//  main.m
//  AANSMutableArray
//
//  Created by Artur on 15.09.16.
//  Copyright © 2016 Artur. All rights reserved.
//

#define TICK   startTime = [NSDate date]
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow])

#import <Foundation/Foundation.h>
#import "AAMutableArray.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    NSDate *startTime;
    
    AAMutableArray *array = [[AAMutableArray alloc] init];
    NSMutableArray *stdArray = [NSMutableArray array];
    
    int indexesToInsert[1000000];
    int indexesToLookup[1000000];
    
    for (int i = 0; i < 1000000; i++) {
      indexesToInsert[i] = arc4random_uniform(i);
      indexesToLookup[i] = arc4random_uniform(1000000);
    }
    
    TICK;
    for (int i = 0; i < 1000000; i++)
      [array  insertObject:[NSString stringWithFormat:@"%d", i] atIndex:indexesToInsert[i]];
    NSLog(@"INSERTS My perfomance:");
    TOCK;
    
    
    TICK;
    for (int i = 0; i < 1000000; i++)
      [stdArray insertObject:[NSString stringWithFormat:@"%d", i] atIndex:indexesToInsert[i]];
    NSLog(@"INSERTS Std perfomance:");
    TOCK;
    
    TICK;
    for (int i = 0; i < 1000000; i++)
      [array  objectAtIndex:indexesToLookup[i]];
    NSLog(@"LOOKUP My perfomance:");
    TOCK;
    
    TICK;
    for (int i = 0; i < 1000000; i++)
      [stdArray  objectAtIndex:indexesToLookup[i]];
    NSLog(@"LOOKUP Std perfomance:");
    TOCK;
    
  }
    return 0;
}
