//
//  Favorites.h
//  PimpGloves_TEST
//
//  Created by Barbara Collignon on 10/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//Boolean myBOOL=NO;

@interface Favorites : UITableViewController <UITableViewDataSource,UITableViewDelegate> {
//@interface Favorites : UITableViewController {
  
   
    NSMutableArray *gloveData2;
    NSMutableArray *gloveSections2;
    NSMutableArray *sect1Gloves2;
    NSMutableArray *sect2Gloves2;
 //  UINavigationBar *navigBar ;
 // UINavigationItem *navItem ;
  //  UIToolbar *bottomBar;
  //  UIBarButtonItem *item;


}

@property (nonatomic, copy, readwrite) NSMutableArray *gloveData2;
@property (nonatomic, copy, readwrite) NSMutableArray *gloveSections2;
@property (nonatomic, copy, readwrite) NSMutableArray *sect1Gloves2;
@property (nonatomic, copy, readwrite) NSMutableArray *sect2Gloves2;
//@property (nonatomic,retain) IBOutlet UINavigationBar *navigBar ;
//@property (nonatomic,retain) IBOutlet UIToolbar *bottomBar ;
//@property (nonatomic,retain) IBOutlet UIBarButtonItem *item ;
//@property (nonatomic,retain) IBOutlet UINavigationItem *navItem ;

-(IBAction) createfavorite;

@end
