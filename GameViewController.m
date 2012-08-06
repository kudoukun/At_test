//
//  GameViewController.m
//  eigodePon
//
//  Created by 酒井 邦也 on 12/07/03.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

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
    [upgradeButton addTarget:self action:@selector(upgradePlus) forControlEvents:UIControlEventTouchUpInside]; 
    question = [NSMutableArray array];
    
    question = [[Entity getInstance]generateQuestions:@"questionData1"];
    
    NSLog(@"%d",[question count]);
    
    
    
    
    
    switch ([question count]) {
        case 2:
        {
            NSLog(@"2");
            for(int i = 0; i < [question count]; i++){
                NSString *moji = [question objectAtIndex:i];
                DragView *img = [[DragView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",moji]]];
            }
            break;
        }
        case 3:
        {
            NSLog(@"3");
            for(int i = 0; i < [question count]; i++){
                NSString *moji = [question objectAtIndex:i];
                DragView *img = [[DragView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",moji]]];
            }
            break;
        }
        case 4:
        {
            NSLog(@"4");
            for(int i = 0; i < [question count]; i++){
                NSString *moji = [question objectAtIndex:i];
                DragView *img = [[DragView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",moji]]];
            }
            break;
        }
        case 5:
        {
            NSLog(@"5");
            for(int i = 0; i < [question count]; i++){
                NSString *moji = [question objectAtIndex:i];
                DragView *img = [[DragView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",moji]]];
            }
            break;
        }
        case 6:
        {
            NSLog(@"6");
            for(int i = 0; i < [question count]; i++){
                NSString *moji = [question objectAtIndex:i];
                DragView *img = [[DragView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",moji]]];
            }
            break;
        }
        case 7:
        {
            NSLog(@"7");
            for(int i = 0; i < [question count]; i++){
                NSString *moji = [question objectAtIndex:i];
                DragView *img = [[DragView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",moji]]];
            }
            break;
        }
        default:
            break;
    }
    
    NSString *moji = [question objectAtIndex:i];
    DragView *img = [[DragView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",moji]]];
    
    
    
    
    
    
    
    
    
    
    if(@"フラグ")
    {
        //何文字か？
        //|-問題に入っている文字数で表示する
        //|-7文字以下
        //|-ランダムで配置（正解の並び替えはさける）
        //|-正解フラグは一文字ずつ取り出した時にtag付けした物の順番で行う
        //|-DragViewに離した時の判定と基に戻るロジックを作成
        //|-
        //
        
    }
    
}

- (void)toSort:(id)object{
    
    NSLog(@"sakai");
    
}

- (void)viewDidUnload
{
    upgradeButton = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) viewWillAppear:(BOOL)animated{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(toSort:) name:@"toSort" object:nil];
    
}

- (void)upgradePlus {
    /*
     // すでにアップグレード済みなら
     if ([[ZConfig instance] isPlus] == YES)
     return;
     
     // アプリ内課金が許可されているかを確認
     if ([SKPaymentQueue canMakePayments] == NO) {
     // ... アラートを表示 ...
     return;
     }
     
     // ネットワークの接続を確認
     if ([[UIDevice currentDevice] networkAvailable] == NO) {
     // ... アラートを表示 ...
     return;
     }
     */
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    
    // 決済中、他の操作をされないように
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 320, 460)];
    [grayView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    grayView.tag = 21;
    [self.view.window addSubview:grayView];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [indicator setCenter:CGPointMake(160, 230)];
    [grayView addSubview:indicator];
    [indicator startAnimating];
    
    
    
    // プロダクト情報の取得開始
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    
    NSSet *productIds = [NSSet setWithObject:@"sakai"];
    skProductRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIds];
    skProductRequest.delegate = self;
    [skProductRequest start];
}


//----------------------------------------------------------------------------------

#pragma mark -
#pragma mark SKProductsRequestDelegate

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    if (response == nil) {
        NSLog(@"Product Response is nil");
        
        return;
    }
    
    // 確認できなかったidentifierをログに記録
    for (NSString *identifier in response.invalidProductIdentifiers) {
        NSLog(@"invalid product identifier: %@", identifier);
    }
    
    for (SKProduct *product in response.products ) {
        NSLog(@"valid product identifier: %@", product.productIdentifier);
        SKPayment *payment = [SKPayment paymentWithProduct:product];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    }
}

//----------------------------------------------------------------------------------

#pragma mark -
#pragma mark SKPaymentTransactionObserver

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    BOOL purchasing = YES;
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
                // 購入中
            case SKPaymentTransactionStatePurchasing: {
                NSLog(@"Payment Transaction Purchasing");
                break;
            }
                // 購入成功
            case SKPaymentTransactionStatePurchased: {
                NSLog(@"Payment Transaction END Purchased: %@", transaction.transactionIdentifier);
                purchasing = NO;
                [queue finishTransaction:transaction];
                break;
            }
                // 購入失敗
            case SKPaymentTransactionStateFailed: {
                NSLog(@"Payment Transaction END Failed: %@ %@", transaction.transactionIdentifier, transaction.error);
                purchasing = NO;
                // ... アラートを表示 ...
                [queue finishTransaction:transaction];
                break;
            }
                // 購入履歴復元
            case SKPaymentTransactionStateRestored: {
                NSLog(@"Payment Transaction END Restored: %@", transaction.transactionIdentifier);
                // 本来ここに到達しない
                purchasing = NO;
                [queue finishTransaction:transaction];
                break;
            }
        }
    }
    
    if (purchasing == NO) {
        [(UIView *)[self.view.window viewWithTag:21] removeFromSuperview];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
}


//----------------------------------------------------------------------------------



@end
