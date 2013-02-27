//
//  CalculatorViewController.m
//  Calculator_iphone
//
//  Created by Hao Sun on 2/26/13.
//  Copyright (c) 2013 Hao Sun. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController
{
    int currentNumber;
    NSMutableString *displayString;
    char op;
    int second;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    displayString =[NSMutableString stringWithCapacity:40];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickDigit:(UIButton *)sender {
    int digit=sender.tag;
    if (op!=0) {
        second=second*10+digit;
    }else{
        currentNumber=currentNumber*10+digit;}
    NSString *string=[NSString stringWithFormat:@"%i",digit];
    [displayString appendString:string];
    _displayLabel.text=displayString;
}

- (IBAction)clickDot:(id)sender {
    NSString *string=@".";
    [displayString appendString:string];
    _displayLabel.text=displayString;
}

- (IBAction)clickClear:(id)sender {
    currentNumber=0;
    [displayString setString:@""];
    _displayLabel.text=displayString;
    
    _resultLabel.text=displayString;
    second=0;
    op=0;
}

- (IBAction)clickMinus:(id)sender {
    NSString *string=@" - ";
    [displayString appendString:string];
    _displayLabel.text=displayString;
    op='-';
}

- (IBAction)clickPlus:(id)sender {
    NSString *string=@" + ";
    [displayString appendString:string];
    _displayLabel.text=displayString;
    
    op='+';
}

- (IBAction)clickMultiple:(id)sender {
    NSString *string=@" x ";
    [displayString appendString:string];
    _displayLabel.text=displayString;
    op='x';
}

- (IBAction)clickDivide:(id)sender {
    NSString *string=@" / ";
    [displayString appendString:string];
    _displayLabel.text=displayString;
    op='/';
}

- (IBAction)clickEqual:(id)sender {

    int result=0;
    float append;
    bool ismultiple=true;
    NSString *appendstring;
    switch (op) {
        case '+':
            result=currentNumber+second;
            break;
        case '-':
            result=currentNumber-second;
            break;
        case 'x':
            result=currentNumber*second;
            break;
        case '/':
            if (currentNumber%second!=0) {
                append=currentNumber%second;
                append=append/second*100;
                
                ismultiple=false;
            }
            result=currentNumber/second;
            if (!ismultiple) {
                appendstring=[NSString stringWithFormat:@".%.0f",append];
            }
            
            break;
            
        default:
            break;
    }
    
    NSMutableString *string=[NSMutableString stringWithFormat:@"%i",result];
    if (!ismultiple) {
        [string appendString:appendstring];
    }
    _resultLabel.text=string;
    second=0;
    currentNumber=0;
    op=0;
    [displayString setString:@""];
    _displayLabel.text=@"";
}

- (IBAction)About:(id)sender {
    UIActionSheet *msg = [[UIActionSheet alloc]
                           initWithTitle:@"Thank you very much for using the software!\nThis software can realize add, minus, divide and multiply between two integers.\n Copyright \u00A9 2013 Hao Sun. All rights reserved."
                           delegate:nil
                           cancelButtonTitle:nil  destructiveButtonTitle:nil
                           otherButtonTitles:@"Okay", nil];
    [msg showInView:self.view];
}
@end
