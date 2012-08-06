//
//  Entity.m
//  eigodePon
//
//  Created by 酒井 邦也 on 12/07/03.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "Entity.h"

@implementation Entity

@synthesize itemName;

static Entity *entity = nil;
+(Entity *)getInstance{
    if(!entity){
        entity = [[Entity alloc]init];
    }
    return entity;
}

- (NSArray *)generateQuestions:(NSString *)data{
    
    NSMutableArray *setArray = [NSMutableArray array];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Question" ofType:@"plist"];
    NSDictionary *questions = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *set = [questions objectForKey:data];
    setArray = [NSMutableArray arrayWithArray:set];
    int m = [setArray count];
    NSLog(@"%d",m);
    for(int s=m-1; s > 0; s--) {
        
        srand([[NSDate date] timeIntervalSinceReferenceDate]);
        int n = rand() % (s +1);
        [setArray exchangeObjectAtIndex:s withObjectAtIndex:n];
    }
    
    for(int i = 0; i<[setArray count]; i++){
        NSLog(@"問題%d = %@",i+1, [[setArray objectAtIndex:i] objectForKey:@"question"]);      
    }
    NSLog(@"--*--*先頭から５題を取得*--*--*");
    for(int f=5; f<20; f++){
        [setArray removeObjectAtIndex:1];
    }
    NSArray *questionArray = [NSArray arrayWithArray:setArray];
    questionArray = [NSArray arrayWithArray:setArray];
    
    
	for (int i = 0; i<[questionArray count]; i++) {
		NSLog(@"問題%d = %@",i+1, [[questionArray objectAtIndex:i] objectForKey:@"question"]);
	}
	
    
	return questionArray;

}

@end
