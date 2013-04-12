//
//  MapController.h
//  WingMan
//
//  Created by Thomas Chadwick on 2013-04-12.
//  Copyright (c) 2013 Johann Kriek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CustomTypes.h"

@interface MapController : UIView

-(NSMutableArray *)retrieveRestaurants;
-(NSMutableArray *)retrieveSpecialsByRestaurant:(NSString*)restaurantName;

@end
