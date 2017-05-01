//
//  AAMutableArray.h
//  AANSMutableArray
//
//  Created by Artur on 15.09.16.
//  Copyright © 2016 Artur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AAMutableArray : NSObject

- (id)objectAtIndex:(NSUInteger)index;
- (void)insertObject:(id)object atIndex:(NSUInteger)index;
- (void)deleteObjectAtIndex:(NSUInteger)index;
- (NSUInteger)indexOf:(id)object;

- (NSUInteger)count;

@end
