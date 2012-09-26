//
//  HPCNewsFinder.m
//  Instant HPC
//
//  Created by Barbara Collignon on 10/10/11.
//  Copyright 2012 Beckersweet Technology Inc. All rights reserved.
//

#import "HPCNewsFinderFun.h"

@interface NSString (parsing) 


-(NSString*) removeLink;
-(NSString*) removeLink2;
-(NSString*) removeLink3;
-(NSString*) removeLink4;
-(NSString*) removejustin;
-(NSString*) Link;


@end

@implementation HPCNewsFinderFun

@synthesize delegate,myarray,currentstring;
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
    [connection performSearch:@"myictcloud"];
    
    //[connection performSearch:@"myictcloud"];
  //   [connection performSearch:@"isupercomputing"];
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
    
    currentElement=elementName;
    if([elementName isEqualToString:@"entry"]){
        currentnews= [[bestnews alloc] init];
        isHPCnews=YES;
    } else if ([elementName isEqualToString:@"content"]){
      //   currentstring=[[NSMutableString alloc] initWithCapacity:20];
        currentstring=[[NSMutableString alloc] init];
    } else if ([elementName isEqualToString:@"author"]) {
        AuthorActive=YES;
        currentname=[[NSMutableString alloc] init];   
        //currentstring3=[[NSMutableString alloc] init];
    } else if ([elementName isEqualToString:@"retweeted"]) {
        currentRetweet=[[NSMutableString alloc] init];
    } else if ([elementName isEqualToString:@"published"]) {
        currentstring2=[[NSMutableString alloc] init];   
    }
    
}

-(void)parser:(NSXMLParser*) parser didEndElement:(NSString*)elementName namespaceURI:(NSString*) namespaceURI qualifiedName:(NSString*)qName

{
    
   //  for myictcloud uncomment here
     
    //if(qName != nil) {
        if ([elementName isEqualToString:@"entry"]) {
            if(isHPCnews)
                [besthpcnews addObject:currentnews];
            [currentnews release];
            currentnews=nil;
                 
        } else if([elementName isEqualToString:@"content"]){
           
             
        NSString *tmp2=[currentstring removeLink2];
                 
        if(tmp2 == nil){
             
            if([currentstring removeLink] == nil){
              currentnews.tweet=currentstring;
            } else {
                currentnews.tweet= nil;  
                
            }
            
           //  currentnews.tweet=currentstring;
           //   int a=[[currentstring componentsSeparatedByString:@" "] count];
            //  NSLog(@"%@:count:%d",currentstring,a);
                
       
         //   NSLog(@"%@",currentstring);
            
            
        } else {
                          
            NSRange wordRange = NSMakeRange(0,3);
       
          
            if(currentstring != nil) {
            
                NSArray *firstWords = [[currentstring componentsSeparatedByString:@" "] subarrayWithRange:wordRange];
                
                             
                if(firstWords != nil){
                    if ([firstWords objectAtIndex:2] != nil) {
                      //   NSLog(@"STUFFF2222");
                     
                         if([[firstWords objectAtIndex:2] isEqualToString:@"class=\""]) {
            
                           currentnews.tweet=nil;
                
                          } else {
                
                              currentnews.tweet=nil;
                     
                      
                          }
                
                     } else {
                
                      currentnews.tweet=nil;
                   //   NSLog(@"STUFFF333333");
                
                     }    
                }
       
            }
            
           if(currentnews.tweet == nil ) {
                if(tmp2 != nil){
                   currentnews.tweet=tmp2 ;
                
                   if([tmp2 Link] != nil){
                    currentnews.tweet=[tmp2 removeLink];
                   }
                }
           } else {
                currentnews.tweet=nil;
            }
          
                
               wordRange = NSMakeRange(0,3);
             //  wordRange = NSMakeRange(0,1);
          
               NSArray *secondWords = [[currentstring componentsSeparatedByString:@" "] subarrayWithRange:wordRange];
            
           
            
            
            if(secondWords != nil){
                if([secondWords objectAtIndex:2] != nil){
                  if([[secondWords objectAtIndex:2] isEqualToString:@"class=\""]) {
                
                      currentnews.tweet=nil;
                
                  } else {
                      
                      currentnews.tweet=nil;
                  }
                    
                    
                } else {
                    currentnews.tweet=nil;
                }
            
            }
            
           
        } 
    
    
            
         //   NSLog(@"currentnews:%@",currentnews.tweet);
         //  NSLog(@"currentword:%@",[firstWords objectAtIndex:2]);
            [tweetlink_global addObject:currentnews.tweetlink];
            nbtweet++;
     
                    if(currentnews.tweet==nil){
                isHPCnews=NO;
            }
       
        } else if ([elementName isEqualToString:@"author"]) {
            
                    
            AuthorActive=NO;
          
        } else if ([elementName isEqualToString:@"retweeted"]){
            
          //  NSLog(@"retweet:%@",currentRetweet);
                
                    
        } else if ([elementName isEqualToString:@"published"]) {
            currentnews.createdAt = currentstring2;
          //  NSLog(@"created_at:%@",currentstring2);
          //  NSLog(@"created_at:%@",currentstring2);
          //  NSLog(@"created_at:%@",currentstring2);
          //  NSLog(@"created_at:%@",currentstring2);
            
        } else if ([elementName isEqualToString:@"feed"]) {
            //      [currentnews release];
            //       currentnews=nil;
            
            [delegate hpcnewsFinderFun:self didFindHPCNews:[besthpcnews autorelease]];
            [myarray autorelease];
         
            
        }
        
      
        [currentstring release];
        currentstring = nil;
        [currentstring2 release];
        currentstring2 = nil;
  //  [currentstring3 release];
  //  currentstring3 = nil;
    [currentname release];
    currentname = nil;
    [currentRetweet release];
    currentRetweet = nil;
    
     
   
    
    //if(qName != nil) {
    if ([elementName isEqualToString:@"entry"]) {
        if(isHPCnews)
            [besthpcnews addObject:currentnews];
        [currentnews release];
        currentnews=nil;
        
        
        
    } else if([elementName isEqualToString:@"content"]){
        
        /*
         for myictcloud uncomment here
         
        NSString *tmp=[currentstring removeLink3];
        currentnews.tweetlink=[tmp Link];
        
        [tweetlink_global addObject:currentnews.tweetlink];
        nbtweet++;
        //  NSLog(@"nbtweet:%d %@",nbtweet,currentnews.tweetlink);
        //    NSLog(@"nbtweet:%d %@",nbtweet,currentnews.tweetlink);
        //    NSLog(@"nbtweet:%d %@",nbtweet,currentnews.tweetlink);
        //    NSLog(@"nbtweet:%d %@",nbtweet,currentnews.tweetlink);
        //    NSLog(@"nbtweet:%d %@",nbtweet,currentnews.tweetlink);
        //    NSLog(@"nbtweet:%d %@",nbtweet,currentnews.tweetlink);
        //    NSLog(@"nbtweet:%d %@",nbtweet,currentnews.tweetlink);
        //    NSLog(@"nbtweet:%d %@",nbtweet,currentnews.tweetlink);
        NSString *tmp2=[tmp removeLink];
        //  currentnews.tweet=[tmp removeLink];
        currentnews.tweet=[tmp2 removejustin];
        if(currentnews.tweet==nil){
            isHPCnews=NO;
        
         for myictcloud uncomment here
         */ 
        
        NSString *tmp=[currentstring removeLink3];
        currentnews.tweetlink=[tmp Link];
        [tweetlink_global addObject:currentnews.tweetlink];
        
        nbtweet++;
     //   NSLog(@"nbtweet:%d %@",nbtweet,currentnews.tweetlink);
        
        NSString *tmp2=[tmp removeLink];
        // currentnews.tweet=[tmp removeLink];
        currentnews.tweet=tmp2 ;
        
        if(currentnews.tweet==nil || currentnews.tweetlink==nil){
            isHPCnews=NO;
        }
        
    //    NSLog(@"nbtweet:%d %@",nbtweet,currentnews.tweet);
               
        
    } else if ([elementName isEqualToString:@"published"]) {
        currentnews.createdAt = currentstring2;
        //  NSLog(@"created_at:%@",currentstring2);
        //  NSLog(@"created_at:%@",currentstring2);
        //  NSLog(@"created_at:%@",currentstring2);
        //  NSLog(@"created_at:%@",currentstring2);
        
    } else if ([elementName isEqualToString:@"feed"]) {
        //      [currentnews release];
        //       currentnews=nil;
        
        [delegate hpcnewsFinderFun:self didFindHPCNews:[besthpcnews autorelease]];
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
 
    if (currentRetweet!=nil) {
        [currentRetweet appendString:string];
      //  NSLog(@"Retweet:%@",currentRetweet);
        //  [currentstring release];
        //  currentstring = nil;
    } else {
        currentRetweet = [[NSMutableString alloc] initWithString:string];
    } 
    
    if (currentstring!=nil) {
        [currentstring appendString:string];
      //   NSLog(@"currentnews:%@",currentnews.tweet);
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
    
    
    
    
    if(AuthorActive) {

     //   NSString *fixedString = [string stringByAppendingFormat:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if ([currentElement isEqualToString:@"name"]) {
            if(currentname != nil) {
         //     [currentname appendString:fixedString];
                  [currentname appendString:string];
             //   NSLog(@"AUTHOR:%@",currentname);
        //  [currentstring release];
        //  currentstring = nil;
             } else {
              currentname = [[NSMutableString alloc] initWithString:string];
             }
        }   
     }
    
  //  NSLog(@"Processing Value: %@", currentstring);
}


/*
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

-(NSString *) parseCost{
        return nil;
}

-(NSArray*) parseLocation{
    return nil;
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
   
       
   // [currentnews release];
     return substring;
    
  //  return nil;
}

-(NSString*) removeLink3 {
   
    int index = [self rangeOfString:@"<a class"].location;
    int index2 = [self rangeOfString:@"/a >"].location;
    
    NSString *substring = nil;
    
    if (index > self.length && index2 < self.length){
        substring=[self substringWithRange:NSMakeRange(0,index2)];
        //   substring=[self substringWithRange:NSMakeRange(0, index2)];
        // substring=[self substringFromIndex:index2+4]; 
    } else {
        substring=self; 
    }
    
    return substring;
    
}


-(NSString*) removeLink2 {
    
    //  int index = [self rangeOfString:@"RT"].location;
    int index2 = [self rangeOfString:@"RT"].location;
   // int index3 = [self rangeOfString:@"/a>"].location;
    
    
    NSString *substring = nil;
    
   // NSLog(@"INDEX2:%d",index2);
    
    // if (index > self.length && index2 < self.length){
    if(index2 < self.length ){ 
         // substring=[self substringWithRange:NSMakeRange(0,index2)];
        //  substring=[self substringFromIndex:index2+index3+4];
        substring=nil;
        
    } else {
        substring=self;
    }
    
    return substring;

}

-(NSString*) removeLink4 {
    
    //  int index = [self rangeOfString:@"RT"].location;
    int index2 = [self rangeOfString:@"<a class="].location;
  //  int index3 = [self rangeOfString:@"/a>"].location;
    
    
    NSString *substring = nil;
    
    // if (index > self.length && index2 < self.length){
    if(index2 < self.length){ 
        //  substring=[self substringWithRange:NSMakeRange(0,index2)];
        substring=nil;
        
    } else {
        substring=self;
    }
    
    return substring;
    
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
