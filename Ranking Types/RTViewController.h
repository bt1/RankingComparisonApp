//
//  RTViewController.h
//  Ranking Types
//
//  Created by Benny Tan on 7/8/14.
//  Copyright (c) 2014 Benny Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *wilsonScoreConfInt;
@property (strong, nonatomic) IBOutlet UILabel *averageScore;
@property (strong, nonatomic) IBOutlet UITextField *totalPositive;
@property (strong, nonatomic) IBOutlet UITextField *totalNegative;
- (IBAction)calculatePressed:(UIButton *)sender;
- (IBAction)resetPressed:(UIButton *)sender;

@end
