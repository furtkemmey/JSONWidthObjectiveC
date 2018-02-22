//
//  ViewController.m
//  JSONWidthObjectiveC
//
//  Created by KaiChieh on 22/02/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize collection;
//NSMutableArray* north;
//NSMutableArray* middle;
//NSMutableArray* south;
NSArray* north;
NSArray* middle;
NSArray* south;

- (void)viewDidLoad {
    [super viewDidLoad];
//    north = [[NSMutableArray alloc] init];
//    middle = [[NSMutableArray alloc] init];
//    south = [[NSMutableArray alloc] init];
    self.collection.dataSource = self;
//    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 20, 0);
//    UICollectionViewFlowLayout* collectionViewLayout = (UICollectionViewFlowLayout*)self.collection.collectionViewLayout;
//    collectionViewLayout.sectionInset = inset;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loadSummer:(UIButton *)sender {
//    NSString* summerFruitData;
//    NSError* err;
//    NSURL* url;
//    url = [NSURL URLWithString:@"https://puxin-34420.firebaseapp.com/summer.json"];
//    summerFruitData = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error: &err];
//    if (err == nil) {
//        NSLog(@"download message is %@", summerFruitData);
//    } else {
//        NSLog(@"download fail error message is %@", err.description);
//    }
    NSData* summerFruitData;
    NSError* err;
    NSURL* url;
    url = [NSURL URLWithString:@"https://puxin-34420.firebaseapp.com/summer.json"];
    summerFruitData = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&err];
    if (err == nil) {
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:summerFruitData options:NSJSONReadingAllowFragments error:&err];
        if (err == nil) {
            NSString* xxx = [json valueForKey:@"分類"];
            NSLog(@"key 分類 is %@", xxx);
            north = [json valueForKey:@"北部"];
            middle = [json valueForKey:@"中部"];
            south = [json valueForKey:@"南部"];
        }else {
            NSLog(@"download fail error message is %@", err.description);
        }
    } else {
        NSLog(@"download fail error message is %@", err.description);
    }
}

- (IBAction)loadSprint:(UIButton *)sender {

}

#pragma MARK - UICollectionViewDelegate, UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"abc" forIndexPath:indexPath];
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView* reusable;
    if (kind == UICollectionElementKindSectionHeader) {
        reusable = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    } else if (kind == UICollectionElementKindSectionFooter) {
        reusable = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
    }
    return  reusable;
}
@end
