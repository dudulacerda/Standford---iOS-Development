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

@end

@implementation ViewController

-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    NSString *texto = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    [self.flipsLabel setText:texto];
}

- (IBAction)flipCard:(UIButton *)sender {
    
    if (sender.isSelected) {
        
        [sender setSelected:NO];
    } else {
        [sender setSelected:YES];
        NSString *valorCarta = [[self.baralhoJogo drawRandomCard] contents];
        [sender setTitle:valorCarta forState:UIControlStateSelected];
    }
    
    self.flipCount++;

}

-(void)viewDidAppear:(BOOL)animated
{
    self.baralhoJogo = [[PlayingCardDeck alloc] init];
}
@end
