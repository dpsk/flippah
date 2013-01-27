//
//  FlippahViewController.m
//  Flippah
//
//  Created by dpsk on 26.01.13.
//  Copyright (c) 2013 dpsk. All rights reserved.
//

#import "FlippahViewController.h"
#import "PlayingCardDeck.h"

@interface FlippahViewController ()
@property (weak, nonatomic) IBOutlet UITextField *flipsLabel;
@property (strong, nonatomic) PlayingCardDeck *deck;
@property (nonatomic) int flipCount;
@end

@implementation FlippahViewController

- (PlayingCardDeck *) deck
{
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
    if (!sender.isSelected) {
        [sender setTitle:[self.deck drawRandomCard].contents
                forState:UIControlStateSelected];
    }
    
    sender.selected = !sender.isSelected;
    
    self.flipCount++;
}

@end
