//
//  HPCNewsFinder.m
//  Instant HPC
//
//  Created by Barbara Collignon on 10/10/11.
//  Copyright 2012 Beckersweet Technology Inc. All rights reserved.
//

#import "HPCNewsFinder.h"

@interface NSString (parsing) 

-(NSString*) replace_em ;
-(NSString*) find_link1 ;
-(NSString*) removeLink;
-(NSString*) removeLink2;
-(NSString*) removeLink3;
-(NSString*) removejustin;
-(NSString*) removeBS;
-(NSString*) Link;

@end 

@implementation HPCNewsFinder 

@synthesize delegate,myarray;
//,mydetaillink;

-(void)getHPCNews{
    nbtweet=0;
    besthpcnews=[[NSMutableArray alloc] init];
    [myarray=[NSMutableArray alloc] init ];
 //   myarray=[[NSMutableArray alloc] init];
    isHPCnews=YES;
    TwitterConnection *connection= [[TwitterConnection alloc] init];
    connection.delegate=self;
 
    
   // [connection performSearch:@"GPU"];
   [connection performSearch:@"insideHPC"];
  //  [connection performSearch:@"HPCwire"];
    [connection release];

}

-(void)twitterConnection:(TwitterConnection *)connection didReceiveData:(NSData *)data{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate=self;
    [parser parse];
    [parser release];
    parser=nil;
}

-(void)parser:(NSXMLParser*) parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    if([elementName isEqualToString:@"entry"]){
        currentnews= [[bestnews alloc] init];
        isHPCnews=YES;
    } else if ([elementName isEqualToString:@"content"]){
      //   currentstring=[[NSMutableString alloc] initWithCapacity:20];
        currentstring=[[NSMutableString alloc] init];
    } else if ([elementName isEqualToString:@"published"]) {
        currentstring2=[[NSMutableString alloc] init];   
    }
    
}

-(void)parser:(NSXMLParser*) parser didEndElement:(NSString*)elementName namespaceURI:(NSString*) namespaceURI qualifiedName:(NSString*)qName

{
    
    //if(qName != nil) {
        if ([elementName isEqualToString:@"entry"]) {
            if(isHPCnews)
                [besthpcnews addObject:currentnews];
            [currentnews release];
            currentnews=nil;
            
            
            
        } else if([elementName isEqualToString:@"content"]){
           
         //   NSLog(@"INSIDEHPC11: %@",currentstring);
            
            NSString *pretmp=[currentstring replace_em];
            
         //    NSLog(@"INSIDEHPC22: %@",pretmp);
            
            NSString *tmp=[pretmp removeLink3];
            
      //       NSLog(@"INSIDEHPC33: %@",tmp);
            
            NSString *tmp2=[tmp removeLink];
           // NSString *tmp2link = [tmp Link];
            
            
           //  NSLog(@"INSIDEHPC44: %@ : %@",tmp2,tmp2link);
           
            // currentnews.tweet=[tmp removeLink];
            
            currentnews.tweet=[tmp2 removejustin];
                    if(currentnews.tweet==nil){
                isHPCnews=NO;
            }
       
      //  NSLog(@"INSIDEHPC");
            if (currentnews.tweet !=nil) {
                
            
            currentnews.tweetlink=[tmp Link];
                
                if (currentnews.tweetlink == nil) {
                    
                    NSLog(@"%@",currentnews.tweet);
                    
                }
       
       
            }
           //  NSLog(@"INSIDEHPC: %@",currentstring);
            if (currentnews.tweetlink != nil) {
                
            //     NSLog(@"INSIDEHPC2: %@",currentnews.tweet);
            
           //     currentnews.tweet =[currentnews.tweet removeBS];
                
            //    NSLog(@"INSIDEHPC3: %@",currentnews.tweet);
            
                [tweetlink_global addObject:currentnews.tweetlink];
                
                nbtweet++;

             }
    
        } else if ([elementName isEqualToString:@"published"]) {
            currentnews.createdAt = currentstring2;
          //  NSLog(@"created_at:%@",currentstring2);
          //  NSLog(@"created_at:%@",currentstring2);
          //  NSLog(@"created_at:%@",currentstring2);
          //  NSLog(@"created_at:%@",currentstring2);
            
        } else if ([elementName isEqualToString:@"feed"]) {
            //      [currentnews release];
            //       currentnews=nil;
            
            [delegate hpcnewsFinder:self didFindHPCNews:[besthpcnews autorelease]];
            [myarray autorelease];
           // nbtweet=0;
            
            //   [currentstring release];
            //   currentstring=nil;
            
        }
        
        //    [currentnews release];
        //    currentnews=nil;
        [currentstring release];
        currentstring = nil;
        [currentstring2 release];
        currentstring2 = nil;
        
    //}
 //   NSLog(@"break");
    
}


-(void)parser:(NSXMLParser*)parser foundCharacters:(NSString*)string {
    if (currentstring!=nil) {
        [currentstring appendString:string];
        //  [currentstring release];
        //  currentstring = nil;
    } else {
        currentstring = [[NSMutableString alloc] initWithString:string];
    }
    
    if (currentstring2!=nil) {
        [currentstring2 appendString:string];
        //  [currentstring release];
        //  currentstring = nil;
    } else {
        currentstring2 = [[NSMutableString alloc] initWithString:string];
    }
    
  //  NSLog(@"Processing Value: %@", currentstring);
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


@implementation NSString (parsing)



-(NSString*) removejustin{
    
    int index = [self rangeOfString:@"Just in:"].location;
    //  int index2 = [self rangeOfString:@"\">"].location;
    NSString *substring = nil;
    //  NSString *mylink = nil;
    
    if (index < self.length){
       
        substring=[self substringFromIndex:index+8];
    }

    return substring;
}

-(NSString*) removeLink{
    
 //   bestnews *currentnews = [[bestnews alloc] init];
     int index = [self rangeOfString:@"<a href=\""].location;
   //  int index2 = [self rangeOfString:@"\">"].location;
     NSString *substring = nil;
  //  NSString *mylink = nil;
     
     if (index < self.length){
     substring=[self substringWithRange:NSMakeRange(0, index)];
   //  substring=[self substringWithRange:NSMakeRange(0, index)];
     }
   
    /*
    NSRange start = [self rangeOfString:@"<a href=\""];
    NSRange end = [self rangeOfString:@"\">"];
  //  NSRange http = [self rangeOfString:@"<a href=\"http:"];
    if (start.location < self.length) {
        mylink= [self substringWithRange:NSMakeRange(start.location+9, end.location-start.location-9)];
        currentnews.tweetlink=mylink;
      //  [currentnews release];
      //  currentnews=nil;
     //   mylink= [self substringFromIndex:start.location];
        NSLog(@"MYLINK:%@",@"MYLINK");
        NSLog(@"MYLINK:%@",@"MYLINK");
        NSLog(@"MYLINK:%@",@"MYLINK");
        NSLog(@"MYLINK:%@",mylink);
        NSLog(@"MYLINK:%@",@"MYLINK");
        NSLog(@"MYLINK:%@",@"MYLINK");
        NSLog(@"MYLINK:%@",@"MYLINK");
     */

 //   }
     
   // [currentnews release];
     return substring;
    
  //  return nil;
}

-(NSString*) replace_em {
    
    NSString* myString = [[[NSString alloc] init] autorelease];
   // [myString initWithString:self] ;
    
    NSArray* foo = [self componentsSeparatedByString:@"<em>"] ;
    NSString* word = nil ;
   // NSString *test = nil ;
    
    for (word in foo) {
 
            
            myString =  [myString stringByAppendingString:word] ;
        
         // NSLog(@"test1:%@",myString);
    
        
    }
    
  //  NSString *finalString = [[NSString alloc] initWithString:myString];
    
 //   NSLog(@"test2:%@",finalString);
    
    return myString;
    
}

-(NSString*) find_link1 {
    
       
    NSArray* foo = [self componentsSeparatedByString:@" "] ;
    
      
    int i = [foo count] ;
    int j = i-1 ;
    
    
  //  NSLog(@"insidehpc: i : %d : j : %d : %@", i, j, [foo objectAtIndex:j]);
    
    
    
    return [foo objectAtIndex:j];
    
}



-(NSString*) removeLink3 {
    
    
    int index = [self rangeOfString:@"<a class="].location;
    int index2 = [self rangeOfString:@"/a>"].location;
    
    NSString *substring = nil;
    
    if (index > self.length && index2 < self.length){
           substring=[self substringWithRange:NSMakeRange(0,index2)];
         
    } else {
           
    }
    
    return substring;
}

-(NSString*) removeBS {
    
    
    int index = [self rangeOfString:@"http"].location;
    
    
    NSString *substring = nil;
    
    substring=[self substringWithRange:NSMakeRange(0,index)];
    
    return substring;
}

-(NSString*) removeLink2 {
    
    
    int index = [self rangeOfString:@"<a class="].location;
    int index2 = [self rangeOfString:@"/a>"].location;
    
    NSString *substring = nil;
    
    if (index < self.length){
     //   substring=[self substringWithRange:NSMakeRange(index,index2)];
      //   substring=[self substringWithRange:NSMakeRange(0, index2)];
        substring=[self substringFromIndex:index2+4]; 
    } else {
     //   substring=[self substringFromIndex:index2];    
    }
    
    /*
     index = [substring rangeOfString:@"<a class="].location;
     index2 = [substring rangeOfString:@"/a>"].location;
    
    if (index < self.length){
        //   substring=[self substringWithRange:NSMakeRange(index,index2)];
        //   substring=[self substringWithRange:NSMakeRange(0, index2)];
        substring=[self substringToIndex:index]; 
    } else {
        //   substring=[self substringFromIndex:index2];    
    }*/
    
    return substring;
    
    //  return nil;
}


-(NSString*) Link {
    
    
   // int index = [self rangeOfString:@"<a href=\""].location;
  /*
    NSString *substring = nil;
  
    NSRange start = [self rangeOfString:@"<a href=\""];
    NSRange end = [self rangeOfString:@"\">"];
    NSRange http = [self rangeOfString:@"<a href=\"http:"];
    if (start.location < end.location && start.location!=NSNotFound && end.location != NSNotFound & http.location !=NSNotFound) {
        substring = [self substringWithRange:NSMakeRange(9, end.location-9)];
    }
      //   substring = [self substringWithRange:NSMakeRange(index, end-index)];
    NSLog(@"MYLINK:%@",@"MYLINK");
    NSLog(@"MYLINK:%@",@"MYLINK");
    NSLog(@"MYLINK:%@",@"MYLINK");
    NSLog(@"MYLINK:%@",substring);
    NSLog(@"MYLINK:%@",@"MYLINK");
    NSLog(@"MYLINK:%@",@"MYLINK");
    NSLog(@"MYLINK:%@",@"MYLINK");
   */
    
    NSString *mylink=nil;
    NSRange start = [self rangeOfString:@"<a href=\""];
    NSRange end = [self rangeOfString:@"\">"];
    //  NSRange http = [self rangeOfString:@"<a href=\"http:"];
    if (start.location < self.length) {
        mylink= [self substringWithRange:NSMakeRange(start.location+9, end.location-start.location-9)];
      //  currentnews.tweetlink=mylink;
        //  [currentnews release];
        //  currentnews=nil;
        //   mylink= [self substringFromIndex:start.location];
    //    NSLog(@"MYLINK:%@",@"MYLINK");
    //    NSLog(@"MYLINK:%@",@"MYLINK");
     //   NSLog(@"MYLINK:%@",@"MYLINK");
     //   NSLog(@"MYLINK:%@",mylink);
     //   NSLog(@"MYLINK:%@",@"MYLINK");
     //   NSLog(@"MYLINK:%@",@"MYLINK");
     //   NSLog(@"MYLINK:%@",@"MYLINK");
    
        
        }


    
    return mylink;
      
    //  return nil;
}

@end
