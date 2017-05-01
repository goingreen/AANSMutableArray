//
//  AAMutableArray.m
//
//  Created by Artur on 15.09.16.
//  Copyright © 2016 Artur. All rights reserved.
//

#import "AAMutableArray.h"
#import "TreapNode.h"

@interface AAMutableArray ()

@property (nonatomic, strong) TreapNode *root;

@end

@implementation AAMutableArray

- (id)objectAtIndex:(NSUInteger)index {
  TreapNode *objNode = [self.root searchIndex:index];
  return objNode->object;
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
  TreapNode *left, *right;
  [self split:self.root into:&left and:&right byKey:index];
  TreapNode *nodeWithObj = [[TreapNode alloc] initWithObject:object];
  self.root = [self merge:[self merge:left and:nodeWithObj] and:right];
}

- (void)deleteObjectAtIndex:(NSUInteger)index {
  TreapNode *left, *mid, *right;
  [self split:self.root into:&left and:&right byKey:index];
  [self split:right into:&mid and:&right byKey:index];
  self.root = [self merge:left and:right];
}

- (NSUInteger)indexOf:(id)object {
  return [self.root searchObject:object];
}

- (NSUInteger)count {
  return self.root->size;
}

- (TreapNode *)merge:(TreapNode *)left and:(TreapNode *)right {
  if (left == nil) {
    [right update];
    return right;
  }
  
  if (right == nil ) {
    [left update];
    return left;
  }
  
  if (left->prior > right->prior) {
    left->right = [self merge:left->right and:right];
    [left update];
    return left;
  } else {
    right->left = [self merge:left and:right->left];
    [right update];
    return right;
  }
}

- (void)split:(TreapNode *)root into:(TreapNode **)left and:(TreapNode **)right byKey:(NSUInteger)key {
  if (root == nil) {
    left = nil;
    right = nil;
    return;
  }
  
  NSUInteger currSize = (root->left == nil) ? 0 : root->left->size;
  
  if (currSize < key) {
    TreapNode *tempRight;
    [self split:root->right into:&tempRight and:right byKey:key - currSize - 1];
    root->right = tempRight;
    *left = root;
  } else {
    TreapNode *tempLeft;
    [self split:root->left into:left and:&tempLeft byKey:key];
    root->left = tempLeft;
    *right = root;
  }
  [root update];
}

@end
