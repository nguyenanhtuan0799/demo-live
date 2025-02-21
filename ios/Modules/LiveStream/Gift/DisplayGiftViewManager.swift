//
//  DisplayGiftViewManager.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 21/2/25.
//

import Foundation
import React

@objc(DisplayGiftViewManager)
class DisplayGiftViewManager: RCTViewManager {

  override func view() -> UIView! {
    let view = DisplayGiftView()
    return view
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
