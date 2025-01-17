//
//  HPCNewsFinder.m
//  Instant HPC
//
//  Created by Barbara Collignon on 10/10/11.
//  Copyright 2012 Beckersweet Technology Inc. All rights reserved.
//

#import "HPCNewsFinderFeed.h"

@interface NSString (parsing) 


-(NSString*) removeLink;
-(NSString*) removeBS;
-(NSString*) removeRT;
-(NSString*) replace_em;
-(NSString*) replace_em2;
-(NSString*) find_link9 ;
-(NSString*) removeLink2;
-(NSString*) removeLink3;
-(NSString*) removejustin;
-(NSString*) replace_class;
-(NSString*) Link;

-(NSString*) replace:(NSString*) hashtag ;
-(NSString*) replaceAT:(NSString*) hashtag ;

@end

@implementation HPCNewsFinderFeed 

@synthesize delegate,myarray;
//,mydetaillink;

-(void)getHPCNews{
    
    nbtweet=0;
    besthpcnews=[[NSMutableArray alloc] init];
    [myarray=[NSMutableArray alloc] init ];

    isHPCnews=YES;
    TwitterConnection *connection= [[TwitterConnection alloc] init];
    connection.delegate=self;
 
   // [connection performSearch:@"HPCintheCloud"];
      [connection performSearch:@"HPCWire"];
   // [connection performSearch:@"datanami"];
    
    // NSLog(@"HPCWIRE REFRESH");
    
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
           
             
         //   NSString *tmp=[currentstring removeLink3];
        //   NSLog(@"wire1: %@",currentstring);
        
             NSString *pretmp2=[currentstring replace_em];
         //    NSString *pretmp3=[pretmp2 replace_em2];
            
        //     NSLog(@"wire: %@",pretmp3);
            
            NSString *tmp2=[pretmp2 replace:@"Cloud"];
             tmp2=[tmp2 replaceAT:@"Cloud"];
            tmp2=[tmp2 replace:@"Panasas"];
            tmp2=[tmp2 replaceAT:@"Panasas"];
            tmp2=[tmp2 replace:@"SSD"];
            tmp2=[tmp2 replaceAT:@"SSD"];
            tmp2=[tmp2 replace:@"Moore"];
             tmp2=[tmp2 replaceAT:@"Moore"];
            tmp2=[tmp2 replace:@"Science"];
             tmp2=[tmp2 replaceAT:@"Science"];
            tmp2=[tmp2 replace:@"Engineering"];
            tmp2=[tmp2 replaceAT:@"Engineering"];
            tmp2=[tmp2 replace:@"Economic"];
            tmp2=[tmp2 replaceAT:@"Economic"];
            tmp2=[tmp2 replace:@"Supercomputer"];
             tmp2=[tmp2 replaceAT:@"Supercomputer"];
            tmp2=[tmp2 replace:@"Supercomputing"];
            tmp2=[tmp2 replaceAT:@"Supercomputing"];
            tmp2=[tmp2 replace:@"Privacy"];
            tmp2=[tmp2 replaceAT:@"Privacy"];
            tmp2=[tmp2 replace:@"HPC"];
            tmp2=[tmp2 replaceAT:@"HPC"];
            tmp2=[tmp2 replace:@"Supercomputing"];
             tmp2=[tmp2 replaceAT:@"Supercomputing"];
            tmp2=[tmp2 replace:@"Australia"];
            tmp2=[tmp2 replaceAT:@"Australia"];
            tmp2=[tmp2 replace:@"Google"];
             tmp2=[tmp2 replaceAT:@"Google"];
            tmp2=[tmp2 replace:@"XSEDE"];
            tmp2=[tmp2 replaceAT:@"XSEDE"];
            tmp2=[tmp2 replace:@"SC12"];
            tmp2=[tmp2 replaceAT:@"SC12"];
            tmp2=[tmp2 replace:@"NSF"];
            tmp2=[tmp2 replaceAT:@"NSF"];
            tmp2=[tmp2 replace:@"OpenACC"];
             tmp2=[tmp2 replaceAT:@"OpenACC"];
            tmp2=[tmp2 replace:@"GPU"];
            tmp2=[tmp2 replaceAT:@"GPU"];
            tmp2=[tmp2 replace:@"MIC"];
            tmp2=[tmp2 replaceAT:@"MIC"];
            tmp2=[tmp2 replace:@"ARM"];
             tmp2=[tmp2 replaceAT:@"ARM"];
            tmp2=[tmp2 replace:@"HPC"];
            tmp2=[tmp2 replaceAT:@"HPC"];
            tmp2=[tmp2 replace:@"DOE"];
            tmp2=[tmp2 replaceAT:@"DOE"];
            tmp2=[tmp2 replace:@"BigData"];
            tmp2=[tmp2 replaceAT:@"BigData"];
            tmp2=[tmp2 replace:@"AWS"];
            tmp2=[tmp2 replaceAT:@"AWS"];
            tmp2=[tmp2 replace:@"Clouds"];
            tmp2=[tmp2 replaceAT:@"Clouds"];
            tmp2=[tmp2 replace:@"Exascale"];
             tmp2=[tmp2 replaceAT:@"Exascale"];
            tmp2=[tmp2 replace:@"Java"];
            tmp2=[tmp2 replaceAT:@"Java"];
            tmp2=[tmp2 replace:@"Education"];
            tmp2=[tmp2 replace:@"NICS"];
            tmp2=[tmp2 replaceAT:@"NICS"];
            tmp2=[tmp2 replace:@"ORNL"];
             tmp2=[tmp2 replaceAT:@"ORNL"];
            tmp2=[tmp2 replace:@"NERSC"];
             tmp2=[tmp2 replaceAT:@"NERSC"];
            tmp2=[tmp2 replace:@"Computing"];
             tmp2=[tmp2 replace:@"ARM"];
            tmp2=[tmp2 replaceAT:@"ARM"];
             tmp2=[tmp2 replace:@"Xeon"];
             tmp2=[tmp2 replace:@"Climate"];
            tmp2=[tmp2 replace:@"Storage"];
            tmp2=[tmp2 replace:@"Memory"];
             tmp2=[tmp2 replace:@"Parallel"];
             tmp2=[tmp2 replace:@"Kepler"];
            tmp2=[tmp2 replace:@"Phi"];
             tmp2=[tmp2 replace:@"Intel"];
            tmp2=[tmp2 replaceAT:@"Intel"];
             tmp2=[tmp2 replace:@"NVIDIA"];
             tmp2=[tmp2 replaceAT:@"NVIDIA"];
            tmp2=[tmp2 replace:@"Petascale"];
            tmp2=[tmp2 replace:@"IBM"];
              tmp2=[tmp2 replaceAT:@"IBM"];
            tmp2=[tmp2 replace:@"Cray"];
             tmp2=[tmp2 replaceAT:@"Cray"];
            tmp2=[tmp2 replace:@"Israel"];
            tmp2=[tmp2 replace:@"Software"];
            tmp2=[tmp2 replace:@"Softwares"];
            tmp2=[tmp2 replace:@"Russia"];
            tmp2=[tmp2 replace:@"France"];
            tmp2=[tmp2 replace:@"Germany"];
            tmp2=[tmp2 replace:@"Canada"];
            tmp2=[tmp2 replace:@"Hadoop"];
            tmp2=[tmp2 replace:@"NoSQL"];
            tmp2=[tmp2 replace:@"TIBCO"];
            tmp2=[tmp2 replace:@"SAP"];
            tmp2=[tmp2 replace:@"Proteomics"];
            tmp2=[tmp2 replace:@"MySQL"];
            tmp2=[tmp2 replaceAT:@"MySQL"];
            tmp2=[tmp2 replace:@"MapReduce"];
            tmp2=[tmp2 replaceAT:@"MapReduce"];
            tmp2=[tmp2 replace:@"Hive"];
             tmp2=[tmp2 replaceAT:@"Hive"];
            tmp2=[tmp2 replace:@"Sociology"];
            tmp2=[tmp2 replaceAT:@"Sociology"];
            tmp2=[tmp2 replace:@"NSA"];
             tmp2=[tmp2 replaceAT:@"NSA"];
            tmp2=[tmp2 replace:@"NASA"];
            tmp2=[tmp2 replaceAT:@"NASA"];
            tmp2=[tmp2 replace:@"Storage"];
            tmp2=[tmp2 replaceAT:@"Storage"];
            tmp2=[tmp2 replace:@"Analytics"];
            tmp2=[tmp2 replaceAT:@"Analytics"];
            tmp2=[tmp2 replace:@"DDN"];
            tmp2=[tmp2 replaceAT:@"DDN"];
            tmp2=[tmp2 replace:@"Servers"];
            tmp2=[tmp2 replaceAT:@"Servers"];
            tmp2=[tmp2 replace:@"Server"];
             tmp2=[tmp2 replaceAT:@"Server"];
            tmp2=[tmp2 replace:@"Quantum"];
            tmp2=[tmp2 replaceAT:@"Quantum"];
             tmp2=[tmp2 replace:@"Flash"];
             tmp2=[tmp2 replaceAT:@"Flash"];
            tmp2=[tmp2 replace:@"AMD"];
            tmp2=[tmp2 replaceAT:@"AMD"];
            tmp2=[tmp2 replace:@"ESnet"];
            tmp2=[tmp2 replaceAT:@"ESnet"];
            tmp2=[tmp2 replace:@"Petabytes"];
            tmp2=[tmp2 replaceAT:@"Petabytes"];
            tmp2=[tmp2 replace:@"GPUs"];
            tmp2=[tmp2 replaceAT:@"GPUs"];
            tmp2=[tmp2 replace:@"Titan"];
            tmp2=[tmp2 replaceAT:@"Titan"];
            tmp2=[tmp2 replace:@"Gordon"];
            tmp2=[tmp2 replaceAT:@"Gordon"];
            tmp2=[tmp2 replace:@"India"];
            tmp2=[tmp2 replaceAT:@"India"];
            tmp2=[tmp2 replace:@"DSP"];
            tmp2=[tmp2 replaceAT:@"DSP"];
            tmp2=[tmp2 replace:@"DSPs"];
            tmp2=[tmp2 replaceAT:@"DSPs"];
            tmp2=[tmp2 replace:@"Tennessee"];
            tmp2=[tmp2 replaceAT:@"Tennessee"];
            
            
            //   NSLog(@"wire2: %@",tmp2);
            
            // NSString *tmp3=[tmp2 removeLink3];
           // NSString *mylink = [tmp2 Link] ;
           
            if (tmp2 != nil) {
                
              NSString *tmp3=[tmp2 removeLink3];
              NSString *tmp=[tmp3 removeLink];
              currentnews.tweet = tmp ;
           
            }
            
         
            currentnews.tweet = [currentnews.tweet removeRT];
            
            currentnews.tweet = [currentnews.tweet stringByAppendingString:@"via @HPCwire"];
            
            if(currentnews.tweet==nil || [currentnews.tweet isEqualToString:@""] == TRUE  || [currentnews.tweet isEqualToString:@"@< class=\" href=\""] == TRUE){
               isHPCnews=NO;
                currentnews.tweetlink=nil;
                currentnews.tweet=nil;
            }
            
            
            

            if (isHPCnews) {
                 nbtweet++;
               //    NSLog(@"WIRE");
               
               //  NSLog(@"wire: %@ Link:%@",currentnews.tweet,currentnews.tweetlink);
                currentnews.tweetlink=[tmp2 Link];
             //   NSLog(@"wire: %@ Link:%@",currentnews.tweet,currentnews.tweetlink);
               
                if (currentnews.tweetlink !=nil) {
                    
                
                
                [tweetlink_global addObject:currentnews.tweetlink];
                
                }
                
                if (currentnews.tweetlink == nil && currentnews.tweet != nil) {
                    
                    isHPCnews = NO;
                }

                
                // NSLog(@"nbtweet:%d %@",nbtweet,currentnews.tweetlink);
            }
            
           
             // NSLog(@"nbtweet:%d %@",nbtweet,currentnews.tweet);
            
            
                               
        } else if ([elementName isEqualToString:@"published"]) {
            currentnews.createdAt = currentstring2;
          //  NSLog(@"created_at:%@",currentstring2);
          //  NSLog(@"created_at:%@",currentstring2);
          //  NSLog(@"created_at:%@",currentstring2);
          //  NSLog(@"created_at:%@",currentstring2);
            
        } else if ([elementName isEqualToString:@"feed"]) {
            //      [currentnews release];
            //       currentnews=nil;
            
            [delegate hpcnewsFinderFeed:self didFindHPCNews:[besthpcnews autorelease]];
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
    
   //  NSLog(@"mytweet:%@",currentstring) ;
    
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


-(NSString*) removeRT {
    
    
    int index = [self rangeOfString:@"RT"].location;
    NSLog(@"index:%d,%@",index,self) ;
    
    NSString *substring = nil;
    
    if (index == 0) {
        substring = nil ;
    } else {
        substring = self ;
    }
    
    return  substring;
    
}



-(NSString*) replace_em {
    
    NSString* myString = [[[NSString alloc] init] autorelease];
    // [myString initWithString:self] ;
    
    NSArray* foo = [self componentsSeparatedByString:@"<em>"] ;
    NSString* word = nil ;
    // NSString *test = nil ;
    
    for (word in foo) {
        
        myString =  [myString stringByAppendingString:word] ;
        
    }
    
    //  NSString *finalString = [[NSString alloc] initWithString:myString];
    
    //   NSLog(@"test2:%@",finalString);
    
    return myString;
    
}

-(NSString*) replace_em2 {
    
    NSString* myString = [[[NSString alloc] init] autorelease];
    // [myString initWithString:self] ;
    
    NSArray* foo = [self componentsSeparatedByString:@"</em>"] ;
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

- (NSString*) find_link9 {
    
    
    NSArray* foo = [self componentsSeparatedByString:@" "] ;
    
    int i = [foo count] ;
    int j = i-2 ;
   
    NSLog(@"wire: foo_count:%d,%d,test1:%@",i,j,[foo objectAtIndex:j]);
    
    NSString *mylink=nil;
    NSRange start = [self rangeOfString:@"http"];
    NSRange end = [self rangeOfString:[foo objectAtIndex:j]];
    
 //   NSLog(@"wire:start:%d,end:%d",start.location,end.location);
    
    if (end.location > start.location && ((end.location-start.location) < 100)) {
        
        
    mylink= [self substringWithRange:NSMakeRange(start.location, end.location-start.location)] ;
    
    NSArray *foo2 = [mylink componentsSeparatedByString:@" "];
    
  //  NSLog(@"mylink%d:%@, %d*%@*",[mylink length],mylink,[[foo2 objectAtIndex:0] length],[foo2 objectAtIndex:0]);
    
        if ([mylink length] < 30) {
           //  NSLog(@"mylink%d:%@, %d*%@*",[mylink length],mylink,[[foo2 objectAtIndex:0] length],[foo2 objectAtIndex:0]);
          return [foo2 objectAtIndex:0];
    
        } else {
        
         return nil;
         }
    
    } else if (end.location == start.location) {
        
      
         return [foo objectAtIndex:j];
        
    } else {
        
        return nil ;
        
    }
        
}


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


-(NSString*) replace:(NSString*) hashtag {
    
    NSString* myString =  @"<a href=\"http://search.twitter.com/search?q=%23wordtoreplace\" title=\"#wordtoreplace\" class=\" \">#wordtoreplace</a>" ;
    
    
    
    NSRange rOriginal = [myString rangeOfString:@"wordtoreplace"];
    if (NSNotFound != rOriginal.location) {
        myString = [myString
                    stringByReplacingCharactersInRange:rOriginal
                    withString:hashtag];
        
        //   NSLog(@"MYSTRING:%@",myString);
        
    }
    
    rOriginal = [myString rangeOfString:@"wordtoreplace"];
    if (NSNotFound != rOriginal.location) {
        myString = [myString
                    stringByReplacingCharactersInRange:rOriginal
                    withString:hashtag];
        
        //     NSLog(@"MYSTRING:%@",myString);
        
    }
    
    rOriginal = [myString rangeOfString:@"wordtoreplace"];
    if (NSNotFound != rOriginal.location) {
        myString = [myString
                    stringByReplacingCharactersInRange:rOriginal
                    withString:hashtag];
        
        //    NSLog(@"MYSTRING:%@",myString);
        
    }
    
    
    
    NSArray *words = [self componentsSeparatedByString:myString];
    
    NSMutableString *substring = [[[NSMutableString alloc] init ] autorelease] ;
    
    //int i = [words count] ;
    int j = 0 ;
    
    for (NSString *word in words){
        
        j++;
        
        //   NSLog(@"")
        
        [substring appendString:word];
        
        if (j == 1) {
            
            [substring appendString:hashtag];
            
        }
        
    }
    
    //  [substring release] ;
    
    
    return substring;
    
    
}


-(NSString*) replaceAT:(NSString*) hashtag {
    
    NSString* myString =  @"@<a class=\" \" href=\"https://twitter.com/wordtoreplace\">wordtoreplace</a>" ;
    
    
    
    NSRange rOriginal = [myString rangeOfString:@"wordtoreplace"];
    if (NSNotFound != rOriginal.location) {
        myString = [myString
                    stringByReplacingCharactersInRange:rOriginal
                    withString:hashtag];
        
   //    NSLog(@"MYSTRING:%@",myString);
        
    }
    
    rOriginal = [myString rangeOfString:@"wordtoreplace"];
    if (NSNotFound != rOriginal.location) {
        myString = [myString
                    stringByReplacingCharactersInRange:rOriginal
                    withString:hashtag];
        
  //      NSLog(@"MYSTRING:%@",myString);
        
    }
    
    rOriginal = [myString rangeOfString:@"wordtoreplace"];
    if (NSNotFound != rOriginal.location) {
        myString = [myString
                    stringByReplacingCharactersInRange:rOriginal
                    withString:hashtag];
        
   //     NSLog(@"MYSTRING:%@",myString);
        
    }
    
    
    
    NSArray *words = [self componentsSeparatedByString:myString];
    
    NSMutableString *substring = [[[NSMutableString alloc] init ] autorelease] ;
    
    //int i = [words count] ;
    int j = 0 ; 
    
    for (NSString *word in words){
        
        j++;
        
        //   NSLog(@"")
        
        [substring appendString:word];    
        
        if (j == 1) {
            
            [substring appendString:hashtag];
            
        } 
        
    }
    
 //    NSLog(@"MYSTRING:%@",substring);
    
  //  [substring release] ;
    
  
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

-(NSString*) replace_class {
    
    NSArray *foo = [self componentsSeparatedByString:@" "] ;
    NSString *word = nil;
    NSString *substring = nil;
    
    substring = self;
    
    for (word in foo) {
        
      //  NSLog(@"WORD:%@",word);
        
        if([word isEqualToString:@"class=\""]){
            
            int index = [self rangeOfString:@"class"].location;
            //  int index2 = [self rangeOfString:@"\">"].location;
           
            
            if (index < self.length){
                
                substring=[self substringFromIndex:index+16];
                
            }
            
        }
    }

return substring;
}
    



-(NSString*) removeLink3 {
    
    
    int index = [self rangeOfString:@"<a class="].location;
    int index2 = [self rangeOfString:@"/a>"].location;
    
    NSString *substring = nil;
    
    if (index > self.length && index2 < self.length){
           substring=[self substringWithRange:NSMakeRange(0,index2)];
        //   substring=[self substringWithRange:NSMakeRange(0, index2)];
       // substring=[self substringFromIndex:index2+4]; 
    } else {
        //   substring=[self substringFromIndex:index2];    
    }
    
    return substring;
}

-(NSString*) removeBS {
    
    
    int index = [self rangeOfString:@"<a href=\"http"].location;
  
    
    NSString *substring = nil;
    
    substring=[self substringWithRange:NSMakeRange(0,index-8)];
          
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
