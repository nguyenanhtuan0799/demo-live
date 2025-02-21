
//
//  DisplayGiftView.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 21/2/25.
//




import Foundation
import UIKit

class DisplayGiftView: UIView {

  private let giftPlayView = GiftPlayView(roomId: "1")


  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(giftPlayView)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    // Đảm bảo layout liveCoreView đúng kích thước
    giftPlayView.frame = self.bounds
    giftPlayView.layer.cornerRadius = 12
    giftPlayView.clipsToBounds = true
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.addSubview(giftPlayView)
  }
}
