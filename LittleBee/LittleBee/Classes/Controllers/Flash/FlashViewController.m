
//
//  FlashViewController.m
//  LittleBee
//
//  Created by maoge on 16/12/19.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "FlashViewController.h"
#import "JQTableView.h"
#import "SuperMarketData.h"

static NSString *categoryCellId = @"categoryCellId";
static NSString *listCellId = @"listCellId";

static NSString *headId = @"headId";

@interface FlashViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) JQTableView *categoryView;

@property (nonatomic, weak) JQTableView *listView;

@end

@implementation FlashViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    
    [self loadData];
}

- (void)loadData {
    
    [SuperMarketData loadSuperMarketData:^(id data, NSError *error) {
        
    }];
}

- (void)setupUI {
    
    //左边分类view
    JQTableView *categoryView = [[JQTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    categoryView.rowHeight = 55;
    [self.view addSubview:categoryView];
    
    //右边细分view
    JQTableView *listView = [[JQTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];

    [self.view addSubview:listView];
    
    //约束
    [categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.bottom.equalTo(self.view);
        make.width.mas_equalTo(86);
    }];
    
    [listView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.top.bottom.equalTo(self.view);
        make.left.equalTo(categoryView.mas_right);
    }];
    
    //注册cell
    [categoryView registerClass:[UITableViewCell class] forCellReuseIdentifier:categoryCellId];
    [listView registerClass:[UITableViewCell class] forCellReuseIdentifier:listCellId];
    [listView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headId];
    
    //设置数据源代理
    categoryView.delegate = self;
    categoryView.dataSource = self;
    listView.delegate = self;
    listView.dataSource = self;
    
    listView.sectionHeaderHeight = 23;
    listView.rowHeight = 140;
    
    _categoryView = categoryView;
    _listView = listView;
    
}

#pragma mark -
#pragma mark dataSource method

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _categoryView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryCellId forIndexPath:indexPath];
        
        cell.backgroundColor = [UIColor grayColor];
        cell.textLabel.text = @(indexPath.row).description;
        return cell;
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listCellId forIndexPath:indexPath];
        cell.backgroundColor = [UIColor yellowColor];
        cell.textLabel.text = @(indexPath.row).description;

    return cell;
    }
}

#pragma mark -
#pragma mark 返回组头view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (tableView == _categoryView) {
        return nil;
    }
    
    UITableViewHeaderFooterView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headId];
    
    UILabel *label = [UILabel labelWithTitle:@"haha" andColor:[UIColor blueColor] andFontSize:14];
    
    [headView.contentView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headView.contentView);
        make.left.equalTo(headView.contentView).offset(8);
    }];
    
    return headView;
}


@end
