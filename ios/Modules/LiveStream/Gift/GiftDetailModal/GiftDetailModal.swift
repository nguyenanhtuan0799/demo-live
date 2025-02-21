//
//  GiftDetailModal.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 21/2/25.
//

import UIKit

protocol GiftDetailModalViewDelegate: AnyObject {
  func didTapSendGift(gift: TUIGift)
  func didTapCancel()
}

class GiftDetailModalView: UIView {
  private var giftImageView: UIImageView = UIImageView(
    frame: CGRect(x: 10, y: 10, width: 54, height: 54))
  private var giftNameLabel: UILabel = UILabel()
  private var sendButton: UIButton = UIButton(type: .system)
  private var cancelButton: UIButton = UIButton(type: .system)

  var gift:TUIGift
  weak var delegate: GiftDetailModalViewDelegate?

  init(gift: TUIGift, delegate: GiftDetailModalViewDelegate? = nil) {
    self.gift = gift
    super.init(frame: .zero)
    self.delegate = delegate
    setupUI()
    configure(with: gift)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    backgroundColor = UIColor.black.withAlphaComponent(0.8)
    layer.cornerRadius = 10
    clipsToBounds = true

    giftImageView.contentMode = .scaleAspectFit
    addSubview(giftImageView)
    giftImageView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(16)
      make.centerX.equalToSuperview()
      make.size.equalTo(CGSize(width: 140, height: 140))
    }

    giftNameLabel.textColor = .white
    giftNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
    giftNameLabel.textAlignment = .center
    addSubview(giftNameLabel)
    giftNameLabel.snp.makeConstraints { make in
      make.top.equalTo(giftImageView.snp.bottom).offset(16)
      make.left.right.equalToSuperview().inset(16)
     
    }

    cancelButton.setTitle("Cancel", for: .normal)
    cancelButton.setTitleColor(.white, for: .normal)
    cancelButton.backgroundColor = .gray
    cancelButton.layer.cornerRadius = 8
    cancelButton.addTarget(
      self, action: #selector(didTapCancel), for: .touchUpInside)
    addSubview(cancelButton)
    cancelButton.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(16)
      make.bottom.equalToSuperview().offset(-16)
      make.height.equalTo(40)
      make.width.equalTo(100)
    }

    sendButton.setTitle("Send", for: .normal)
    sendButton.setTitleColor(.white, for: .normal)
    sendButton.backgroundColor = .blue
    sendButton.layer.cornerRadius = 8
    sendButton.addTarget(
      self, action: #selector(didTapSendGift), for: .touchUpInside)
    addSubview(sendButton)
    sendButton.snp.makeConstraints { make in
      make.right.equalToSuperview().offset(-16)
      make.bottom.equalToSuperview().offset(-16)
      make.height.equalTo(40)
      make.width.equalTo(100)
    }
  }

  private func configure(with gift: TUIGift) {
    print(gift, "??gift")
    giftNameLabel.text = gift.giftName
    giftImageView.kf.setImage(with: URL(string: gift.imageUrl))

  }
  private func addDismissGesture() {
    let tapGesture = UITapGestureRecognizer(
      target: self, action: #selector(dismissModal))
    self.addGestureRecognizer(tapGesture)
  }

  @objc private func didTapCancel() {
    delegate?.didTapCancel()
    dismissModal()
  }

  @objc private func didTapSendGift() {
    delegate?.didTapSendGift(gift: gift)
    dismissModal()
  }

  @objc private func dismissModal() {
    UIView.animate(
      withDuration: 0.3,
      animations: {
        self.alpha = 0
      }
    ) { _ in
      self.removeFromSuperview()
    }
  }
}
