//
//  ViewController.m
//  sliderGame
//
//  Created by Joseph Canero on 3/30/14.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    totalPoints = 0;
    round = 0;
    self.view.backgroundColor = [UIColor grayColor];
    [self setupApp];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setupApp {
    [self initVals];
}

- (void) initVals {
    round++;
    random = lroundf(arc4random_uniform(100) + 1);
    guess = lroundf(self.slider.value);
    displayLabel.text = [NSString stringWithFormat:@"Guess: %i", guess];
    targetLabel.text = [NSString stringWithFormat:@"Target: %i", random];
    pointsLabel.text = [NSString stringWithFormat:@"Points\n%i", totalPoints];
    roundsLabel.text = [NSString stringWithFormat:@"Round\n%i", round];
}

- (int) calcScore {
    int points;
    NSLog(@"guess: %i", guess);
    NSLog(@"rando: %i", random);
    points = abs(guess - random);
    NSLog(@"diff: %i", points);
    if (points == 0) {
        points = 100;
    }
    else points = 100/(points+1);
    return points;
}

- (IBAction)sliderMoved:(UISlider *)slider {
    guess = slider.value;
    displayLabel.text = [NSString stringWithFormat:@"Guess: %i", guess];
}

- (IBAction)checkGuess {
    //make the alert
    int match = 0;
    int points = 0;
    NSString *result;
    if ((guess - random) == 0) {
        match = 1;
        result = @"You win!";
    }
    else result = @"You lose!";
    points = [self calcScore];
    totalPoints += points;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Check your Guess!" message:[NSString stringWithFormat:@"Your guess: %i\nTarget: %i\n%@\nYou scored %i points!", guess, random, result, points] delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
    pointsLabel.text = [NSString stringWithFormat:@"Points\n%i", totalPoints];
    [alert show];
}

- (IBAction)newGameButton {
    [self viewDidLoad];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self setupApp];
}
@end
