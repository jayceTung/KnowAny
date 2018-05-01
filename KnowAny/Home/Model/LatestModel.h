//
//  LatestModel.h
//  KnowAny
//
//  Created by super on 2018/4/27.
//  Copyright © 2018年 super. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StoriesModel;

@interface LatestModel : NSObject
@property (nonatomic, strong)NSString *date;
@property (nonatomic, strong)NSArray<StoriesModel*> *stories;
@property (nonatomic, strong)NSArray *top_stories;
@end
