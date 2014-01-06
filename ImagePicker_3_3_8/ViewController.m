//
//  ViewController.m
//  ImagePicker_3_3_8
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import "ViewController.h"

#define MAX_NUM 5

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation ViewController
- (IBAction)selectRandom:(id)sender {
    int r = arc4random()% MAX_NUM;
    [self.picker selectRow:r inComponent:0 animated:YES];
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return MAX_NUM;
    
}


-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 64;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    NSString *imagePath = [NSString stringWithFormat:@"iu%ld.jpg",row];
    UIImage *image = [UIImage imageNamed:imagePath];
    UIImageView * imageView;
    
    if (nil == view) {
        imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(0,0,100,60);
        
        
    }
    else{
        imageView = (UIImageView *)view;
        imageView.image = image;
        
        
    }
    
    return imageView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
