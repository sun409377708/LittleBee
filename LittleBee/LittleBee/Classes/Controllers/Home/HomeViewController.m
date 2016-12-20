//
//  HomeViewController.m
//  LittleBee
//
//  Created by maoge on 16/12/19.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "HomeViewController.h"
#import "JQCollectionView.h"

const CGFloat HomeCollectionCellMargin = 10;

static NSString *collectionCellId = @"collectionCellId";
static NSString *collectionHeaderId = @"collectionHeaderId";
static NSString *collectionFooterId = @"collectionFooterId";


@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setCollectionViewUI];
    
}

- (void)setCollectionViewUI {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 8;
    layout.minimumInteritemSpacing = 5;
    
    layout.sectionInset = UIEdgeInsetsMake(0, HomeCollectionCellMargin, 0, HomeCollectionCellMargin);
    
    //创建collectionView
    JQCollectionView *collectionView = [[JQCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    
    collectionView.backgroundColor = [UIColor orangeColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuide);
    }];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectionCellId];
    
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderId];
    
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:collectionFooterId];
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
    
    cell.backgroundColor = RANDOMCOLOR;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderId forIndexPath:indexPath];
        
        return headerView;
    }else {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:collectionFooterId forIndexPath:indexPath];
        
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




@end
