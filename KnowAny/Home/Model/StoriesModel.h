//
//  StoriesModel.h
//  KnowAny
//
//  Created by super on 2018/4/27.
//  Copyright © 2018年 super. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoriesModel : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *ga_prefix;
@property (nonatomic, strong)NSArray *images;
@property (nonatomic, assign)NSInteger type;
@property (nonatomic, assign)long long id;
@end
