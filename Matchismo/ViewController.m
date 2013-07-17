//
//  ViewController.m
//  Matchismo
//
//  Created by Eduardo Lacerda on 10/07/13.
//  Copyright (c) 2013 Eduardo Lacerda. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UITextField *txtLastCall;


@end

@implementation ViewController

-(CardMatchingGame *)game       //Lazy Instantiation
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[[PlayingCardDeck alloc] init]];    //Aloca o Baralho só nesse método
    }
    return _game;
}   


-(void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}


-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
    }
    [self.txtLastCall setText:self.game.lastCall];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}


-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    NSString *texto = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    [self.flipsLabel setText:texto];
}

- (IBAction)flipCard:(UIButton *)sender {
    
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];    //Usa o CardMatching game flip e passa o botao(carta)
    self.flipCount++;
    [self updateUI];             //Faz o update cada vez que uma carta é virada

}
@end
