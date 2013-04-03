//
//  HomeViewController.m
//  TBClient
//
//  Created by Beny on 13-3-6.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import "HomeViewController.h"
#import "ArrangeImageCell.h"
#import "ItemModel.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *itemArray;
@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.itemArray = [[NSMutableArray alloc] init];
    
    for (int j=0; j<210; j++) {
        NSMutableArray *threeArray = [[NSMutableArray alloc] init];
        
        for (int i=0; i<3; i++) {
            ItemModel *itemModel = [[ItemModel alloc] init];
            itemModel.title = [NSString stringWithFormat:@"%d中华人民共和国",i];
            itemModel.price = @"998";
            itemModel.numIID = @"0001";
            itemModel.picURL = @"http://www.baidu.com/img/shouye_b5486898c692066bd2cbaeda86d74448.gif";
            
            [threeArray addObject:itemModel];
        }
        [self.itemArray addObject:threeArray];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

#pragma mark UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *arrangeImageCellIdentifier = @"ArrangeImageCellIdentifier";
    ArrangeImageCell *cell = [tableView dequeueReusableCellWithIdentifier:arrangeImageCellIdentifier];
    
    if (cell == nil) {
        cell = [[ArrangeImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:arrangeImageCellIdentifier];
    }
     
    [cell setCellContentWithArray:[self.itemArray objectAtIndex:indexPath.row]];
    //NSLog(@"%@",[self.itemArray objectAtIndex:indexPath.row]);
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.itemArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 131;
}
@end
