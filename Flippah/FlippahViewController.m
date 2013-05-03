//
//  FlippahViewController.m
//  Flippah
//
//  Created by dpsk on 26.01.13.
//  Copyright (c) 2013 dpsk. All rights reserved.
//

#import "FlippahViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "Toast+UIView.h"

@interface FlippahViewController ()
@property (weak, nonatomic) IBOutlet UITextField *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeSwitcher;
@property (strong, nonatomic) CardMatchingGame *game;
@end

@implementation FlippahViewController

- (IBAction)dealButton:(id)sender {
    self.game = nil;
    [self.view makeToast: @"New game has been started!"
                duration:1.5
                position:@"top"];

    self.gameModeSwitcher.enabled = YES;
    [self updateUI];
}

- (IBAction)changeGameMode:(UISegmentedControl *)sender
{
    self.game = nil;
}

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                               mode:[self.gameModeSwitcher selectedSegmentIndex] + 2
                                                          usingDeck:[[PlayingCardDeck alloc] init] ];
    return _game;
}

- (void) setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void) updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUP;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        if (self.game.message) {
            [self.view makeToast:self.game.message
                        duration:2.0
                        position:@"top"];

        }
    }
}

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    self.gameModeSwitcher.enabled = NO;
    [self updateUI];
}

@end
