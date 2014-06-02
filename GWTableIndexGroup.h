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
@property UIImage *capIcon;

-(GWTableIndexGroup *)initWithIndexes:(NSArray *)groupIndexes andCapIcon:(UIImage *)capIconImage;

@end
