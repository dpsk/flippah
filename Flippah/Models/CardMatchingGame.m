//
//  CardMatchingGame.m
//  Flippah
//
//  Created by dpsk on 31.01.13.
//  Copyright (c) 2013 dpsk. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (readwrite, nonatomic) int score;
@property (readwrite, nonatomic) int mode;
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) { _cards = [[NSMutableArray alloc] init];   }
    return _cards;
}

#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void) flipCardAtIndex:(NSUInteger)index
{
    self.message = nil;
    Card *card = [self cardAtIndex:index];
    NSMutableArray *openCards = [[NSMutableArray alloc] initWithCapacity:self.mode];
    if (card && !card.isUnplayable) {
        if (!card.isFaceUP) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUP && !otherCard.isUnplayable) {
                    [openCards addObject:otherCard];
                }
            }
            if ([openCards count] == (self.mode - 1)) {
                int matchScore = [card match:openCards];
                if (matchScore) {
                    card.unplayable = YES;
                    for (Card *card in openCards) {
                        card.unplayable = YES;
                    }
                    self.score += matchScore * self.mode;
                    self.message = [NSString stringWithFormat:@"Matched cards for %d points", matchScore * self.mode];
                } else {
                    for (Card *card in openCards) {
                        card.faceUp = NO;
                    }
                    self.score -= MISMATCH_PENALTY;
                    self.message = [NSString stringWithFormat:@"Cards don't match! %d point penalty!",
                                    MISMATCH_PENALTY];
                }

            }
            
        }
        self.score -= FLIP_COST;
        if (self.message == nil) self.message = [NSString stringWithFormat:@"Flipped up %@", card.contents];
    }
    card.faceUp = !card.faceUp;
}



- (Card *)cardAtIndex:(NSUInteger)index
{
    return  (index < [self.cards count]) ? self.cards[index] : nil;
}

- (id)initWithCardCount:(NSUInteger)count
                   mode:(NSInteger)mode
              usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                self.cards[i] = card;
                
            } else {
                self = nil;
                break;
            }

        }
        self.mode = mode;
    }
    
    return self;
    
}

@end
