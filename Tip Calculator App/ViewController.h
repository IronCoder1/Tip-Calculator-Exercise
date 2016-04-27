//
//  ViewController.h
//  Tip Calculator App
//
//  Created by MBPinTheAir on 27/04/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TipCalc.h"

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentTextField;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewOutlet;
@property (weak, nonatomic) IBOutlet UIButton *calculateTotalButtonOutlet;

- (IBAction)calculateTotalButton:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pickerViewBottomConstraint;

@end

