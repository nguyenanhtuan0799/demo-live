//
//  LiveStreamModule.m
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 18/2/25.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE (LiveStreamModule, NSObject)

RCT_EXTERN_METHOD(sayHello :
                  (NSString *)name)
RCT_EXTERN_METHOD(loginService:
                  (NSNumber *)appId
                  userId
                  : (NSString *)userId
                  userSig
                  : (NSString *)userSig)
RCT_EXTERN_METHOD(startLive:
                  (NSString *)roomId)
RCT_EXTERN_METHOD(joinLive:
                  (NSString *)roomId)

@end


