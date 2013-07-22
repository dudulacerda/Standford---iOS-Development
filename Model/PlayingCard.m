//
//  PlayingCard.m
//  Matchismo
//
//  Created by Eduardo Lacerda on 10/07/13.
//  Copyright (c) 2013 Eduardo Lacerda. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard



-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if (otherCards.count == 1) {     //Recebe aquele Array on the fly com UMA Carta
        PlayingCard *otherCard = [otherCards lastObject];
        
        if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        } else if (otherCard.rank == self.rank){
            score = 4;
        }
    }
    
    if (otherCards.count == 2) {
        int countSuit = 0;
        int countRank = 0;
        
        for (PlayingCard *otherCard in otherCards) {
            if ([otherCard.suit isEqualToString:self.suit]) {
                countSuit++;
            } 
            
            if (otherCard.rank == self.rank){
                countRank++;
            }
        }
        
        if (countRank == 2) {
            score += 12;
        } else if (countRank == 1){
            score += 2;
        }
        if (countSuit == 2) {
            score += 4;
        } else if (countSuit == 1){
            score += 1;
        }
    }
    
    return score;
}

// Método GETTER do atributo contents, da classe pai.
-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings]; //Um array que vai ser consultado para retornar o valor da carta, assim não fica 1 ou 12 etc.
    
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+(NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

@synthesize suit = _suit;

-(void)setSuit:(NSString *)suit
{
    // Verifica se o naipe passado(suit) esta entre os válidos(validSuits)
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *) rankStrings
{
    return @[@"?",@"A",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank
{
    return  ([[self rankStrings] count]-1);
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

-(NSString *)description
{
    return self.contents;
}

@end
