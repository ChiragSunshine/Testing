//
//  ViewController.m
//  WebServiceExample_JSON
//
//  Created by Chirag@Sunshine on 07/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Base64.h"
@implementation ViewController
@synthesize responseDataArray;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    

    UIWebView* webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSString* secretAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    NSLog(@"\n secretAgent = %@",secretAgent);
    
    

    
    
    
    
    /* get_vod_categories
    
    requestObjects = [NSArray arrayWithObjects:@"get_vod_categories",nil];
    requestkeys = [NSArray arrayWithObjects:@"action",nil];
     */
     
    /* get_vod_listing_by_category
    requestObjects = [NSArray arrayWithObjects:@"get_vod_listing_by_category",@"3",nil];
    requestkeys = [NSArray arrayWithObjects:@"action",@"category",nil];
     */

    /* get_home_screen_items
    
    requestObjects = [NSArray arrayWithObjects:@"get_home_screen_items",nil];
    requestkeys = [NSArray arrayWithObjects:@"action",nil];
*/

    /* login
    requestObjects = [NSArray arrayWithObjects:@"login",@"user",@"user",nil];
    requestkeys = [NSArray arrayWithObjects:@"action",@"username",@"password",nil];
*/
    //user_registration
    requestObjects = [NSArray arrayWithObjects:@"user_registration",@"Chirag11",@"chirag1.purohit@sunshineinfotech.com",@"CHIRAG",@"Chirag",@"Purohit",@"2",nil];
    requestkeys = [NSArray arrayWithObjects:@"action",@"username",@"email",@"password",@"first_name",@"last_name",@"userrole",nil];

    
    requestJSONDict = [NSDictionary dictionaryWithObjects:requestObjects forKeys:requestkeys];
    requestString = [NSString stringWithFormat:@"data=%@",[requestJSONDict JSONRepresentation]];      
    NSLog(@"\n \n \n \n \n \n ");
    requestData = [NSData dataWithBytes: [requestString UTF8String] length: [requestString length]]; 
    urlString = [NSString stringWithFormat:@"%@",WEB_SERVICE_URL];
    
    NSLog(@"\n \n \n \n \n \n  URL = %@",urlString);
    
    
    request = [[[NSMutableURLRequest alloc] init] autorelease];   
	[request setURL:[NSURL URLWithString:urlString]];                  // set URL for the request
	[request setHTTPMethod:@"POST"];                                  // set method the request
	
    [request setHTTPBody:requestData];        
	
	
	returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ]; // send data to the web service
    
  
    
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	NSLog(@"\n returnString == %@",returnString);
	
	json = [[SBJSON new] autorelease];
	
	responseDataArray = [json objectWithString:returnString error:&error];
    [responseDataArray retain];
    NSLog(@"\n responseDataDictionary = %@ ",responseDataArray);
	

    
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
