//
//  GWStoreIndex.m
//  Comique
//
//  Created by Samuel Gwilym on 21/5/14.
//  Copyright (c) 2014 Samuel Gwilym. All rights reserved.
//

#import "GWTableIndex.h"
#import "GWTableIndexGroup.h"
#import "GWTableIndexItem.h"

@implementation GWTableIndex

-(void)reloadIndex
{
    // Remove any previously loaded subviews
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    _indexGroups = [_dataSource storeIndexGroups];
    [self layoutIndexGroups];
}

- (void)layoutIndexGroups
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *indexGroupsCenteredView = [[UIView alloc] init];
    indexGroupsCenteredView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:indexGroupsCenteredView];
    
    // Set up constraints for vertically centered view
    NSMutableArray *tempViewConstraints = [NSMutableArray new];
    
    NSLayoutConstraint *verticalCenterConstraint = [NSLayoutConstraint constraintWithItem:indexGroupsCenteredView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [tempViewConstraints addObject:verticalCenterConstraint];
    NSArray *horizontalFlushConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[indexGroupsCenteredView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(indexGroupsCenteredView)];
    [tempViewConstraints addObjectsFromArray:horizontalFlushConstraints];
    
    [self addConstraints:tempViewConstraints];
    
    __block GWTableIndexGroup *groupAbove = nil;
    
    // Loop through all index group items, setting their constraints
    [_indexGroups enumerateObjectsUsingBlock:^(GWTableIndexGroup *group, NSUInteger i, BOOL *stop) {
       
        if ([group.indexes count] > 0) {
            NSArray *generatedConstraints;
            NSMutableArray *tempViewConstraints = [NSMutableArray new];
            
            [indexGroupsCenteredView addSubview:group];
            
            NSString *verticalConstraintFormatString;
            NSDictionary *verticalBindingsDictionary;
            
            // If there is a capIcon there should be an itemAbove, adjust format string accordingly
            if (groupAbove != nil) {
                verticalConstraintFormatString = @"V:[groupAbove]-10-[group]";
                verticalBindingsDictionary = NSDictionaryOfVariableBindings(groupAbove, group);
            }
            else {
                verticalConstraintFormatString = @"V:|-10-[group]";
                verticalBindingsDictionary = NSDictionaryOfVariableBindings(group);
            }
            
            // If the index item is the last one, set the constraint to be flush with the bottom of the superview
            if (i == [_indexGroups count] - 1) {
                verticalConstraintFormatString = [verticalConstraintFormatString stringByAppendingString:@"|"];
            }
            
            generatedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:verticalConstraintFormatString options:0 metrics:nil views:verticalBindingsDictionary];
            [tempViewConstraints addObjectsFromArray:generatedConstraints];
            generatedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[group]-1-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(group)];
            [tempViewConstraints addObjectsFromArray:generatedConstraints];
            
            group.translatesAutoresizingMaskIntoConstraints = NO;
            
            [indexGroupsCenteredView addConstraints:tempViewConstraints];
            
            groupAbove = group;
        }
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIView *item = [self hitTest:[[touches anyObject] locationInView:self] withEvent:nil];
    if ([item isKindOfClass:[GWTableIndexItem class]]) {
        GWTableIndexItem *indexItem = (GWTableIndexItem *)item;
        [_delegate jumpToSectionWithIndexPath:indexItem.indexPath];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIView *item = [self hitTest:[[touches anyObject] locationInView:self] withEvent:nil];
    if ([item isKindOfClass:[GWTableIndexItem class]]) {
        GWTableIndexItem *indexItem = (GWTableIndexItem *)item;
        [_delegate jumpToSectionWithIndexPath:indexItem.indexPath];
    }
}

@end
