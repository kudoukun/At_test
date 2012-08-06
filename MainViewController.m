//
//  MainViewController.m
//  eigodePon
//
//  Created by 酒井 邦也 on 12/07/03.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize startViewController = _startViewController;
@synthesize gameViewController = _gameViewController;

- (void)clearMainView {
    NSArray *subviews = [_mainView subviews];
    for(int i=0; i<[subviews count]; i++){
        [[subviews objectAtIndex:i]removeFromSuperview];
    }
}

- (void)toStart:(id)object{
    NSLog(@"start");
    [self clearMainView];
    self.startViewController = [[StartViewController alloc]init];
    [_mainView addSubview:self.startViewController.view];
    [UIView animateWithDuration:1.0f 
						  delay:0.0f 
						options:UIViewAnimationCurveEaseIn 
					 animations:^(void) 
     {
        
         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                forView:_mainView cache:YES];
         
     }completion:^(BOOL finished){
         
     }];    
}

- (void)toGame:(id)object{
    NSLog(@"〜");
    [self clearMainView];
    self.gameViewController = [[GameViewController alloc]init];
    [_mainView addSubview:self.gameViewController.view];
    [UIView animateWithDuration:1.0f 
						  delay:0.0f 
						options:UIViewAnimationCurveEaseIn 
					 animations:^(void) 
     {
         
         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                forView:_mainView cache:YES];

         
     }completion:^(BOOL finished){
         
     }];    
    
}
- (void)to2:(id)object{
    NSLog(@"〜");
    [self clearMainView];
    
    [UIView animateWithDuration:1.0f 
						  delay:0.0f 
						options:UIViewAnimationCurveEaseIn 
					 animations:^(void) 
     {
         
         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                forView:_mainView cache:YES];
         
     }completion:^(BOOL finished){
         
     }];    
    
}

- (void)to3:(id)object{
    NSLog(@"〜");
    [self clearMainView];
    
    [UIView animateWithDuration:1.0f 
						  delay:0.0f 
						options:UIViewAnimationCurveEaseIn 
					 animations:^(void) 
     {
         
         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                forView:_mainView cache:YES];
         
     }completion:^(BOOL finished){
         
     }];    
    
}

- (void)to4:(id)object{
    NSLog(@"〜");
    [self clearMainView];
    
    [UIView animateWithDuration:1.0f 
						  delay:0.0f 
						options:UIViewAnimationCurveEaseIn 
					 animations:^(void) 
     {
         
         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                forView:_mainView cache:YES];
         
     }completion:^(BOOL finished){
         
     }];    
    
}

- (void)to5:(id)object{
    NSLog(@"〜");
    [self clearMainView];
    
    [UIView animateWithDuration:1.0f 
						  delay:0.0f 
						options:UIViewAnimationCurveEaseIn 
					 animations:^(void) 
     {
         
         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                forView:_mainView cache:YES];
         
     }completion:^(BOOL finished){
         
     }];    
    
}
- (void) viewWillAppear:(BOOL)animated{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(toStart:) name:@"toStart" object:nil];
    [center addObserver:self selector:@selector(toGame:) name:@"toGame" object:nil];
    [center addObserver:self selector:@selector(to2:) name:@"to2" object:nil];
    [center addObserver:self selector:@selector(to3:) name:@"to3" object:nil];
    [center addObserver:self selector:@selector(to4:) name:@"to4" object:nil];
    [center addObserver:self selector:@selector(tp5:) name:@"to5" object:nil];
    [self performSelector:@selector(sel:) withObject:@"active" afterDelay:0];
}



- (void)sel:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"toStart" object:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    _mainView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
