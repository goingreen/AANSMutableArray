//
//  TreapNode.m
//  AANSMutableArray
//
//  Created by Artur on 15.09.16.
//  Copyright © 2016 Artur. All rights reserved.
//

#import "TreapNode.h"


@implementation TreapNode

- (instancetype)initWithObject:(id)obj {
  self = [super init];
  if (self) {
    object = obj;
    prior = (NSInteger)arc4random();
    size = 0;
  }
  return self;
}

- (TreapNode *)searchIndex:(NSUInteger)index {
  NSUInteger currSize = (left == nil) ? 0 : left->size;
  
  if (currSize == index)
    return self;
  
  if (currSize < index)
    return [right searchIndex: index - currSize - 1];
  else
    return [left searchIndex:index];
}

- (NSUInteger)searchObject:(id)obj {
  NSUInteger search = [left searchObject:obj];
  if (search != NSNotFound)
    return search;
  if ([object isEqual:obj])
    return size;
  search = [right searchObject:obj];
  if (search != NSNotFound) {
    NSUInteger currSize = (left == nil) ? 0 : left->size;
    search += currSize + 1;
    return search;
  }
  return NSNotFound;
}

- (void)update {
  NSUInteger leftSize = (left == nil) ? 0 : left->size;
  NSUInteger rightSize = (right == nil) ? 0 : right->size;
  
  size = leftSize + 1 + rightSize;
}

@end
