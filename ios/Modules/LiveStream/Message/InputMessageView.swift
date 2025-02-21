//
//  MessageView.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 21/2/25.
//

import Foundation
import UIKit

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
    barrageInputView.layer.cornerRadius = 12
    barrageInputView.clipsToBounds = true
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.addSubview(barrageInputView)
  }
}
