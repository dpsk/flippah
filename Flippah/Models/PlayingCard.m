//
//  PlayingCard.m
//  Flippah
//
//  Created by dpsk on 27.01.13.
//  Copyright (c) 2013 dpsk. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *) contents
{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    BOOL matched = YES;
    
    for (PlayingCard *card in otherCards) {
        if (![card.suit isEqualToString:self.suit]) {
            matched = NO;
        }
    }
    if (matched) {
        score = 1;
    } else {
        matched = YES;
        for (PlayingCard *card in otherCards) {
            if (!(card.rank == self.rank)) {
                matched = NO;
            }
        }
        if (matched) {
            score = 4;
        }
    }
    
    return score;
}

@synthesize suit = _suit;

+ (NSArray *) validSuits
{
    return @[@"♠",@"♣",@"♥",@"♦"];
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *) rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank { return [self rankStrings].count-1; }

- (void) setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
