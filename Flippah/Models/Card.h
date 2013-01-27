//
//  Card.h
//  Flippah
//
//  Created by dpsk on 27.01.13.
//  Copyright (c) 2013 dpsk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isFaceUP) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;


- (int)match:(NSArray *)otherCards;
@end
