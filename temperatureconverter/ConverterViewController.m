//
//  ConverterViewController.m
//  temperatureconverter
//
//  Created by Joey Lin on 1/9/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "ConverterViewController.h"

@interface ConverterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fahrenheitTextField;
@property (weak, nonatomic) IBOutlet UITextField *celciusTextField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;

- (IBAction)convertButtonPressed:(id)sender;

@end

@implementation ConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[self.convertButton addTarget:self action:@selector(convertButtonClicked:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];

}

//- (void)convertButtonClicked:(id)sender {
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertButtonPressed:(id)sender {
    [self.view endEditing:YES];
    NSLog(@"convert button pressed");
    [self updateTemperatures];
}

- (void)updateTemperatures {
    //if fahrenheit given, calcuate celcius, else if only celcius is given, calculate farenheit
    if ([self.fahrenheitTextField.text length] > 0) {
        double fDegrees = [self.fahrenheitTextField.text doubleValue];
        double cDegrees = (fDegrees - 32.0) * (5.0/9.0);
        self.celciusTextField.text = [NSString stringWithFormat:@"%.0f", cDegrees];
    } else if ([self.celciusTextField.text length] > 0) {
        double cDegrees = [self.celciusTextField.text doubleValue];
        double fDegrees = (cDegrees * 9.0/5.0) + 32.0;
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%.0f", fDegrees];
    }

}

@end
