//
//  TwitterConnection.m
//  Instant HPC
//
//  Created by Barbara Collignon on 10/10/11.
//  Copyright 2012 Beckersweet Technology Inc. All rights reserved.
//

#import "TwitterConnection.h"

@implementation TwitterConnection

@synthesize delegate;

-(void)performSearch:(NSString*) search {
  
  //  NSDate *now = [NSDate date];
    
 // NSLog(@"now: %@", now); // now: 2011-02-28 09:57:49 +0000
    
  //  NSString *strDate = [[NSString alloc] initWithFormat:@"%@",now];
  //  NSArray *arr = [strDate componentsSeparatedByString:@" "];
  //  NSString *str;
  //  str = [arr objectAtIndex:0];
 // NSLog(@"strdate: %@",str); // strdate: 2011-02-28
    
  //  NSArray *arr_my = [str componentsSeparatedByString:@"-"];
    
  //  NSInteger date = [[arr_my objectAtIndex:2] intValue];
  //  NSInteger month = [[arr_my objectAtIndex:1] intValue];
  //  NSInteger year = [[arr_my objectAtIndex:0] intValue];
    
//  NSLog(@"year = %d", year); // year = 2011
//  NSLog(@"month = %d", month); // month = 2
//  NSLog(@"date = %d", date); // date = 2
    
  //  [strDate release];
    
    
    search = [search stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  //  NSURL *searchURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://search.twitter.com search.atom?q=from:%@",search]]; 
   //  NSURL *searchURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://search.twitter.com/search.atom?q=from:%@&since=%d-%d-%d",search,year,month,date-7]]; 
     NSURL *searchURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://search.twitter.com/search.atom?q=from:%@",search]];
    // NSLog(@"HPC URL: %@",searchURL);
    // NSURLRequest *request=[[NSURLRequest alloc] initWithURL:searchURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:searchURL cachePolicy:NSURLCacheStorageAllowed timeoutInterval:30.0];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self] ;
    
    if(connection){
        
        if (receiveData != nil) {
            [receiveData release];
            receiveData = nil;
        }
        receiveData=[[NSMutableData data] retain];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//        [connection release];
//        connection=nil;
    } else {
        //  NSLog(@"search \"%@\" could not be performed",search);
    }
    
    //    [connection release];
    //  connection=nil;
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    // receiveData.length=0;
    [receiveData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [receiveData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [receiveData release];
    receiveData=nil;
    [connection release];
    connection=nil;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
    [delegate twitterConnection:self didReceiveData:receiveData];
    [receiveData release];
    receiveData=nil;
    [connection release];
    connection=nil;


}

/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 
 - (void)didReceiveMemoryWarning
 {
 // Releases the view if it doesn't have a superview.
 [super didReceiveMemoryWarning];
 
 // Release any cached data, images, etc that aren't in use.
 }
 
 #pragma mark - View lifecycle
 
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 // Do any additional setup after loading the view from its nib.
 }
 
 - (void)viewDidUnload
 {
 [super viewDidUnload];
 // Release any retained subviews of the main view.
 // e.g. self.myOutlet = nil;
 }
 
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
 {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

@end
