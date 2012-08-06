//
//  GameViewController.h
//  eigodePon
//
//  Created by 酒井 邦也 on 12/07/03.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "Entity.h"
#import "DragView.h"

@interface GameViewController : UIViewController<SKRequestDelegate>{
    
    NSArray *question;
    
    IBOutlet UIButton *upgradeButton;
    SKProductsRequest *skProductRequest;
    
}

@end
