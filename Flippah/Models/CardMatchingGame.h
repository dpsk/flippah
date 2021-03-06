//
//  CardMatchingGame.h
//  Flippah
//
//  Created by dpsk on 31.01.13.
//  Copyright (c) 2013 dpsk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface CardMatchingGame : NSObject

// designated initializer
- (id)initWithCardCount:(NSUInteger)count
                   mode:(NSInteger)mode
              usingDeck:(Deck *)deck;
- (void)flipCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (readonly, nonatomic) int score;
@property (readonly, nonatomic) int mode;
@property (nonatomic) NSString *message;

@end
