//
//  ViewController.h
//  Calculator
//
//  Created by Michael Nolan John Singleton on 2015-02-05.
//  Copyright (c) 2015 Michael Nolan John Singleton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

- (IBAction)buttonOne:(UIButton *)sender;
- (IBAction)buttonTwo:(UIButton *)sender;
- (IBAction)buttonThree:(UIButton *)sender;
- (IBAction)buttonFour:(UIButton *)sender;
- (IBAction)buttonFive:(UIButton *)sender;
- (IBAction)buttonSix:(UIButton *)sender;
- (IBAction)buttonSeven:(UIButton *)sender;
- (IBAction)buttonEight:(UIButton *)sender;
- (IBAction)buttonNine:(UIButton *)sender;
- (IBAction)buttonZero:(UIButton *)sender;
- (IBAction)buttonDecimal:(UIButton *)sender;

- (IBAction)buttonAdd:(UIButton *)sender;
- (IBAction)buttonSubtract:(UIButton *)sender;
- (IBAction)buttonMultiply:(UIButton *)sender;
- (IBAction)buttonDivide:(UIButton *)sender;
- (IBAction)buttonPlusOrMinus:(UIButton *)sender;

- (IBAction)buttonInvert:(UIButton *)sender;
- (IBAction)buttonSquareRoot:(UIButton *)sender;
- (IBAction)buttonPowerOfTwo:(UIButton *)sender;
- (IBAction)buttonPowerOfThree:(UIButton *)sender;
- (IBAction)buttonPowerOfNumber:(UIButton *)sender;

- (IBAction)buttonClear:(UIButton *)sender;
- (IBAction)buttonDelete:(UIButton *)sender;
- (IBAction)buttonEquals:(UIButton *)sender;

@end

