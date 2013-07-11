//
// Um conjunto de Card.h
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards; //Array que vai armazenar as cartas (Card) do Deck.

@end


@implementation Deck

// Lazy Instatiation
// Vai criar o array só quando o GETTER for chamado pela primeira vez
- (NSMutableArray *)cards
{
    if (!_cards) {                                  //Verifica se o array  já existi
        _cards = [[NSMutableArray alloc] init];     // Aloca, "tira do nil"
    }
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)isTop
{
    if(isTop){
        [self.cards insertObject:card atIndex:0];   //insere a carta(parametro) no Array cards, posição 0. Chama o GETTER de cards
    } else {
        [self.cards addObject:card];
    }
    
}


-(Card *)drawRandomCard
{
    Card *randomCard = nil;    //Variável do método
    
    if (self.cards.count) {         //Verifica se o Array não está vazio
        unsigned index = arc4random() % self.cards.count;  //Vai criar um numero dentro do limite de cartas no array cards (cards.count)
        randomCard = self.cards[index];         //pega a carta com o index
        [self.cards removeObjectAtIndex:index]; //remove a carta do array
    }
    
    return randomCard;
}

@end
