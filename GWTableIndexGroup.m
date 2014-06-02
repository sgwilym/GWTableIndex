//
//  GWStoreIndexGroup.m
//  Comique
//
//  Created by Samuel Gwilym on 21/5/14.
//  Copyright (c) 2014 Samuel Gwilym. All rights reserved.
//

#import "GWTableIndexGroup.h"
#import "GWTableIndexItem.h"

@implementation GWTableIndexGroup

- (GWTableIndexGroup *)initWithIndexes:(NSArray *)indexes andIcon:(UIImage *)iconImage
{
    self = [super init];
    if (self) {
        
        _indexes = indexes;
        _icon = iconImage;
        
        __block id itemAbove = nil;
        
        // Create a cap icon image if necessary
        if (_icon != nil) {
            UIImageView *capIconImageView = [[UIImageView alloc] initWithImage:iconImage];
            
            [self addSubview:capIconImageView];
            capIconImageView.translatesAutoresizingMaskIntoConstraints = NO;
            
            NSArray *generatedConstraints;
            NSMutableArray *tempViewConstraints = [NSMutableArray new];
            
            generatedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[capIconImageView(15)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(capIconImageView)];
            [tempViewConstraints addObjectsFromArray:generatedConstraints];
            generatedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[capIconImageView(15)]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(capIconImageView)];
            [tempViewConstraints addObjectsFromArray:generatedConstraints];
            
            [self addConstraints:tempViewConstraints];
            
            itemAbove = capIconImageView;
        }
        
        // Loop through all index items, setting their constraints
        [indexes enumerateObjectsUsingBlock:^(GWTableIndexItem *item, NSUInteger i, BOOL *stop) {
            
            NSArray *generatedConstraints;
            NSMutableArray *tempViewConstraints = [NSMutableArray new];
            
            [self addSubview:item];
            item.translatesAutoresizingMaskIntoConstraints = NO;
            
            NSString *verticalConstraintFormatString;
            NSDictionary *verticalBindingsDictionary;
            
            // If there is a capIcon there should be an itemAbove, adjust format string accordingly
            if (itemAbove != nil) {
                verticalConstraintFormatString = @"V:[itemAbove]-1-[item]";
                verticalBindingsDictionary = NSDictionaryOfVariableBindings(itemAbove, item);
            }
            else {
                verticalConstraintFormatString = @"V:|[item]";
                verticalBindingsDictionary = NSDictionaryOfVariableBindings(item);
            }
            
            // If the index item is the last one, set the constraint to be flush with the bottom of the superview
            if (i == [indexes count] - 1) {
                verticalConstraintFormatString = [verticalConstraintFormatString stringByAppendingString:@"|"];
            }
            
            generatedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:verticalConstraintFormatString options:0 metrics:nil views:verticalBindingsDictionary];
            [tempViewConstraints addObjectsFromArray:generatedConstraints];
            generatedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[item]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(item)];
            [tempViewConstraints addObjectsFromArray:generatedConstraints];
            
            [self addConstraints:tempViewConstraints];
            
            itemAbove = item;
            
        }];
        
    }
    return self;
}

@end
