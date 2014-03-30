//
//  ViewController.h
//  sliderGame
//
//  Created by Joseph Canero on 3/30/14.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>{
    int guess, random, totalPoints, round;
    IBOutlet UILabel *displayLabel, *targetLabel, *pointsLabel, *roundsLabel;
}
@property (atomic, weak) IBOutlet UISlider *slider;
- (IBAction)sliderMoved:(UISlider *)slider;
- (IBAction)checkGuess;
- (IBAction)newGameButton;
@end
