//
//  DetailViewController.h
//  ShoeEngine
//
//  Created by Chris Anderson on 4/19/12.
//  Copyright (c) 2012 The Winston Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController {
  IBOutlet UIImageView *productImage;
  IBOutlet UILabel *productNameLabel;
  IBOutlet UILabel *productDescriptionLabel;
  IBOutlet UILabel *priceLabel;
}

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
