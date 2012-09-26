//
//  Favorites.m
//  PimpGloves_TEST
//
//  Created by Barbara Collignon on 10/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define sectionCount 2 
#define sect1Section2 0 // Catalogue
#define sect2Section2 1 // create glove

#import "Favorites.h"

@implementation Favorites

//@synthesize navigBar,bottomBar,item, navItem;
@synthesize gloveData2,gloveSections2,sect1Gloves2,sect2Gloves2;

-(IBAction) createfavorite {

    gloveSections2=[[NSMutableArray alloc] initWithObjects:@"My Catalogue",@"My Creation",nil];
    
    sect1Gloves2=[[NSMutableArray alloc] init];
    sect2Gloves2=[[NSMutableArray alloc] init];
  
    
    //Catalogue
    [sect1Gloves2 addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"INV1",@"name",@"inventory1.jpg",@"picture",@"http://www.facebook.com/photo.php?fbid=197364466949507&set=a.197364390282848.49624.149598251726129&type=1&theater",@"url",nil]];
   
  //  [sect1Gloves2 release];
   
    
    //My Creation
    [sect2Gloves2 addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"SMS1",@"name",@"sms1.jpg",@"picture",@"http://www.facebook.com/photo.php?fbid=194492430570044&set=a.194492407236713.48325.149598251726129&type=1&theaters",@"url",nil]];
    //  [sect2Gloves addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"SMS2",@"name",@":heater",@"url",nil]];

 //   [sect2Gloves2 release];
    
    gloveData2=[[NSMutableArray alloc] initWithObjects:sect1Gloves2,sect2Gloves2,nil];
    
     [sect1Gloves2 release];
     [sect2Gloves2 release];
   
    sect1Gloves2=nil;
    sect2Gloves2=nil;
    
  
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
      return [gloveSections2 objectAtIndex:section];
    
}


- (void)viewDidLoad
{
    [self createfavorite];
  //  self.navItem.title = @"Favorite"
     self.navigationItem.title = @"Favorite";
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
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
    //  return 1;
    return sectionCount;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // return 0;
    return [[gloveData2 objectAtIndex:section] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell.
    switch (indexPath.section) {
        case sect1Section2:
            //   [[cell textLabel]setText:@"cotton1"];
            //  [[cell imageView]setImage:[UIImage imageNamed:@"cotton1.jpg"]];   
            //  [[cell textLabel]setText:@"cotton2"];
            [[cell textLabel] setText:[[[gloveData2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"name"]];
            [[cell imageView] setImage:[UIImage imageNamed:[[[gloveData2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"picture"]]]; 
            break;
            
        case sect2Section2:
            //  [[cell textLabel]setText:@"velvet1"] ;
            //   [[cell imageView]setImage:[UIImage imageNamed:@"velvet1.jpg"]];      
            //  [[cell textLabel]setText:@"velvet2"] ;
            [[cell textLabel] setText:[[[gloveData2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"name"]];
            [[cell imageView] setImage:[UIImage imageNamed:[[[gloveData2 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"picture"]]]; 
            break;
            
                  
            
        default:
            [[cell textLabel]setText:@"unknown"] ;
            break;
    }
    
  //  cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
      
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
    [gloveSections2 release]; 
    // [item release];
   // [navigBar release];
   // [bottomBar release];
   // [navItem release];
}

@end
