//
//  MapController.m
//  WingMan
//
//  Created by Thomas Chadwick on 2013-04-12.
//  Copyright (c) 2013 Johann Kriek. All rights reserved.
//

#import "MapController.h"

@implementation MapController

NSMutableArray *restaurants;
NSMutableArray *specials;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (NSMutableArray*)retrieveRestaurants {
    PFQuery *query = [PFQuery queryWithClassName:@"Restaurant"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            restaurants = [objects mutableCopy];
            NSLog(@"Successfully retrieved %d restaurants.", objects.count);
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    return restaurants;
    
}

-(NSMutableArray*)retrieveSpecialsByRestaurant:(NSString *)restaurantName {
    PFQuery *query = [PFQuery queryWithClassName:@"Special"];
    [query whereKey:@"RestaurantName" equalTo:restaurantName];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            specials = [objects mutableCopy];
            NSLog(@"Successfully retrieved %d specials.", objects.count);
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    return specials;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
