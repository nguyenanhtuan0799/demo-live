//
//  GiftViewManager.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 21/2/25.
//

import Foundation
import React

@objc(GiftViewManager)
class GiftViewManager: RCTViewManager {

  override func view() -> UIView! {
    let view = GiftView()
    return view
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
