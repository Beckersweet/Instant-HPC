//
//  Favorites.h
//  Instant HPC
//
//  Created by Barbara Collignon on 10/3/11.
//  Copyright 2012 Beckersweet Technology Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPCNewsCellFav.h"

//Boolean myBOOL=NO;

@interface Favorites : UITableViewController <UITableViewDataSource,UITableViewDelegate> {
//@interface Favorites : UITableViewController {
  
    NSArray *hpcnews;
    NSMutableArray *gloveData2;
    NSMutableArray *gloveSections2;
    NSMutableArray *sect1Gloves2;
    NSMutableArray *sect2Gloves2;
 //   UIImage *myfavimage;
    NSString *myfavtweet;
    NSURL *myfavurl;
    UIActivityIndicatorView *activityView;
 
}

@property (nonatomic, copy, readwrite) NSMutableArray *gloveData2;
@property (nonatomic, copy, readwrite) NSMutableArray *gloveSections2;
@property (nonatomic, copy, readwrite) NSMutableArray *sect1Gloves2;
@property (nonatomic, copy, readwrite) NSMutableArray *sect2Gloves2;
//@property (nonatomic, retain) UIImage *myfavimage;
@property (nonatomic, retain) NSString *myfavtweet;
@property (nonatomic, retain) NSURL *myfavurl;

-(void)getFavorites;
-(void)refreshFavorite;
-(IBAction) createfavorite;

@end
