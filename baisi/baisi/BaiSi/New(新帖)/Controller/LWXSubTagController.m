//
//  LWXSubTagController.m
//  baisi
//
//  Created by Mac on 16/12/8.
//  Copyright © 2016年 gzjbwm. All rights reserved.
//

#import "LWXSubTagController.h"
#import "AFHTTPSessionManager+LWXManager.h"
#import "LWXSubtagModel.h"
#import  <MJExtension.h>
@interface LWXSubTagController ()
/** 模型数组 */
@property (nonatomic, strong)  NSMutableArray* tagListArr;

@end

@implementation LWXSubTagController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];

}


-(void)loadData{
   //创建请求管理者
    AFHTTPSessionManager *mgr=[AFHTTPSessionManager lwx_manager];
   //拼接请求参数
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
   dict[@"a"]=@"tags_list";
   dict[@"c"]=@"subscribe";
    //发送请求
    [mgr lwx_GET:@"http://api.budejie.com/api/api_open.php" parameters:dict progress:nil success:^(NSURLSessionDataTask * task, id responseObject) {
        //字典转模型
        NSArray* arr = responseObject[@"rec_tags"];
        //字典数组转化为模型数组
        NSMutableArray* tagListArr =  [LWXSubtagModel mj_objectArrayWithKeyValuesArray:arr];
        self.tagListArr = tagListArr;
        
        [self.tableView reloadData];
        lwxLog(@"%@",responseObject);
        [responseObject writeToFile:@"/Users/mac/Desktop/svn/1.list" atomically:YES];
        
    } failure:^(NSURLSessionDataTask * task,NSError * error) {
        lwxLog(@"%@",error);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tagListArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    LWXSubtagModel* model =self.tagListArr[indexPath.row];
    cell.textLabel.text =model.theme_name;
    return cell;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
