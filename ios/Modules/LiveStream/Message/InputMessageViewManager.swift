//
//  InputMessageViewManager.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 21/2/25.
//

import Foundation
import React

@objc(InputMessageViewManager)
class InputMessageViewManager: RCTViewManager {

  override func view() -> UIView! {
    let view = InputMessageView()
    return view
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
