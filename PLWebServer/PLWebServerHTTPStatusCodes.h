

#import <Foundation/Foundation.h>

/**
 *  Convenience constants for "informational" HTTP status codes.
 */
typedef NS_ENUM(NSInteger, PLWebServerInformationalHTTPStatusCode) {
  kPLWebServerHTTPStatusCode_Continue = 100,
  kPLWebServerHTTPStatusCode_SwitchingProtocols = 101,
  kPLWebServerHTTPStatusCode_Processing = 102
};

/**
 *  Convenience constants for "successful" HTTP status codes.
 */
typedef NS_ENUM(NSInteger, PLWebServerSuccessfulHTTPStatusCode) {
  kPLWebServerHTTPStatusCode_OK = 200,
  kPLWebServerHTTPStatusCode_Created = 201,
  kPLWebServerHTTPStatusCode_Accepted = 202,
  kPLWebServerHTTPStatusCode_NonAuthoritativeInformation = 203,
  kPLWebServerHTTPStatusCode_NoContent = 204,
  kPLWebServerHTTPStatusCode_ResetContent = 205,
  kPLWebServerHTTPStatusCode_PartialContent = 206,
  kPLWebServerHTTPStatusCode_MultiStatus = 207,
  kPLWebServerHTTPStatusCode_AlreadyReported = 208
};

/**
 *  Convenience constants for "redirection" HTTP status codes.
 */
typedef NS_ENUM(NSInteger, PLWebServerRedirectionHTTPStatusCode) {
  kPLWebServerHTTPStatusCode_MultipleChoices = 300,
  kPLWebServerHTTPStatusCode_MovedPermanently = 301,
  kPLWebServerHTTPStatusCode_Found = 302,
  kPLWebServerHTTPStatusCode_SeeOther = 303,
  kPLWebServerHTTPStatusCode_NotModified = 304,
  kPLWebServerHTTPStatusCode_UseProxy = 305,
  kPLWebServerHTTPStatusCode_TemporaryRedirect = 307,
  kPLWebServerHTTPStatusCode_PermanentRedirect = 308
};

/**
 *  Convenience constants for "client error" HTTP status codes.
 */
typedef NS_ENUM(NSInteger, PLWebServerClientErrorHTTPStatusCode) {
  kPLWebServerHTTPStatusCode_BadRequest = 400,
  kPLWebServerHTTPStatusCode_Unauthorized = 401,
  kPLWebServerHTTPStatusCode_PaymentRequired = 402,
  kPLWebServerHTTPStatusCode_Forbidden = 403,
  kPLWebServerHTTPStatusCode_NotFound = 404,
  kPLWebServerHTTPStatusCode_MethodNotAllowed = 405,
  kPLWebServerHTTPStatusCode_NotAcceptable = 406,
  kPLWebServerHTTPStatusCode_ProxyAuthenticationRequired = 407,
  kPLWebServerHTTPStatusCode_RequestTimeout = 408,
  kPLWebServerHTTPStatusCode_Conflict = 409,
  kPLWebServerHTTPStatusCode_Gone = 410,
  kPLWebServerHTTPStatusCode_LengthRequired = 411,
  kPLWebServerHTTPStatusCode_PreconditionFailed = 412,
  kPLWebServerHTTPStatusCode_RequestEntityTooLarge = 413,
  kPLWebServerHTTPStatusCode_RequestURITooLong = 414,
  kPLWebServerHTTPStatusCode_UnsupportedMediaType = 415,
  kPLWebServerHTTPStatusCode_RequestedRangeNotSatisfiable = 416,
  kPLWebServerHTTPStatusCode_ExpectationFailed = 417,
  kPLWebServerHTTPStatusCode_UnprocessableEntity = 422,
  kPLWebServerHTTPStatusCode_Locked = 423,
  kPLWebServerHTTPStatusCode_FailedDependency = 424,
  kPLWebServerHTTPStatusCode_UpgradeRequired = 426,
  kPLWebServerHTTPStatusCode_PreconditionRequired = 428,
  kPLWebServerHTTPStatusCode_TooManyRequests = 429,
  kPLWebServerHTTPStatusCode_RequestHeaderFieldsTooLarge = 431
};

/**
 *  Convenience constants for "server error" HTTP status codes.
 */
typedef NS_ENUM(NSInteger, PLWebServerServerErrorHTTPStatusCode) {
  kPLWebServerHTTPStatusCode_InternalServerError = 500,
  kPLWebServerHTTPStatusCode_NotImplemented = 501,
  kPLWebServerHTTPStatusCode_BadGateway = 502,
  kPLWebServerHTTPStatusCode_ServiceUnavailable = 503,
  kPLWebServerHTTPStatusCode_GatewayTimeout = 504,
  kPLWebServerHTTPStatusCode_HTTPVersionNotSupported = 505,
  kPLWebServerHTTPStatusCode_InsufficientStorage = 507,
  kPLWebServerHTTPStatusCode_LoopDetected = 508,
  kPLWebServerHTTPStatusCode_NotExtended = 510,
  kPLWebServerHTTPStatusCode_NetworkAuthenticationRequired = 511
};
