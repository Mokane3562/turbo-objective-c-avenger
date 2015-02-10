//
//  ViewController.m
//  Calculator
//
//  Created by Michael Nolan John Singleton on 2015-02-05.
//  Copyright (c) 2015 Michael Nolan John Singleton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSNumber* baseOfPowerOp;
@property (nonatomic, strong) NSNumber* firstNumber;
@property (nonatomic, strong) NSString* operation;

@property BOOL powerOfNumberActive;
@property BOOL outputLabelEmpty;
@property BOOL fresh;
@property BOOL clear;

@property (weak, nonatomic) IBOutlet UIButton *power;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstNumber = [NSNumber numberWithDouble:0.0];
    self.powerOfNumberActive = false;
    self.outputLabelEmpty = true;
    self.fresh = true;
    self.clear = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//NUMBER BUTTONS
- (IBAction)buttonOne:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if ([current isEqualToString:@"0"] || self.fresh || self.clear){
        self.outputLabel.text = [NSString stringWithFormat:@"1"];
        self.fresh = false;
        self.clear = false;
    } else {
        self.outputLabel.text = [NSString stringWithFormat:@"%@1", current];
    }
}


- (IBAction)buttonTwo:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if ([current isEqualToString:@"0"] || self.fresh || self.clear){
        self.outputLabel.text = [NSString stringWithFormat:@"2"];
        self.fresh = false;
        self.clear = false;
    } else {
        self.outputLabel.text = [NSString stringWithFormat:@"%@2", current];
    }
}

- (IBAction)buttonThree:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if ([current isEqualToString:@"0"] || self.fresh || self.clear){
        self.outputLabel.text = [NSString stringWithFormat:@"3"];
        self.fresh = false;
        self.clear = false;
    } else {
        self.outputLabel.text = [NSString stringWithFormat:@"%@3", current];
    }
}

- (IBAction)buttonFour:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if ([current isEqualToString:@"0"] || self.fresh || self.clear){
        self.outputLabel.text = [NSString stringWithFormat:@"4"];
        self.fresh = false;
        self.clear = false;
    } else {
        self.outputLabel.text = [NSString stringWithFormat:@"%@4", current];
    }
}

- (IBAction)buttonFive:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if ([current isEqualToString:@"0"] || self.fresh || self.clear){
        self.outputLabel.text = [NSString stringWithFormat:@"5"];
        self.fresh = false;
        self.clear = false;
    } else {
        self.outputLabel.text = [NSString stringWithFormat:@"%@5", current];
    }
}

- (IBAction)buttonSix:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if ([current isEqualToString:@"0"] || self.fresh || self.clear){
        self.outputLabel.text = [NSString stringWithFormat:@"6"];
        self.fresh = false;
        self.clear = false;
    } else {
        self.outputLabel.text = [NSString stringWithFormat:@"%@6", current];
    }
}

- (IBAction)buttonSeven:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if ([current isEqualToString:@"0"] || self.fresh || self.clear){
        self.outputLabel.text = [NSString stringWithFormat:@"7"];
        self.fresh = false;
        self.clear = false;
    } else {
        self.outputLabel.text = [NSString stringWithFormat:@"%@7", current];
    }
}

- (IBAction)buttonEight:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if ([current isEqualToString:@"0"] || self.fresh || self.clear){
        self.outputLabel.text = [NSString stringWithFormat:@"8"];
        self.fresh = false;
        self.clear = false;
    } else {
        self.outputLabel.text = [NSString stringWithFormat:@"%@8", current];
    }
}

- (IBAction)buttonNine:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if ([current isEqualToString:@"0"] || self.fresh || self.clear){
        self.outputLabel.text = [NSString stringWithFormat:@"9"];
        self.fresh = false;
        self.clear = false;
    } else {
        self.outputLabel.text = [NSString stringWithFormat:@"%@9", current];
    }
}

- (IBAction)buttonZero:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if ([current isEqualToString:@"0"] || self.fresh || self.clear){
        self.outputLabel.text = [NSString stringWithFormat:@"0"];
        self.fresh = false;
        self.clear = false;
    } else {
        self.outputLabel.text = [NSString stringWithFormat:@"%@0", current];
    }
}

- (IBAction)buttonDecimal:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if (![current containsString:@"."] && (self.clear || self.fresh)){
        self.outputLabel.text = [NSString stringWithFormat:@"%@.", @"0"];
        self.clear = false;
        self.fresh = false;
    } else if (![current containsString:@"."]){
        self.outputLabel.text = [NSString stringWithFormat:@"%@.", current];
    }
}

//BASIC OPERATION BUTTONS
- (IBAction)buttonAdd:(UIButton *)sender {
    if (self.outputLabelEmpty){
        NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        self.firstNumber = [NSNumber numberWithDouble: [s doubleValue]];
        self.outputLabelEmpty = false;
    } else {
        NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        if ([self.operation isEqualToString:@"add"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] + [s doubleValue])];
        } else if ([self.operation isEqualToString:@"subtract"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] - [s doubleValue])];
        } else if ([self.operation isEqualToString:@"multiply"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] * [s doubleValue])];
        } else if ([self.operation isEqualToString:@"divide"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] / [s doubleValue])];
        }
    }
    self.operation = [NSString stringWithFormat:@"add"];
    self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:self.firstNumber numberStyle:NSNumberFormatterDecimalStyle];
    self.clear = true;
}

- (IBAction)buttonSubtract:(UIButton *)sender {
    if (self.outputLabelEmpty){
        NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        self.firstNumber = [NSNumber numberWithDouble: [s doubleValue]];
        self.outputLabelEmpty = false;
    } else {
        NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        if ([self.operation isEqualToString:@"add"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] + [s doubleValue])];
        } else if ([self.operation isEqualToString:@"subtract"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] - [s doubleValue])];
        } else if ([self.operation isEqualToString:@"multiply"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] * [s doubleValue])];
        } else if ([self.operation isEqualToString:@"divide"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] / [s doubleValue])];
        }
    }
    self.operation = [NSString stringWithFormat:@"subtract"];
    self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:self.firstNumber numberStyle:NSNumberFormatterDecimalStyle];
    self.clear = true;
}

- (IBAction)buttonMultiply:(UIButton *)sender {
    if (self.outputLabelEmpty){
        NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        self.firstNumber = [NSNumber numberWithDouble: [s doubleValue]];
        self.outputLabelEmpty = false;
    } else {
        NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        if ([self.operation isEqualToString:@"add"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] + [s doubleValue])];
        } else if ([self.operation isEqualToString:@"subtract"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] - [s doubleValue])];
        } else if ([self.operation isEqualToString:@"multiply"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] * [s doubleValue])];
        } else if ([self.operation isEqualToString:@"divide"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] / [s doubleValue])];
        }
    }
    self.operation = [NSString stringWithFormat:@"multiply"];
    self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:self.firstNumber numberStyle:NSNumberFormatterDecimalStyle];
    self.clear = true;
    
}

- (IBAction)buttonDivide:(UIButton *)sender {
    if (self.outputLabelEmpty){
        NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        self.firstNumber = [NSNumber numberWithDouble: [s doubleValue]];
        self.outputLabelEmpty = false;
    } else {
        NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        if ([self.operation isEqualToString:@"add"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] + [s doubleValue])];
        } else if ([self.operation isEqualToString:@"subtract"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] - [s doubleValue])];
        } else if ([self.operation isEqualToString:@"multiply"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] * [s doubleValue])];
        } else if ([self.operation isEqualToString:@"divide"]){
            self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] / [s doubleValue])];
        }
    }
    self.operation = [NSString stringWithFormat:@"divide"];
    self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:self.firstNumber numberStyle:NSNumberFormatterDecimalStyle];
    self.clear = true;
    
}

- (IBAction)buttonPlusOrMinus:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if (![current isEqualToString:@"0"]) {
        NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        NSNumber* num = [NSNumber numberWithDouble:([s doubleValue] * -1)];
        self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:num numberStyle:NSNumberFormatterDecimalStyle];
    }
}

//EXPONENT BUTTONS
- (IBAction)buttonInvert:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if (![current isEqualToString:@"0"]) {
        NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        NSNumber* num = [NSNumber numberWithDouble:(1/[s doubleValue])];
        self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:num numberStyle:NSNumberFormatterDecimalStyle];
        self.clear = true;
    }
    
}

- (IBAction)buttonSquareRoot:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if (![current isEqualToString:@"0"]) {
        NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        NSNumber* num = [NSNumber numberWithDouble:(sqrt([s doubleValue]))];
        self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:num numberStyle:NSNumberFormatterDecimalStyle];
        self.clear = true;
    }
    
}

- (IBAction)buttonPowerOfTwo:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if (![current isEqualToString:@"0"]) {
        NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        NSNumber* num = [NSNumber numberWithDouble:(pow([s doubleValue],2))];
        self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:num numberStyle:NSNumberFormatterDecimalStyle];
        self.clear = true;
    }
}

- (IBAction)buttonPowerOfThree:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if (![current isEqualToString:@"0"]) {
        NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        NSNumber* num = [NSNumber numberWithDouble:(pow([s doubleValue],3))];
        self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:num numberStyle:NSNumberFormatterDecimalStyle];
        self.clear = true;
    }
}

- (IBAction)buttonPowerOfNumber:(UIButton *)sender {
    if (self.outputLabelEmpty){
        NSString* current = self.outputLabel.text;
        if (![current isEqualToString:@"0"]) {
            NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
            self.baseOfPowerOp = [NSNumber numberWithDouble: [s doubleValue]];
            self.clear = true;
            self.powerOfNumberActive = true;
        }
        [self.power setBackgroundColor:[UIColor blueColor]];
    } else if (self.powerOfNumberActive) {
        [ self buttonEquals: sender ];
    }
}

//CONTROL BUTTONS
- (IBAction)buttonClear:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if (![current  isEqual: @"0"]){
        self.outputLabel.text = [NSString stringWithFormat:@"0"];
    }
    self.firstNumber = [NSNumber numberWithDouble:0.0];
    self.fresh = true;
    self.outputLabelEmpty = true;
}

- (IBAction)buttonDelete:(UIButton *)sender {
    NSString* current = self.outputLabel.text;
    if (![current  isEqual: @"0"]){
        int length = (int)[current length];
        if (length == 1) {
            self.outputLabel.text = [NSString stringWithFormat:@"0"];
        } else {
            self.outputLabel.text = [NSString stringWithFormat:@"%@", [current substringToIndex:length-1]];
        }
    }
}

- (IBAction)buttonEquals:(UIButton *)sender {
    NSString *s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
    if ([self.operation isEqualToString:@"add"] && !self.fresh){
        self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] + [s doubleValue])];
        self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:self.firstNumber numberStyle:NSNumberFormatterDecimalStyle];
        self.clear = true;
        self.fresh = true;
        self.outputLabelEmpty = true;
        self.firstNumber = [NSNumber numberWithDouble:0.0];
    } else if ([self.operation isEqualToString:@"subtract"] && !self.fresh){
        self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] - [s doubleValue])];
        self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:self.firstNumber numberStyle:NSNumberFormatterDecimalStyle];
        self.clear = true;
        self.fresh = true;
        self.outputLabelEmpty = true;
        self.firstNumber = [NSNumber numberWithDouble:0.0];
    } else if ([self.operation isEqualToString:@"multiply"] && !self.fresh){
        self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] * [s doubleValue])];
        self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:self.firstNumber numberStyle:NSNumberFormatterDecimalStyle];
        self.clear = true;
        self.fresh = true;
        self.outputLabelEmpty = true;
        self.firstNumber = [NSNumber numberWithDouble:0.0];
    } else if ([self.operation isEqualToString:@"divide"] && !self.fresh){
        self.firstNumber = [NSNumber numberWithDouble: ([self.firstNumber doubleValue] / [s doubleValue])];
        self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:self.firstNumber numberStyle:NSNumberFormatterDecimalStyle];
        self.clear = true;
        self.fresh = true;
        self.outputLabelEmpty = true;
        self.firstNumber = [NSNumber numberWithDouble:0.0];
    }
    if (self.powerOfNumberActive) {
        s = [self.outputLabel.text stringByReplacingOccurrencesOfString:@"," withString:@""];
        NSNumber* num = [NSNumber numberWithDouble:(pow([self.baseOfPowerOp doubleValue], [s doubleValue]))];
        self.outputLabel.text = [NSNumberFormatter localizedStringFromNumber:num numberStyle:NSNumberFormatterDecimalStyle];
        self.powerOfNumberActive = true;
        self.clear = true;
        [self.power setBackgroundColor:[UIColor whiteColor]]; 
    }
}
@end