//
//  GiftView.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 21/2/25.
//

import Foundation
import UIKit

class GiftView: UIView {

  private lazy var giftListView = GiftListView(
    roomId: "1",
    delegate: self
  )



  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(giftListView)
    giftListView.snp.makeConstraints { make in
        make.edges.equalToSuperview()  // Hiển thị toàn màn hình
    }
    giftListView.setGiftList(TUIGiftStore.shared.giftList)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    // Đảm bảo layout liveCoreView đúng kích thước
    giftListView.frame = self.bounds
    giftListView.layer.cornerRadius = 12
    giftListView.clipsToBounds = true
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.addSubview(giftListView)
  }
}

extension GiftView: GiftListViewDelegate {
  func onSendGift(gift model: TUIGift, giftCount: Int) {
    let receiver = TUIGiftUser()

        giftListView
          .sendGift(
            model: model,
            giftCount: giftCount,
            receiver: receiver
    
          ) { success, message in
            if success {
              print("Gift sent successfully: \(message)")
            } else {
              print("Failed to send gift: \(message)")
            }
          }
  }

  func giftDidSendSuccessfully() {
    print("Delegate: Gift was sent successfully.")
  }

  func giftSendFailed(with error: Error) {
    print("Delegate: Failed to send gift with error: \(error)")
  }
}
