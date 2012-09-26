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

@protocol HPCNewsFinderDelegateFeedWire; 

int nbtweet;

@interface HPCNewsFinderFeedWire : NSObject <TwitterConnectionDelegate,NSXMLParserDelegate> {
    
    id <HPCNewsFinderDelegateFeedWire> delegate;
    NSMutableArray *besthpcnews;
    bestnews *currentnews;
  //  NSString *tweetlink_global;
    NSMutableArray *myarray;
   // int nbtweet;
    NSMutableString *currentstring;
     NSMutableString *currentstring2;
  //  NSString *mydetaillink;
    BOOL isHPCnews;
    
}


@property (nonatomic,retain) NSMutableArray *myarray;
@property (nonatomic,assign)id <HPCNewsFinderDelegateFeedWire> delegate;
//@property (nonatomic,retain) NSString *mydetaillink;

-(void) getHPCNews;

@end

@protocol HPCNewsFinderDelegateFeedWire 

-(void)hpcnewsFinderFeedWire:(HPCNewsFinderFeedWire*)finder didFindHPCNews:(NSArray*)news;

@end


