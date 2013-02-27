//
//  CalculatorViewController.h
//  Calculator_iphone
//
//  Created by Hao Sun on 2/26/13.
//  Copyright (c) 2013 Hao Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutlet UILabel *displayLabel;


- (IBAction)clickDigit:(UIButton *)sender;

- (IBAction)clickDot:(id)sender;

- (IBAction)clickClear:(id)sender;

- (IBAction)clickMinus:(id)sender;
- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMultiple:(id)sender;
- (IBAction)clickDivide:(id)sender;

- (IBAction)clickEqual:(id)sender;
- (IBAction)About:(id)sender;

@end
