//
//  HPCNewsFinder.h
//  Instant HPC
//
//  Created by Barbara Collignon on 10/10/11.
//  Copyright 2012 Beckersweet Technology Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwitterConnection.h"
#import "bestnews.h"

@protocol HPCNewsFinderDelegateFun; 

int nbtweet;

@interface HPCNewsFinderFun : NSObject <TwitterConnectionDelegate,NSXMLParserDelegate> {
    
    id <HPCNewsFinderDelegateFun> delegate;
    NSMutableArray *besthpcnews;
    bestnews *currentnews;
  //  NSString *tweetlink_global;
    NSMutableArray *myarray;
   // int nbtweet;
    NSMutableString *currentstring;
    NSMutableString *currentname;
     NSMutableString *currentstring2;
    NSString *currentElement;
    NSMutableString *currentRetweet;

  //  NSString *mydetaillink;
    BOOL isHPCnews;
    BOOL AuthorActive;
    
}

@property (nonatomic,retain)  NSMutableString *currentstring;
@property (nonatomic,retain) NSMutableArray *myarray;
@property (nonatomic,assign)id <HPCNewsFinderDelegateFun> delegate;
//@property (nonatomic,retain) NSString *mydetaillink;

-(void) getHPCNews;

@end

@protocol HPCNewsFinderDelegateFun 

-(void)hpcnewsFinderFun:(HPCNewsFinderFun*)finder didFindHPCNews:(NSArray*)news;

@end

 
