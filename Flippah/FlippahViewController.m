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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation FlippahViewController

- (PlayingCardDeck *) deck
{
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (void) setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.deck drawRandomCard];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
    }
}

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
