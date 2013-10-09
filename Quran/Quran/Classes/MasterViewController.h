//
//  MasterViewController.h
//  Quran
//
//  Created by rashid_iMac on 27/09/13.
//  Copyright (c) 2013 rashid_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController<NSXMLParserDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (nonatomic, strong)NSMutableString *sura;
@property (nonatomic, strong)NSMutableArray *suraTitle;
@property (nonatomic, strong)NSMutableDictionary *suraDict;
@property (nonatomic, strong)NSMutableString *aya;

@property (nonatomic, strong)NSMutableArray *indexArray;
@end
