//
//  GWStoreIndexItem.h
//  Comique
//
//  Created by Samuel Gwilym on 21/5/14.
//  Copyright (c) 2014 Samuel Gwilym. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWTableIndexItem : UIView

@property UIImage *icon;
@property NSString *initial;
@property NSIndexPath *indexPath;

-(GWTableIndexItem *)initWithIcon:(UIImage *)iconImage orInitial:(NSString *)letter andIndexPath:(NSIndexPath *)itemIndexPath;

@end
