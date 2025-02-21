//
//  LiveStreamModule.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 18/2/25.
//

import Foundation
import TUICore
import TUILiveKit
import UIKit
import LiveStreamCore
import React



@objc(LiveStreamModule)
class LiveStreamModule: NSObject {

  @objc
  func sayHello(_ name: NSString) {
    print("Hello, \(name)!")
  }

  @objc
  func loginService(_ appId: NSNumber, userId: NSString, userSig: NSString) {
    print("Hello, \(appId),\(userId), \(userSig)")
        TUILogin
          .login(
            Int32(appId),  // Replace it with the SDKAppID obtained in Step 1
            userID: userId as String,  // Replace with your UserID
            userSig: userSig as String // Calculate a UserSig in the console and enter it here
          ) {
            print("login success")
          } fail: { (code, message) in
            print("login failed, code: \(code), error: \(message ?? "nil")")
          }
  }
  
  @MainActor @objc
  func startLive(_ roomId:NSString){
    DispatchQueue.main.async{
      VideoLiveKit.createInstance().startLive(roomId: roomId as String)
    }
  }
  
  @MainActor @objc
  func joinLive(_ roomId:NSString){
    DispatchQueue.main.async{
      VideoLiveKit.createInstance().joinLive(roomId: roomId as String)
      
    }
  }
  

  


  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
