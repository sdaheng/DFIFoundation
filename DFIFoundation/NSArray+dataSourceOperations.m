//
//  NSArray+dataSourceOperation.m
//  DFITableViewConfigration
//
//  Created by SDH on 12/17/15.
//  Copyright © 2015 sdaheng. All rights reserved.
//

#import "NSArray+dataSourceOperations.h"

@implementation NSArray (dataSourceOperations)

- (NSArray *)addRowObject:(id)object inSection:(NSUInteger)section {
    
    return [self addRowsObjects:@[ object ]
                      inSection:section];
}

- (NSArray *)addRowsObjects:(NSArray *)objects inSection:(NSUInteger)section {
    
    NSMutableArray *tempDataSourceArray = [self mutableCopy];
    
    if (tempDataSourceArray.count >= section) {
        NSMutableArray *tempRowObjectArray = [self[section] mutableCopy];
        
        [tempRowObjectArray addObjectsFromArray:objects];
        
        [tempDataSourceArray replaceObjectAtIndex:section
                                       withObject:[tempRowObjectArray copy]];
    }
    
    return [tempDataSourceArray copy];
}

- (NSArray *)insertRowObject:(id)object
                     atIndex:(NSUInteger)index
                   inSection:(NSUInteger)section {
    
    return [self insertRowsObjects:@[ object ]
                         fromIndex:index
                         inSection:section];
}

- (NSArray *)removeRowObject:(id)object inSection:(NSUInteger)section {
    return [self removeRowsObjects:@[ object ]
                        atRowIndex:NSNotFound
                         inSection:section];
}

- (NSArray *)removeRowObjectAtIndex:(NSUInteger)index
                          inSection:(NSUInteger)section {
    return [self removeRowsObjects:nil
                        atRowIndex:index
                         inSection:section];
}

- (NSArray *)removeRowsObjects:(NSArray *)objects inSection:(NSUInteger)section {
    return [self removeRowsObjects:objects
                        atRowIndex:NSNotFound
                         inSection:section];
}

- (NSArray *)removeRowsObjects:(NSArray *)objects
                    atRowIndex:(NSUInteger)rowIndex
                     inSection:(NSUInteger)section {
    
    NSMutableArray *tempDataSourceArray = [self mutableCopy];
    
    NSMutableArray *tempDataSourceRowArray = [tempDataSourceArray[section] mutableCopy];
    
    if (rowIndex != NSNotFound) {
        [tempDataSourceRowArray removeObjectAtIndex:rowIndex];
    } else {
        [tempDataSourceRowArray removeObjectsInArray:objects];
    }
    
    [tempDataSourceArray replaceObjectAtIndex:section
                                   withObject:[tempDataSourceRowArray copy]];
    
    return [tempDataSourceArray copy];
}

- (NSArray *)insertRowsObjects:(NSArray *)objects
                     fromIndex:(NSUInteger)index
                     inSection:(NSUInteger)section {
    
    NSMutableArray *tempDataSourceArray = [self mutableCopy];
    
    if (tempDataSourceArray.count >= section) {
        NSMutableArray *tempRowObjectArray = [self[section] mutableCopy];
        NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(index, objects.count)];
        [tempRowObjectArray insertObjects:objects
                                atIndexes:indexes];
        
        [tempDataSourceArray replaceObjectAtIndex:section
                                       withObject:[tempRowObjectArray copy]];
    }
    
    return [tempDataSourceArray copy];
}

- (NSArray *)insertSectionObject:(NSArray *)object
                  atSectionIndex:(NSUInteger)sectionIndex {
    
    NSMutableArray *tempDataSourceArray = [self mutableCopy];
    
    if (tempDataSourceArray.count >= sectionIndex) {
        
        [tempDataSourceArray insertObject:[object copy]
                                  atIndex:sectionIndex];
    }
    
    return [tempDataSourceArray copy];
}

- (NSArray *)removeSectionObject:(NSArray *)object {
    return [self removeSectionObject:object
                      atSectionIndex:NSNotFound];
}

- (NSArray *)removeSectionObjectAtSectionIndex:(NSUInteger)sectionIndex {
    return [self removeSectionObject:nil
                      atSectionIndex:sectionIndex];
}

- (NSArray *)removeSectionObject:(NSArray *)object
                  atSectionIndex:(NSUInteger)sectionIndex {
    
    NSMutableArray *tempDataSourceArray = [self mutableCopy];
    
    if (tempDataSourceArray.count >= sectionIndex) {
        if (object) {
            [tempDataSourceArray removeObject:object];
        } else if (sectionIndex != NSNotFound) {
            [tempDataSourceArray removeObjectAtIndex:sectionIndex];
        }
    }
    
    return [tempDataSourceArray copy];
}

@end
