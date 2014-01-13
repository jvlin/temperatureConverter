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
@property BOOL isCelcius;

- (IBAction)convertButtonPressed:(id)sender;

@end

@implementation ConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature Converter";
        self.isCelcius = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[self.convertButton addTarget:self action:@selector(convertButtonClicked:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    self.fahrenheitTextField.delegate = self;
    self.celciusTextField.delegate = self;

}

//- (void)convertButtonClicked:(id)sender {
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self updateTemperatures];
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)convertButtonPressed:(id)sender {
    [self.view endEditing:YES];
    NSLog(@"convert button pressed");
    [self updateTemperatures];
}

- (IBAction)fahrenheitEditingChanged:(id)sender {
    NSLog(@"fahrenheit editing changed");
    self.isCelcius = NO;
}

- (IBAction)celciusEditingChanged:(id)sender {
    NSLog(@"celcius editing changed");
    self.isCelcius = YES;
}


- (void)updateTemperatures {
    //convert the last edited text field
    if (!self.isCelcius && [self.fahrenheitTextField.text length] > 0) {
        double fDegrees = [self.fahrenheitTextField.text doubleValue];
        double cDegrees = (fDegrees - 32.0) * (5.0/9.0);
        self.celciusTextField.text = [NSString stringWithFormat:@"%.0f", cDegrees];
    } else if (self.isCelcius && [self.celciusTextField.text length] > 0) {
        double cDegrees = [self.celciusTextField.text doubleValue];
        double fDegrees = (cDegrees * 9.0/5.0) + 32.0;
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%.0f", fDegrees];
    }

}

@end
