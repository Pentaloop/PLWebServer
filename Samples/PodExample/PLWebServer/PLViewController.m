//
//  PLViewController.m
//  PLWebServer
//
//  Created by Haseeb Yousaf on 06/07/2016.
//  Copyright (c) 2016 Haseeb Yousaf. All rights reserved.
//

#import "PLViewController.h"
#import "PLWebServer.h"
#import "HTTPServer.h"
@interface PLViewController ()

@end

@implementation PLViewController
{
    PLWebServer* server;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    server = [PLWebServer new];
    server.port = 8080;
    [server addHandlerForMethod:@"GET" path:@"/" requestClass:[PLWebServerRequest class] processBlock:^PLWebServerResponse *(__kindof PLWebServerRequest *request) {
        return nil;
    }];
    
    NSError *error = nil;
    if(![server start:&error])
    {
        NSLog(@"Error starting HTTP Server: %@", error);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
