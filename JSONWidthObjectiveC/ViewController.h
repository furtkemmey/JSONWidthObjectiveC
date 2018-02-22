//
//  ViewController.h
//  JSONWidthObjectiveC
//
//  Created by KaiChieh on 22/02/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
- (IBAction)loadSummer:(UIButton *)sender;
- (IBAction)loadSprint:(UIButton *)sender;


@end

