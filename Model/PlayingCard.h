//
// Uma carta de jogo de baralho
// Herda de Card
//

#import <Foundation/Foundation.h>
#import "Card.h"


@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;


@end
