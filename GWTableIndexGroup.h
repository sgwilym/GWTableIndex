//
//  GWStoreIndexGroup.h
//  Comique
//
//  Created by Samuel Gwilym on 21/5/14.
//  Copyright (c) 2014 Samuel Gwilym. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWTableIndexGroup : UIView

@property NSArray *indexes;
@property UIImage *icon;

-(GWTableIndexGroup *)initWithIndexes:(NSArray *)indexes andIcon:(UIImage *)iconImage;

@end
