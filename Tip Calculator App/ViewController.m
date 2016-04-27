//
//  ViewController.m
//  Tip Calculator App
//
//  Created by MBPinTheAir on 27/04/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) NSArray *percentValues;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.percentValues = @[@"10%", @"5%", @"10%", @"15%", @"20%"];
    
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(grTapped:)];
    [self.view addGestureRecognizer:gr];
   // self.calculateTotalButtonOutlet.hidden = YES;
    [self.pickerViewOutlet removeFromSuperview];
    self.tipPercentTextField.inputView = self.pickerViewOutlet;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [self.tipPercentTextField resignFirstResponder];
//    return YES;
//}
////    -(void)textFieldDoneEditing:(UITextField *)textField{
////        
////}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.billTextField resignFirstResponder];
    [self.tipPercentTextField resignFirstResponder];
    
    return YES;
}

-(void)grTapped:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)calculateTotalButton:(id)sender {
    
    float _bill = [self.billTextField.text floatValue];
    float _tipPercent = [self.tipPercentTextField.text floatValue];
    TipCalc *getTotalBill = [[TipCalc alloc]init];
    float holdinTotal = [getTotalBill getTip:_bill withTipOf:_tipPercent];
    
    NSString *resultforLabel = [NSString stringWithFormat:@"Total Bill Due is %f", holdinTotal];
//    [self.billTextField resignFirstResponder];
//    [self.tipPercentTextField resignFirstResponder];
    
    self.totalLabel.text = resultforLabel;
}
#pragma uipickerview delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.tipPercentTextField.text = self.percentValues[row];
}

#pragma pickerview datasource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_percentValues count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.percentValues[row];
}




@end

