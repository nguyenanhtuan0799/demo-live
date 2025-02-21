//
//  MessageViewManger.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 21/2/25.
//

import Foundation
import React

@objc(MessageViewManager)
class MessageViewManager: RCTViewManager {

  override func view() -> UIView! {
    let view = MessageView()
    return view
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
