//
//  PlayingCard.m
//  Matchismo
//
//  Created by Eduardo Lacerda on 10/07/13.
//  Copyright (c) 2013 Eduardo Lacerda. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard


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

@end
