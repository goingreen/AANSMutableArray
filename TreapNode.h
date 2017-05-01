//
//  TreapNode.h
//  AANSMutableArray
//
//  Created by Artur on 15.09.16.
//  Copyright © 2016 Artur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreapNode : NSObject {
@public
  TreapNode *left;
  TreapNode *right;
  NSInteger prior;
  NSUInteger size;
  id object;
}

- (instancetype)initWithObject:(id)object;
- (TreapNode *)searchIndex:(NSUInteger)index;
- (NSUInteger)searchObject:(id)obj;
- (void)update;

@end
