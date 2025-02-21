//
//  LiveStreamViewManager.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 20/2/25.
//

import Foundation
import React

@objc(LiveStreamViewManager)
class LiveStreamViewManager: RCTViewManager {
  var liveStreamView: LiveStreamView!
  override func view() -> UIView! {

  
    liveStreamView = LiveStreamView()
    return liveStreamView
  }

  @objc func leaveRoom(_ reactTag: NSNumber) {
    liveStreamView.leaveRoom()
  }
  

  @objc override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
