//
//  PlayingCard.h
//  Flippah
//
//  Created by dpsk on 27.01.13.
//  Copyright (c) 2013 dpsk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSDictionary *) suitDictionary;
+ (NSUInteger) maxRank;

@end
