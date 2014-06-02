//
//  GWStoreIndex.h
//  Comique
//
//  Created by Samuel Gwilym on 21/5/14.
//  Copyright (c) 2014 Samuel Gwilym. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GWTableIndexDataSource <NSObject>

-(NSArray *)storeIndexGroups;

@end

@protocol GWTableIndexDelegate <NSObject>

- (void)jumpToSectionWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface GWTableIndex : UIView

@property id <GWTableIndexDataSource> dataSource;
@property id <GWTableIndexDelegate> delegate;
@property NSArray *indexGroups;

- (void)reloadIndex;
- (void)layoutIndexGroups;

@end
