//
//  StartViewController.m
//  eigodePon
//
//  Created by 酒井 邦也 on 12/07/03.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if([[Entity getInstance].itemName isEqualToString:@"Question1"]){
        item = [[Entity getInstance]generateQuestions:[Entity getInstance].itemName];
    }else if([[Entity getInstance].itemName isEqualToString:@"Question2"]){
        item = [[Entity getInstance]generateQuestions:[Entity getInstance].itemName];
    }else if([[Entity getInstance].itemName isEqualToString:@"Question3"]){
        item = [[Entity getInstance]generateQuestions:[Entity getInstance].itemName];
    }
    
    for(int s = 0; s < 9; s++){
        [item addObject:[NSString stringWithFormat:@"%d",s]];
    }
    
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)testAction:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"toGame" object:nil];
    
}
@end
