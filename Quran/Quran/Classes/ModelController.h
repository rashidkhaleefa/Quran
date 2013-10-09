//
//  ModelController.h
//  Tasbeeh
//
//  Created by rashid khaleefa on 27/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelController : NSObject

@property (nonatomic,retain) NSMutableDictionary *prefDict;

@property (nonatomic,retain) NSString   *prefDictFilePath;


- (void) setcountArrayDict:(NSDictionary*)countArrayDict;

- (NSMutableDictionary*) countArrayDict;

- (void) setIndexArray:(NSArray*)indexArray;

- (NSMutableArray*) indexArray;

- (void) updatePrefDictData;


@end

