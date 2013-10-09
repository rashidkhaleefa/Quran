//
//  MasterViewController.m
//  Quran
//
//  Created by rashid_iMac on 27/09/13.
//  Copyright (c) 2013 rashid_iMac. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "AppDelegate.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}
-(void)loadView{
    _suraDict = [[AppDelegate modelController] countArrayDict];
    _indexArray =[[AppDelegate modelController]indexArray];
    
    if(!_suraDict || ![_suraDict count])
    {
        _suraTitle = [NSMutableArray array];
        _suraDict =[NSMutableDictionary dictionary];
        _indexArray = [NSMutableArray array];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"quran-simple" ofType:@"xml"];
        NSData *Mydata = [NSData dataWithContentsOfFile:filePath];
        NSXMLParser *parser = [[NSXMLParser alloc]initWithData:Mydata];
        
        parser.delegate = self;
        [parser parse];
        
    }
    else{
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.detailViewController.detailItem = [ _suraDict valueForKey:[_indexArray objectAtIndex:0]];
        }
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
       self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - NSXMLparser
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"sura"]){
        
        _sura = [NSMutableString string];
        
        _sura = [attributeDict objectForKey:@"name"];
    }
    else if([elementName isEqualToString:@"aya"]){
        _aya = [NSMutableString string];
        
        [_suraTitle addObject:[attributeDict objectForKey:@"text"]];
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if([elementName isEqualToString:@"sura"]){
        [_suraDict setObject:_suraTitle forKey:_sura];
        [_indexArray addObject:_sura];
        _suraTitle = [NSMutableArray array];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    //   NSLog(@"foundCharacters : %@", string);
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
    [[AppDelegate modelController]setcountArrayDict:_suraDict];
    [[AppDelegate modelController]setIndexArray:_indexArray];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.detailViewController.detailItem = [ _suraDict valueForKey:[_indexArray objectAtIndex:0]];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_indexArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    tableView.separatorColor = [UIColor colorWithRed:0.576 green:0.796 blue:0.008 alpha:1];
    cell.textLabel.text = [_indexArray objectAtIndex:[indexPath row]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
//    // Return NO if you do not want the specified item to be editable.
    return NO;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.detailViewController.detailItem = [ _suraDict valueForKey:[_indexArray objectAtIndex:[indexPath row]]];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setDetailItem:[ _suraDict valueForKey:[_indexArray objectAtIndex:[indexPath row]]]];
    }
}

@end
