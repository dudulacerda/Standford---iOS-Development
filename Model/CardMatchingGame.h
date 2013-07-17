//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Eduardo Lacerda on 16/07/13.
//  Copyright (c) 2013 Eduardo Lacerda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (readonly, strong, nonatomic) NSString *lastCall;
@property (nonatomic, readonly) int score;


-(id) initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck;

-(void)flipCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;

@end
