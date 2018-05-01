//
//  HomeViewController.m
//  KnowAny
//
//  Created by super on 2018/4/19.
//  Copyright © 2018年 super. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "StoriesModel.h"
#import "LatestModel.h"

#define CELLID @"HomeCell"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *datas;
@end

@implementation HomeViewController

- (UITableView *) tableView {
    if (!_tableView) {
        _tableView =  [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:CELLID];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self getLates];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - get data
- (void)getLates {
    [[AFHTTPSessionManager manager] GET:@"https://news-at.zhihu.com/api/4/news/latest" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [LatestModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"stories":@"StoriesModel"
                     };
        }];
        LatestModel *model = [LatestModel mj_objectWithKeyValues:responseObject];
        self.datas = model.stories.mutableCopy;
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.tableView cellHeightForIndexPath:indexPath model:self.datas[indexPath.row] keyPath:@"model" cellClass:[HomeTableViewCell class] contentViewWidth:self.view.frame.size.width];
}

- (void)setDatas:(NSMutableArray *)datas {
    _datas = datas;
    
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    cell.model = self.datas[indexPath.row];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
