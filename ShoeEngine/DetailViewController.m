//
//  DetailViewController.m
//  ShoeEngine
//
//  Created by Chris Anderson on 4/19/12.
//  Copyright (c) 2012 The Winston Group. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
  if (self.detailItem) {
    NSDictionary *product = self.detailItem;
    
    NSString *title = [product objectForKey:@"title"];
    NSString *description = [product objectForKey:@"description"];
    NSString *price = [product objectForKey:@"price"];
    
    
    productDescriptionLabel.lineBreakMode = UILineBreakModeWordWrap;
    productDescriptionLabel.numberOfLines = 0;
    
    productNameLabel.text = title;
    productDescriptionLabel.text = description;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *formatted_price = [formatter numberFromString:price];
    
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *string_price = [formatter stringFromNumber:formatted_price];
    
    priceLabel.text = string_price;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
      NSString *imageUrl = [product objectForKey:@"image_link"];
      NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
      
      dispatch_async(dispatch_get_main_queue(), ^{
        productImage.image = [UIImage imageWithData:data];
      });
    });
  }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
  self.detailDescriptionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
