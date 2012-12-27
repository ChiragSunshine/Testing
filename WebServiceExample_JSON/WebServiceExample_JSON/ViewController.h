//
//  ViewController.h
//  WebServiceExample_JSON
//
//  Created by Chirag@Sunshine on 07/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"
@interface ViewController : UIViewController
{
    NSArray *requestObjects;
	NSArray *requestkeys;
	NSDictionary *requestJSONDict;
	NSMutableDictionary *finalJSONDictionary;
	NSString *jsonRequest;
	NSString *requestString;
	NSData *requestData;
	NSString *urlString;
	NSMutableURLRequest *request;
	NSData *returnData;
	NSError *error;
	SBJSON *json;
	//NSDictionary *responseDataDictionary;
    NSMutableArray *responseDataArray;

}

@property(nonatomic,strong)NSMutableArray *responseDataArray;

@end
