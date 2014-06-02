//
//  GWStoreIndexItem.m
//  Comique
//
//  Created by Samuel Gwilym on 21/5/14.
//  Copyright (c) 2014 Samuel Gwilym. All rights reserved.
//

#import "GWTableIndexItem.h"

@implementation GWTableIndexItem

- (GWTableIndexItem *)initWithIcon:(UIImage *)iconImage orInitial:(NSString *)initial andIndexPath:(NSIndexPath *)indexPath
{
    self = [super init];
    if (self) {
        
        // Set properties
        _icon = iconImage;
        _initial = initial;
        _indexPath = indexPath;
        
        // Sort out the view
        NSDictionary *views;
        
        if (_icon != nil) {
            UIImageView *indexIconView = [[UIImageView alloc] initWithImage:iconImage];
            indexIconView.translatesAutoresizingMaskIntoConstraints = NO;
            [self addSubview:indexIconView];
            views = NSDictionaryOfVariableBindings(self, indexIconView);
        }
        else {
            UILabel *indexIconView = [[UILabel alloc] init];
            indexIconView.text = initial;
            indexIconView.textAlignment = NSTextAlignmentCenter;
            indexIconView.font = [UIFont boldSystemFontOfSize:12];
            indexIconView.translatesAutoresizingMaskIntoConstraints = NO;
            [self addSubview:indexIconView];
            views = NSDictionaryOfVariableBindings(self, indexIconView);
        }
        
        // Set up constraints
        NSMutableArray *tempViewConstraints = [NSMutableArray new];
        NSArray *generatedConstraints;
        
        generatedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[indexIconView(15)]|" options:0 metrics:nil views:views];
        [tempViewConstraints addObjectsFromArray:generatedConstraints];
        generatedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[indexIconView(15)]|" options:0 metrics:nil views:views];
        [tempViewConstraints addObjectsFromArray:generatedConstraints];
        
        [self addConstraints:tempViewConstraints];
        
    }
    
    return self;
}

@end
