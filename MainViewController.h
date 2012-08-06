//
//  MainViewController.h
//  eigodePon
//
//  Created by 酒井 邦也 on 12/07/03.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartViewController.h"
#import "GameViewController.h"

@interface MainViewController : UIViewController{
    
    IBOutlet UIView *_mainView;
}

@property (strong ,nonatomic)StartViewController *startViewController;
@property (strong ,nonatomic)GameViewController *gameViewController;



@end
