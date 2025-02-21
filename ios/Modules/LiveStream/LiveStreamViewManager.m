//
//  LiveStreamViewManager.m
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 20/2/25.
//
#import <Foundation/Foundation.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(LiveStreamViewManager, RCTViewManager)
RCT_EXPORT_VIEW_PROPERTY(roomId, NSString)
RCT_EXTERN_METHOD(leaveRoom:(nonnull NSNumber *)reactTag)
RCT_EXTERN_METHOD(getInfoRoom:(nonnull NSNumber *)reactTag)

@end
