//
//  FlippahViewController.m
//  Flippah
//
//  Created by dpsk on 26.01.13.
//  Copyright (c) 2013 dpsk. All rights reserved.
//

#import "FlippahViewController.h"

@interface FlippahViewController ()
@property (weak, nonatomic) IBOutlet UITextField *flipsLabel;
@property (nonatomic) int flipCount;
@end

@implementation FlippahViewController

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    self.flipCount++;
}

@end
