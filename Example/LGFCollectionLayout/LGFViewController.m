//
//  LGFViewController.m
//  LGFCollectionLayout
//
//  Created by qddios2 on 09/11/2016.
//  Copyright (c) 2016 qddios2. All rights reserved.
//

#import "LGFViewController.h"
#import "Masonry.h"
#import "LGFCollectionCell.h"
#import "LGFWidthLayout.h"
static NSString *const cellId = @"collection";
@interface LGFViewController ()<LGFAutoLayoutDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong)UICollectionView  *collectionView;
@property (nonatomic, strong) NSMutableArray  *dataArray;
@property (nonatomic, strong) UIButton        *addButton;

@end

@implementation LGFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.addButton];
    [self.view addSubview:self.collectionView];
    
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@100);
        make.height.equalTo(@40);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addButton.mas_bottom).offset(16);
        make.left.right.bottom.equalTo(self.view);
    }];
    [self.collectionView reloadData];
    
}


#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LGFCollectionCell   *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.titleLabel.text = self.dataArray[indexPath.row];
    return cell;
}


#pragma mark - UICollectionViewDelegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.dataArray removeObjectAtIndex:indexPath.row];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
    [self.collectionView reloadData];
    
    
}

#pragma mark - LGFAutoLayoutDelegate
-(CGFloat)autoLayout:(LGFWidthLayout *)layout atIndexPath:(NSIndexPath *)indexPath
{
    LGFCollectionCell *cell = [[LGFCollectionCell alloc]initWithFrame:CGRectZero];
    cell.titleLabel.text = self.dataArray[indexPath.row];
    return[cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].width;
}

#pragma mark - getter
-(UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        LGFWidthLayout *layout = [[LGFWidthLayout alloc]init];
        
        layout.delegate = self;
        layout.sectionInsert = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.itemHeight = 24;
        layout.rowMargin = 12;
        layout.columnMargin = 12;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[LGFCollectionCell class] forCellWithReuseIdentifier:cellId];
        _collectionView.backgroundColor = [UIColor lightGrayColor];
    }
    return _collectionView;
}


-(UIButton *)addButton
{
    if (_addButton == nil) {
        _addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [_addButton addTarget:self action:@selector(addButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _addButton;
}


-(void)addButtonEvent:(UIButton *)sender
{
    NSArray *array = @[@"北京", @"秦皇岛", @"抚顺", @"呼和浩特", @"鄂尔多斯" ,@"沧州", @"石家庄", @"杭州"];
    NSInteger index = arc4random()% (7-0 + 1) + 0;
    NSLog(@"%lu", index);
    [self.dataArray addObject:array[index]];
    [self.collectionView reloadData];
}


-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray arrayWithObjects:@"河南", @"洛阳", nil];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
