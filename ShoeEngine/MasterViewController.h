//
//  MasterViewController.h
//  ShoeEngine
//
//  Created by Chris Anderson on 4/19/12.
//  Copyright (c) 2012 The Winston Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController {
  NSArray *products;
}

- (void)fetchTweets;

@end
