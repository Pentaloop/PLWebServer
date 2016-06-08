PLWebServer is a small, lightweight, embeddable HTTP server for Mac OS X or iOS applications. PLWebServer is built on top of CocoaHTTPServer which means it has the same features and GCD accelerated performance, but we have gone one step further and added more functionality.  

Sometimes developers need an embedded HTTP server in their app. Perhaps it's a server application with remote monitoring. Or perhaps it's a desktop application using HTTP for the communication backend. Or perhaps it's an iOS app providing over-the-air access to documents. Whatever your reason, CocoaHTTPServer can get the job done. It provides:

-   Built in support for bonjour broadcasting
-   IPv4 and IPv6 support
-   Asynchronous networking using GCD and standard sockets
-   Password protection support
-   SSL/TLS encryption support
-   Extremely FAST and memory efficient
-   Extremely scalable (built entirely upon GCD)
-   Heavily commented code
-   Very easily extensible
-   WebDAV is supported too!


## Usage
```
server = [PLWebServer new];
server.port = 8080;
[server addHandlerForMethod:@"GET" path:@"/" requestClass:[PLWebServerRequest class] processBlock:^PLWebServerResponse *(__kindof PLWebServerRequest *request) {
    return [[PLWebServerStringResponse alloc] initWithString:@"Hi I am here!!!"];
}];

NSError *error = nil;
if(![server start:&error])
{
    NSLog(@"Error starting HTTP Server: %@", error);
}
```

#Roadmap
-   Add a routing mechanism (Done)
-   WebSocket handling improvements (Pending)
-   Improve download performance (Pending) 
-   Allow WebDav and HTTP on same port (Pending)
-   Implement UPNP MediaServer (Pending)
-   Your brilliant ideas... (Pending)


#Credits
- Server is based on CocoaHTTTPServer.
- Routing mechanism is partially based on GCDWebServer.

