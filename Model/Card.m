//
//  Card.m
//  Matchismo
//
//  Created by Eduardo Lacerda on 10/07/13.
//  Copyright (c) 2013 Eduardo Lacerda. All rights reserved.
//

#import "Card.h"

@implementation Card



- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    // For in, vai realizar o loop para todos os objetos Card presente no Array otherCards. Assim, vai comparar todas as cartas com esta.
    for (Card *card in otherCards) {
        // Usa o getter do contents de card(parametro) e compara com o self contents
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}


@end
