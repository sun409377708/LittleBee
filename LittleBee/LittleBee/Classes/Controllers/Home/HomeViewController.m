//
//  HomeViewController.m
//  LittleBee
//
//  Created by maoge on 16/12/19.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "HomeViewController.h"
#import "JQCollectionView.h"
#import "HomeHeadView.h"
#import <MJRefresh/MJRefresh.h>
#import "RefreshHeader.h"

const CGFloat HomeCollectionCellMargin = 10;

static NSString *collectionCellId = @"collectionCellId";
static NSString *collectionHeaderId = @"collectionHeaderId";
static NSString *collectionFooterId = @"collectionFooterId";


@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) JQCollectionView *collectionView;
@property (nonatomic, weak) HomeHeadView *headView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNotifications];
    
    [self setCollectionViewUI];
    [self setHomeHeadViewUI];
}

- (void)addNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homeHeadViewHeightChange:) name:HomeHeadViewHeightDidChange object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -
#pragma mark Notification
- (void)homeHeadViewHeightChange:(NSNotification *)noty {
    CGFloat height = [noty.object floatValue];
    self.collectionView.mj_header.ignoredScrollViewContentInsetTop = height;
    
    self.headView.frame = CGRectMake(0, -height, SCREEN_WIDTH, height);
    self.collectionView.contentInset = UIEdgeInsetsMake(height, 0, 44, 0);
    self.collectionView.contentOffset = CGPointMake(0, -height);
}

#pragma mark -
#pragma mark SetupUI

- (void)setCollectionViewUI {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 8;
    layout.minimumInteritemSpacing = 5;
    
    layout.sectionInset = UIEdgeInsetsMake(0, HomeCollectionCellMargin, 0, HomeCollectionCellMargin);
    
    //创建collectionView
    JQCollectionView *collectionView = [[JQCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView = collectionView;
    
    collectionView.backgroundColor = [UIColor orangeColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectionCellId];
    
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderId];
    
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:collectionFooterId];
    
    //刷新控件
    RefreshHeader *redView = [RefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];
    redView.gifView.frame = CGRectMake(0, 30, 100, 100);
    collectionView.mj_header = redView;
    
}

- (void)headRefresh {
    NSLog(@"刷新啦");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionView.mj_header  endRefreshing];
    });
}

- (void)setHomeHeadViewUI {
    HomeHeadView *headView = [[HomeHeadView alloc] init];
    _headView = headView;
    [_collectionView addSubview:headView];
}

#pragma mark -
#pragma mark CollectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellId forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderId forIndexPath:indexPath];
        
        
        headerView.backgroundColor = [UIColor purpleColor];
        return headerView;
    }else {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:collectionFooterId forIndexPath:indexPath];
        
        footerView.backgroundColor = [UIColor redColor];
        return footerView;
    }
}

#pragma mark -
#pragma mark CollectionView Delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize itemSize = CGSizeZero;
    if (indexPath.section == 0) {
        itemSize = CGSizeMake(SCREEN_WIDTH - HomeCollectionCellMargin * 2,  140);
    }else if (indexPath.section == 1) {
        itemSize = CGSizeMake((SCREEN_WIDTH - HomeCollectionCellMargin * 2) * 0.5 - 4, 250);
    }
    return itemSize;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return  CGSizeMake(SCREEN_WIDTH, HomeCollectionCellMargin);
    }else if (section == 1) {
        return CGSizeMake(SCREEN_WIDTH, HomeCollectionCellMargin * 2);
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    if (section == 0) {
        return  CGSizeMake(SCREEN_WIDTH, HomeCollectionCellMargin);
    }else if (section == 1) {
        return CGSizeMake(SCREEN_WIDTH, HomeCollectionCellMargin * 5);
    }
    return CGSizeZero;
}



@end
