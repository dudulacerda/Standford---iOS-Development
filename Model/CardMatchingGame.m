//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Eduardo Lacerda on 16/07/13.
//  Copyright (c) 2013 Eduardo Lacerda. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (strong, nonatomic)NSMutableArray *cards; //of Card
@property (strong, nonatomic) NSString *lastCall;
@property (nonatomic,readwrite) int score;




@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

#define FLIP_COST 1
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2

//Método principal, vai receber um indice de uma carta a ser virada
-(void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];              //Pega a carta do index passado
    
    NSMutableArray *cardsFlipUp = [[NSMutableArray alloc]init];
    
    if (!card.isUnplayable) {                           //Verifica se a carta é jogável
        //Se a carta estiver virada, faça a comparação
        if (!card.isFaceUp) {
            self.lastCall = [NSString stringWithFormat:@"Flipped up %@",card.contents];
            for (Card *otherCard in self.cards) {       //For para todas as cartas do Array
                //Verifica se existe outra carta virada e jogável
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    [cardsFlipUp addObject:otherCard];
                }
            }
            
            if (cardsFlipUp.count-1 == (int)self.matchMode) {
                int matchScore = [card match:cardsFlipUp];
                
                if (matchScore) {
                    for (Card *otherCard in cardsFlipUp) {
                        otherCard.unplayable = YES;
                    }
                    
                    card.unplayable = YES;
                    self.score += matchScore * MATCH_BONUS;
                    self.lastCall = [cardsFlipUp componentsJoinedByString:@" "];
                    self.lastCall = [self.lastCall stringByAppendingString:[NSString stringWithFormat:@" %@: match, %d points bonus!",card.contents,matchScore * MATCH_BONUS]];
                } else {
                    for (Card *otherCard in cardsFlipUp) {
                        otherCard.faceUp = NO;
                    }
                    self.score -= MISMATCH_PENALTY;
                    self.lastCall = [cardsFlipUp componentsJoinedByString:@" "];
                    self.lastCall = [self.lastCall stringByAppendingString:[NSString stringWithFormat:@" %@: no match, %d points penalty!", card.contents,MISMATCH_PENALTY]];
                }
            }
            
            self.score -= FLIP_COST;
            
        }
        card.faceUp = !card.isFaceUp;                   // Vira a Carta
    }
    
}



-(id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < cardCount; i++) {                           //For de 12(numero de cartas) interações
            Card *card = [deck drawRandomCard];                     //Pega uma carta do baralho
            if(!card){                                              //Protege se o count for maior que o numero de cartas do baralho
                self = nil;
            } else {
                self.cards[i] = card;                               //Guarda a carta para o Cards do CardMtchingGame
            }
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    // Se o index for maior que o numero de cartas do Array, retorna nil
    return (index < self.cards.count) ? self.cards[index] : nil;
}





@end
