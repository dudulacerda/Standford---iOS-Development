//
//  Deck.h
//  Matchismo
//
//  Created by Eduardo Lacerda on 10/07/13.
//  Copyright (c) 2013 Eduardo Lacerda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"


@interface Deck : NSObject

- (void) addCard:(Card *)card atTop:(BOOL)isTop;

- (Card *) drawRandomCard;


@end
