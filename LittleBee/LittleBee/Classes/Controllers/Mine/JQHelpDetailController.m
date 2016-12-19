//
//  JQHelpDetailController.m
//  LittleBee
//
//  Created by maoge on 16/12/18.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "JQHelpDetailController.h"
#import "JQTableView.h"
#import "Question.h"
#import "AnswerCell.h"
#import "HelpHeadView.h"

static NSString *questionHeaderId = @"questionHeaderId";
static NSString *questionCellId = @"questionCellId";


@interface JQHelpDetailController ()<UITableViewDelegate, UITableViewDataSource, HelpHeadViewDelegate>

@property (nonatomic, strong) JQTableView *questionTableView;

@property (nonatomic, assign) NSInteger lastOpenIndex;

@property (nonatomic, assign) BOOL isOpenCell;

@property (nonatomic, strong) NSArray<Question *> *questions;

@end

@implementation JQHelpDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}

- (void)setupUI {
    
    self.lastOpenIndex = -1;
    self.isOpenCell = NO;
    
    self.navigationItem.title = @"常见问题";
    
    [self setTableView];
    [self loadHelpData];

}

- (void)loadHelpData {

    __weak typeof(self)weakSelf = self;
    
   [Question loadQuestions:^(NSArray<Question *> *array) {
       
       weakSelf.questions = array;
       [weakSelf.questionTableView reloadData];
   }];
}

- (void)setTableView {
    
    _questionTableView = [[JQTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _questionTableView.backgroundColor = WHITE_COLOR;
    _questionTableView.delegate = self;
    _questionTableView.dataSource = self;
    [_questionTableView registerClass:[HelpHeadView class] forHeaderFooterViewReuseIdentifier:questionHeaderId];
    _questionTableView.sectionHeaderHeight = 50;
    
    [self.view addSubview:_questionTableView];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.questions.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.lastOpenIndex == section && self.isOpenCell) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AnswerCell *cell = [[AnswerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:questionCellId];
    
    cell.question = self.questions[indexPath.section];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    HelpHeadView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:questionHeaderId];
    header.tag = section;
    header.delegate = self;
    header.question = self.questions[section];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.lastOpenIndex == indexPath.section && self.isOpenCell) {
        return self.questions[indexPath.section].cellHeight;
    }
    return 0;
}

- (void)headerViewClick:(HelpHeadView *)headView {
    
    NSLog(@"headView.tag = %zd ~~~ _lastOpenIndex = %zd ~~~ _isOpenCell = %d", headView.tag, _lastOpenIndex, _isOpenCell);
    
    //如果是第二次点击, 且点的是其他cell, 就获取当前headerView 然后移除上一个点击的cell
    if (_lastOpenIndex != -1 && _lastOpenIndex != headView.tag && _isOpenCell) {
        
        HelpHeadView *headerView = (HelpHeadView *)[self.questionTableView headerViewForSection:_lastOpenIndex];
        
        headerView.isSelected = NO;
        
        NSIndexPath *deleteIndexPath = [NSIndexPath indexPathForRow:0 inSection:_lastOpenIndex];
        self.isOpenCell = NO;
        
        [self.questionTableView deleteRowsAtIndexPaths:@[deleteIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    //如果两次点击的同一个cell , 则直接移除当前的cell
    if (_lastOpenIndex == headView.tag && _isOpenCell) {
        
        NSIndexPath *deleteIndexPath = [NSIndexPath indexPathForRow:0 inSection:_lastOpenIndex];
        
        self.isOpenCell = NO;
        [self.questionTableView deleteRowsAtIndexPaths:@[deleteIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        return;
    }
    
    //点击cell, 绑定最后一次点击的cell, 然后插入cell
    self.lastOpenIndex = headView.tag;
    self.isOpenCell = YES;
    NSIndexPath *insertIndexPaths = [NSIndexPath indexPathForRow:0 inSection:headView.tag];
    [self.questionTableView insertRowsAtIndexPaths:@[insertIndexPaths] withRowAnimation:UITableViewRowAnimationTop];
}

@end
