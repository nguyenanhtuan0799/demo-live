//
//  MessageView.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 21/2/25.
//

import Foundation

class InputMessageView: UIView {

  private let barrageInputView = BarrageInputView(roomId: "1")

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(barrageInputView)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    // Đảm bảo layout liveCoreView đúng kích thước
    barrageInputView.frame = self.bounds
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.addSubview(barrageInputView)
  }
}
