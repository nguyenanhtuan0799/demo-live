//
//  MessageView.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 21/2/25.
//

import Foundation
import UIKit

class MessageView: UIView {

  private let barrageDisplayView = BarrageStreamView(roomId: "1")

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(barrageDisplayView)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    // Đảm bảo layout liveCoreView đúng kích thước
    barrageDisplayView.frame = self.bounds
    barrageDisplayView.layer.cornerRadius = 12
    barrageDisplayView.clipsToBounds = true
    
  }
  
  @objc func setUserId(_ userId: NSString) {
    print(userId,"??userId")
    DispatchQueue.main.async {
      self.barrageDisplayView.setOwnerId("yuki")
    }
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.addSubview(barrageDisplayView)
  }
}
