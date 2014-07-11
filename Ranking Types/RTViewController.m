//
//  RTViewController.m
//  Ranking Types
//
//  Created by Benny Tan on 7/8/14.
//  Copyright (c) 2014 Benny Tan. All rights reserved.
//

#import "RTViewController.h"

@interface RTViewController ()

@end

@implementation RTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculatePressed:(UIButton *)sender
{
    float positiveValue = [self.totalPositive.text floatValue];
    float negativeValue = [self.totalNegative.text floatValue];
    float wilsonRanking;
    pnormaldist(0.05);
    wilsonRanking = ci_lower_bound(positiveValue, negativeValue);
    self.wilsonScoreConfInt.text = [NSString stringWithFormat:@"%f",wilsonRanking];
    NSLog(@"%f",ci_lower_bound(positiveValue, negativeValue));
    
    float averageRanking;
    averageRanking = positiveValue /(positiveValue + negativeValue);
    self.averageScore.text = [NSString stringWithFormat:@"%f",averageRanking];
    NSLog(@"%f",averageRanking);
    
}

- (IBAction)resetPressed:(UIButton *)sender
{
    self.totalPositive.text = [NSString stringWithFormat:@""];
    self.totalNegative.text = [NSString stringWithFormat:@""];
    self.wilsonScoreConfInt.text = [NSString stringWithFormat:@"0"];
    self.averageScore.text = [NSString stringWithFormat:@"0"];
}

double pnormaldist(double qn)
{
    double b[] = {1.570796288, 0.03706987906, -0.8364353589e-3, -0.2250947176e-3, 0.6841218299e-5, 0.5824238515e-5, -0.104527497e-5, 0.8360937017e-7, -0.3231081277e-8, 0.3657763036e-10, 0.6936233982e-12};
    
    if(qn < 0.0 || 1.0 < qn)
        return 0.0;
    
    if(qn == 0.5)
        return 0.0;
    
    double w1 = qn;
    if(qn > 0.5)
        w1 = 1.0 - w1;
    double w3 = -log(4.0 * w1 * (1.0 - w1));
    w1 = b[0];
    int i=1;
    for(;i<11;i++)
        w1 += b[i] * pow(w3,i);
    
    if(qn > 0.5)
        return sqrt(w1*w3);
    return -sqrt(w1*w3);
}
//By taking that the total # of vibe ratings are obtained by 'total # of vibe up + total # of vibe downs' for a specific user, we can use the following algorithm to calculate the ranking of each users vibe with respect to each event.  Similarly, this can be scaled up to the event level (ie. hot events, trending vibes).

double ci_lower_bound(int up, int down)
{
    double n=up+down;
    double conf=0.95;
    if(n==0)
        return 0.0;
    double z = pnormaldist(1-(1-conf)/2);
    double phat = 1.0*up/n;
    //return (phat + z*z/(2*n) - z * sqrt((phat*(1-phat)+z*z/(4*n))/n))/(1+z*z/n);
    return ((2*n*phat)+(z*z)-(z*sqrt((z*z)-(1/n)+((4*n*phat)*(1-phat))+(4*phat-2))+1))/(2*(n+(z*z)));
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
