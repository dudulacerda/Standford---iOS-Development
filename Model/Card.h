// Card.h
//
// Card é um modelo genérico de carta
// Contents é só um nome que aparece na carta
// faceUp indica se a carta está virada ou não
// unplayable vai indicar se a carta está ativa no jogo ou não


#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isFaceUp) BOOL faceUp;

@property (nonatomic, getter = isUnplayable) BOOL unplayable;

- (int) match: (Card *)card;

@end
