//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Eduardo Lacerda on 10/07/13.
//  Copyright (c) 2013 Eduardo Lacerda. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(id)init
{
    self = [super init];
    
    if (self) {
        
        //L2 pag 30
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank<=[PlayingCard maxRank]; rank++) {
                
                PlayingCard *card = [[PlayingCard alloc] init];
                [card setRank:rank];
                [card setSuit:suit];
                [self addCard:card atTop:YES]; //adiciona a carta(card) ao topo do Array cards, herdado de Deck.
            }
        }
    }
    
    return self;
}

@end
