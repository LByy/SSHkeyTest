//
//  DDGroundHouse.m
//  DDPrepareJieMian
//
//  Created by MAC OS X on 15/11/27.
//  Copyright © 2015年 anfle. All rights reserved.
//

#import "DDGroundHouse.h"

@interface DDGroundHouse ()

@end

@implementation DDGroundHouse

- (void)viewWillAppear:(BOOL)animated{
    
    /*
     UITableView : UIScrollView
     */
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    // 设置cell的高度
    // tableView.rowHeight = 80;
    
    // 每个cell的分割线颜色
    tableView.separatorColor = [UIColor orangeColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    // 分割线的偏移量
    tableView.separatorInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    UISearchBar *search = [[UISearchBar alloc] init];
    search.frame = CGRectMake(0, 0, 320, 60);
    tableView.tableHeaderView = search;
    
    search = nil;
    
    //[self.view addSubview:tableView];
    
    tableView = nil;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"搜索找房";
    }


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

/*
 cell的重用机制
 1.如果屏幕上需要显示10个cell,那么一般会创建11个cell
 2.每当有一个cell超出屏幕,把它放到"重用池"
 3.下次如果要显示cell,先从"重用池"里根据"重用标识符"找cell,如果有,直接显示,
 如果没有,则创建新的cell并给它一个"重用标识符"
 
 结论:
 1. "重用池"里面可以放多种cell
 2. 以后设计其他控件时,参考cell的重用机制
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 重用标识符
    static NSString *cellReuseStr = @"reuseCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseStr];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellReuseStr];
    }
    
    /*
     这三个控件放在cell.contentView上
     注:以后如果往cell上添加控件,都需要放在contentView上
     */
    //cell.textLabel.text = @"标题";
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.detailTextLabel.text = @"好好好!!!";
    cell.imageView.image = [UIImage imageNamed:@"01.jpg"];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
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
