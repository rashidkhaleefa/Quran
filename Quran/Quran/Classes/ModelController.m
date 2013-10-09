///
//  ModelController.m
//  Tasbeeh
//
//  Created by rashid khaleefa on 27/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModelController.h"

@implementation ModelController
@synthesize prefDict,prefDictFilePath;


-(id)init 
{
    self = [super init];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    self.prefDictFilePath = [documentsDirectory stringByAppendingPathComponent:@"PrefData.plist"]; 
        
    self.prefDict = [NSMutableDictionary dictionaryWithContentsOfFile:self.prefDictFilePath];
    
    if(!self.prefDict || ![self.prefDict count])
    {
        self.prefDict = [NSMutableDictionary dictionary];
        [self.prefDict setObject:[NSMutableDictionary dictionary] forKey:@"SavedDetailsDict"];
        
        [self.prefDict setObject:[NSMutableArray array] forKey:@"SavedIndexArray"];
    }
    
    return self;
}

- (NSMutableDictionary*) countArrayDict
{            
    return [self.prefDict objectForKey:@"SavedDetailsDict"];
}

- (NSMutableArray*)indexArray{
    return [self.prefDict objectForKey:@"SavedIndexArray"];
}

- (void) updatePrefDictData
{
    if([self.prefDict writeToFile:self.prefDictFilePath atomically:YES])
        NSLog(@"Successfully updated!");
    else
        NSLog(@"Failed updated!");
}

- (void) setcountArrayDict:(NSDictionary *)countArrayDict
{
     if([countArrayDict count]==0){
         [[self countArrayDict] removeAllObjects];
         [self updatePrefDictData];
     }
     else{
    [[self countArrayDict] addEntriesFromDictionary:countArrayDict];
    [self updatePrefDictData];
     }
}

-(void) setIndexArray:(NSArray *)indexArray{
    
    [[self indexArray]addObjectsFromArray:indexArray];
    [self updatePrefDictData];
}




@end
