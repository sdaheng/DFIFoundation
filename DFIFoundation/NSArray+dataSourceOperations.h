//
//  NSArray+dataSourceOperation.h
//  DFITableViewConfigration
//
//  Created by SDH on 12/17/15.
//  Copyright © 2015 sdaheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (dataSourceOperations)

- (NSArray *)addRowObject:(id)object
                inSection:(NSUInteger)section;

- (NSArray *)addRowsObjects:(NSArray *)objects
                  inSection:(NSUInteger)section;

- (NSArray *)insertRowObject:(id)object
                     atIndex:(NSUInteger)index
                   inSection:(NSUInteger)section;

- (NSArray *)insertRowsObjects:(NSArray *)objects
                     fromIndex:(NSUInteger)index
                     inSection:(NSUInteger)section;

- (NSArray *)removeRowObject:(id)object
                   inSection:(NSUInteger)section;

- (NSArray *)removeRowObjectAtIndex:(NSUInteger)index
                          inSection:(NSUInteger)section;

- (NSArray *)removeRowsObjects:(NSArray *)objects
                     inSection:(NSUInteger)section;

- (NSArray *)insertSectionObject:(NSArray *)object
                  atSectionIndex:(NSUInteger)sectionIndex;

- (NSArray *)removeSectionObject:(NSArray *)object;

- (NSArray *)removeSectionObjectAtSectionIndex:(NSUInteger)sectionIndex;

@end
