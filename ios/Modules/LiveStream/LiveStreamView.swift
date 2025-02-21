//
//  LiveStreamView.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 20/2/25.
//

import Foundation
import LiveKit
import LiveStreamCore
import RTCRoomEngine
import React
import TUICore
import TUILiveKit
import UIKit

class LiveStreamView: UIView {

  private let liveCoreView: LiveCoreView = {
    let view = LiveCoreView()
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    print("LiveCoreView frame: \(liveCoreView.frame)")
    self.addSubview(liveCoreView)
    liveCoreView.setLayoutMode(layoutMode: .gridLayout)

  }

  override func layoutSubviews() {
    super.layoutSubviews()
    // Đảm bảo layout liveCoreView đúng kích thước
    liveCoreView.frame = self.bounds
    print("LiveCoreView frame after layout: \(liveCoreView.frame)")
  }

  @objc func setRoomId(_ roomId: NSString) {
    liveCoreView.joinLiveStream(roomId: roomId as String) { roomInfo in
      print(roomInfo!, "??roomInfo")
    } onError: { err, text in
      print(err, "?? err roomInfo", text)
    }
  }

  @objc func leaveRoom() {
    liveCoreView.leaveLiveStream(onSuccess: {
      print("leave Room Success")
    }) { err, text in
      print(err, "?? err roomInfo", text)
    }
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.addSubview(liveCoreView)
  }
}
