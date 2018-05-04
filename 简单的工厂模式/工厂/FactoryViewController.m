//
//  FactoryViewController.m
//  MyProject
//
//  Created by yun on 2018/5/4.
//  Copyright © 2018年 yun. All rights reserved.
//

#import "FactoryViewController.h"
#import "Factory.h"

@interface FactoryViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation FactoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initSubviews];
    [self loadData];
}

- (void)initSubviews{
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.estimatedRowHeight = 70;
    _tableView.rowHeight =  UITableViewAutomaticDimension;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

- (void)loadData{
    self.dataArray = [NSMutableArray new];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Factory" ofType:@"plist"];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    [array enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
        CellModel *model = [[CellModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
//        CellModel *model = [CellModel mj_objectWithKeyValues:dic];
        [self.dataArray addObject:model];
    }];
}

#pragma mark -- 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CellModel *cellModel = self.dataArray[indexPath.row];
    NSString *cellReuseIdentifier = [Factory getCellIdentifierWithType:cellModel.cellType];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    if (!cell) {
        cell = [Factory factoryClassifierWithType:cellModel.cellType cellStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseIdentifier];
    }
    [cell assignmentOperation:cellModel];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
