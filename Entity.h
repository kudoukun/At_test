//
//  Entity.h
//  eigodePon
//
//  Created by 酒井 邦也 on 12/07/03.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entity : NSObject{
    
    
}
@property NSString *itemName;
+(Entity*)getInstance;

- (NSArray *)generateQuestions:(NSString *)data;


@end
