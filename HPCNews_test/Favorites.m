//
//  Favorites.m
//  Instant HPC
//
//  Created by Barbara Collignon on 10/3/11.
//  Copyright 2012 Beckersweet Technology Inc. All rights reserved.
//

#define sectionCount 1 
#define sect1Section2 0 // Catalogue


#import "Favorites.h"
#import "bestnews.h"
#import "DetailViewController.h"
//#import "DetailViewController.h"
@class Favorites;

static const int rowHeight=117;

@implementation Favorites

- (id)initWithStyle:(UITableViewStyle)style 
{
    style = UITableViewStyleGrouped;
    
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.tableView.sectionHeaderHeight=51;
        self.tableView.sectionFooterHeight=2;
    }
    return self;
}


//@synthesize navigBar,bottomBar,item, navItem;
@synthesize gloveData2,gloveSections2,sect1Gloves2,sect2Gloves2;
@synthesize myfavtweet,myfavurl;

- (void) refreshFavorite {
    
    UIBarButtonItem *activityButton = [[UIBarButtonItem alloc] initWithCustomView:activityView];
    self.navigationItem.leftBarButtonItem = activityButton;
    [activityButton release];
    [activityView startAnimating];
    [self getFavorites];
}

-(void) getFavorites{
    
    //ADD FAVORITE HERE
    
 
   

    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
 

    if ([prefs objectForKey:@"section"] != nil) {
        sect1Gloves2 = [[NSMutableArray alloc] initWithArray:[prefs objectForKey:@"section"]];
     //   sect2Gloves2 = [[NSMutableArray alloc] initWithArray:[prefs objectForKey:@"section"]];

    } else {
    
    
 //  gloveSections2=[[NSMutableArray alloc] initWithObjects:@"My Catalogue",@"My Creation",nil];
    
    sect1Gloves2=[[NSMutableArray alloc] init];
   // sect2Gloves2=[[NSMutableArray alloc] init];
                            
    }
    
    self.myfavtweet = [prefs objectForKey:@"content"];
    self.myfavurl = [prefs objectForKey:@"url"];

           
  //  NSLog(@"MYURL:%@",self.myfavurl) ;
    
    [sect1Gloves2 addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:self.myfavtweet,@"name",self.myfavurl,@"url",nil]];
    
  //  NSLog(@"FAVTWEET:%@", self.myfavtweet);
            
    //My Creation
  //  [sect2Gloves2 addObject:self.myfavtweet];
   // [sect2Gloves addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"SMS2",@"name",@":heater",@"url",nil]];
    
    gloveData2=[[NSMutableArray alloc] initWithObjects:sect1Gloves2,nil];
   
    [prefs setObject:sect1Gloves2 forKey:@"section"];
    [prefs synchronize];
    
    [sect1Gloves2 release];
  //  [sect2Gloves2 release];
    
    sect1Gloves2=nil;
   // sect2Gloves2=nil;
    
   
    [activityView stopAnimating];
    
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(refreshFavorite)];
    
    self.navigationItem.leftBarButtonItem=refreshButton;
    [refreshButton release];
   [self.tableView reloadData];
}



-(IBAction) createfavorite {
    
    //ADD FAVORITE HERE
    
 //   gloveSections2=[[NSMutableArray alloc] initWithObjects:@"My Catalogue",@"My Creation",nil];
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
       
    if ([prefs objectForKey:@"section"] != nil) {
        sect1Gloves2 = [[NSMutableArray alloc] initWithArray:[prefs objectForKey:@"section"]];
 //       sect2Gloves2 = [[NSMutableArray alloc] initWithArray:[prefs objectForKey:@"section"]];
        
    } else {
       
        
        sect1Gloves2=[[NSMutableArray alloc] init];
   //     sect2Gloves2=[[NSMutableArray alloc] init];
        
    }
    

      
    gloveData2=[[NSMutableArray alloc] initWithObjects:sect1Gloves2,nil];
    
    [prefs setObject:sect1Gloves2 forKey:@"section"];
    [prefs synchronize];
    
    [sect1Gloves2 release];
 //   [sect2Gloves2 release];
    
    sect1Gloves2=nil;
  //  sect2Gloves2=nil;
    

    
    
    
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
  //    return [gloveSections2 objectAtIndex:section];
    
//}


- (void)viewDidLoad
{
    self.navigationItem.title = @"Favorites";
    self.tableView.rowHeight=rowHeight;


    UIBarButtonItem *activityButton = [[UIBarButtonItem alloc] initWithCustomView:activityView];
    self.navigationItem.leftBarButtonItem = activityButton;
    [activityButton release];
    [activityView startAnimating];
   // [self getFavorites];
    
  //  [self createfavorite];
  //   NSUserDefaults *prefs = [[NSUserDefaults alloc] init];
    
    // Get a copy of the list of favorites
 //    gloveData2=[[NSMutableArray alloc] initWithArray:[prefs objectForKey:@"myglovedata2"]];
    [self createfavorite];
    
    
    self.tableView.editing = YES;
    self.tableView.allowsSelectionDuringEditing = YES ;
    
  //  self.navItem.title = @"Favorite"
       // add left bar button item here fro refresh
    [activityView stopAnimating];
    
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(refreshFavorite)];
    
    self.navigationItem.leftBarButtonItem=refreshButton;
    [refreshButton release];
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
   //  [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
  //  [self getFavorites];
    [self.tableView reloadData];
    /// Reset the table by deselecting the current selection
   // [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    //return sectionCount;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // return 0;
    return [[gloveData2 objectAtIndex:section] count];
   // return [sect1Gloves2 count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
       
     static NSString *CellIdentifier = @"HPCNewsCellFav";
     
     HPCNewsCellFav *cell = (HPCNewsCellFav*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if (cell == nil) {
         cell = [[[HPCNewsCellFav alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
     //    cell =   [[HPCNewsCell alloc] init];
     
     }
    
    
    [[cell tweetLabel] setText:[[[gloveData2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"name"]];
           
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue ;     
 
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete)
 {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert)
 {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;

}



- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath
{
    int fromRow = sourceIndexPath.row;
    int toRow = destinationIndexPath.row;
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
  
    // Remove item from current position
    NSString *item = [[[gloveData2 objectAtIndex:sourceIndexPath.section] objectAtIndex:fromRow]retain];
   
    [[gloveData2 objectAtIndex:sourceIndexPath.section] removeObjectAtIndex:fromRow];
    
    // Insert cell at new position
    if (fromRow < toRow) {
        // Moving Down
        if (toRow == [[gloveData2 objectAtIndex:destinationIndexPath.section] count])
            // Add to end of cell array
            [[gloveData2 objectAtIndex:destinationIndexPath.section] addObject:item];
        else
            [[gloveData2 objectAtIndex:destinationIndexPath.section] insertObject:item atIndex:toRow];
    } else {
        // Moving Up
        [[gloveData2 objectAtIndex:destinationIndexPath.section] insertObject:item atIndex:toRow];
    }
    [item release];
    
    // Immediately save updated favorites to disk
  //  [[Preferences sharedInstance] setObject:gloveData2 forKey:@"kFavorites"];
    
   // [prefs setObject:gloveData2 forKey:@"myglovedata2"]; 
    [prefs setObject:[gloveData2 objectAtIndex:destinationIndexPath.section] forKey:@"section"];
}

- (BOOL)table:(UITableView*)table canDeleteRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Remove the item from the table
        [[gloveData2 objectAtIndex:indexPath.section] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
       // Immediately save updated favorites to disk
      //  [[Preferences sharedInstance] setObject:favorites forKey:kFavorites];
      // [prefs setObject:gloveData2 forKey:@"myglovedata2"];
        [prefs setObject:[gloveData2 objectAtIndex:indexPath.section] forKey:@"section"];
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
  
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];

    
   // sect1Gloves2 = nil;
    
   // sect1Gloves2 = [[NSMutableArray alloc] initWithArray:[prefs objectForKey:@"section"]];
        //       sect2Gloves2 = [[NSMutableArray alloc] initWithArray:[prefs objectForKey:@"section"]];
   
    NSMutableArray *myarray = [[[NSMutableArray alloc] initWithArray:[prefs objectForKey:@"section"]] autorelease];
    
    if (myarray == nil) {
    //    NSLog(@"sect1Glove2 is nil");
    }
    
    NSMutableArray *myfinalarray = nil;
    
    myfinalarray = [[[NSMutableArray alloc] initWithObjects:myarray,nil] autorelease];
    
    if (myfinalarray == nil) {
    //    NSLog(@"gloveData2 is nil");
    }
    
    
 //  NSLog(@"before filling url");

    
    // Pass the selected object to the new view controller.
  //  detailViewController.detailURL=[NSURL URLWithString:[[myfinalarray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"url"];
  //  detailViewController.detailURL = [[prefs objectForKey:@"section"]objectForInfoDictionaryKey:@"url"] ;
    
    NSString *mystringurl = [[[NSString alloc] initWithString:[[[myfinalarray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"url"]]autorelease] ;
    
    detailViewController.detailURL = [NSURL URLWithString:mystringurl] ;
   
  //   NSLog(@"before pushviewcontroller:%@",detailViewController.detailURL);

      
  //  detailViewController.tweetcontent=news.tweet ;
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
   
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
    [gloveData2 release];
    [myfavurl release];
    [myfavtweet release];

}

@end
