//
//  ViewController.m
//  PassTouch
//
//  Created by kede on 2018/10/29.
//  Copyright © 2018 Clare320. All rights reserved.
//

#import "ViewController.h"

#import "TouchableTableView.h"
#import "TouchableScrollView.h"


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) TouchableScrollView *scrollView;
@property (strong, nonatomic) TouchableTableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupUI];
    [self testTouchEvent];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor cyanColor];
    
    CGFloat width = self.view.bounds.size.width;
    
    TouchableScrollView *scrollView = [[TouchableScrollView alloc] initWithFrame:CGRectMake(0, 0, width, 160)];
    scrollView.contentSize = CGSizeMake(width * 3, 160);
    scrollView.pagingEnabled = YES;
    NSArray *colors = @[[UIColor redColor], [UIColor yellowColor], [UIColor greenColor]];
    for (int i = 0; i < colors.count; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(width * i, 0, width, 160)];
        view.backgroundColor = colors[i];
        [scrollView addSubview:view];
    }
    [self.view addSubview:scrollView];
    
    self.scrollView = scrollView;
    
    TouchableTableView *tableView = [[TouchableTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 80;
    tableView.backgroundColor = [UIColor clearColor];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"test"];
    tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view addSubview:tableView];
//    tableView.contentInset = UIEdgeInsetsMake(160, 0, 0, 0);
    
    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, width, 160)];
    headerView.backgroundColor = [UIColor clearColor];
    tableView.tableHeaderView = headerView;
    
    self.tableView = tableView;
}

- (void)testTouchEvent {
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScrollView)];
//    [self.scrollView addGestureRecognizer:tap];
}

- (void)tapScrollView {
    NSLog(@"Tap Tap Tap");
}


#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Test%ld", indexPath.row];
    
    return cell;
}


@end
