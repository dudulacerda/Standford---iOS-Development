//
//  ViewController.m
//  Matchismo
//
//  Created by Eduardo Lacerda on 10/07/13.
//  Copyright (c) 2013 Eduardo Lacerda. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *baralhoJogo;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation ViewController


-(PlayingCardDeck *)baralhoJogo
{
    if (!_baralhoJogo) {
        _baralhoJogo = [[PlayingCardDeck alloc]init];       //Chama o init de PlayingCardDeck, gerando um
                                                            //baralho com 52 cartas
    }
    
    return _baralhoJogo;
}



    // Setter para o Array de Cartas da View
    // For para cada carta do Array, busca uma carta aleatória do baralhoJogo(Lazy instaciation)
    // Método executado somente uma vez (pelo próprio iOS), assim cada carta só recebe um valor
-(void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    for (UIButton *cardButton in cardButtons) {
        Card *card = [self.baralhoJogo drawRandomCard];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
    }
}

-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    NSString *texto = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    [self.flipsLabel setText:texto];
}

- (IBAction)flipCard:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
    self.flipCount++;

}
@end
