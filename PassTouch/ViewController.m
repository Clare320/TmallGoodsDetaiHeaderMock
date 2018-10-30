//
//  ViewController.m
//  PassTouch
//
//  Created by kede on 2018/10/29.
//  Copyright © 2018 Clare320. All rights reserved.
//

#import "ViewController.h"

// http://www.qingpingshan.com/rjbc/ios/239765.html

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UITableView *tableView;


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
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, 160)];
    scrollView.contentSize = CGSizeMake(width * 3, 160);
    scrollView.pagingEnabled = YES;
    NSArray *colors = @[[UIColor redColor], [UIColor yellowColor], [UIColor greenColor]];
    for (int i = 0; i < colors.count; i++) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(width * i, 0, width, 160)];
        view.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i+1]];
        [scrollView addSubview:view];
    }
    self.scrollView = scrollView;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 80;
    tableView.backgroundColor = [UIColor clearColor];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"test"];
    tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view addSubview:tableView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 160)];
    headerView.backgroundColor = [UIColor magentaColor];
    
    [headerView addSubview:scrollView];
    
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


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    if (scrollView == self.tableView) {
        self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x, 0);
        if (offset >= 0 && offset <= 160) {
            self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x, -offset / 2.0f);
        }
    }
}


@end
