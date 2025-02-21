//
//  BarrageStore.swift
//  liveStremSDKIos
//
//  Created by Nguyễn Anh Tuấn on 21/2/25.
//

import Combine
import Foundation



// Store quản lý danh sách tin nhắn
class BarrageStore: ObservableObject {
    @Published var messages: [TUIBarrage] = []

    func sendBarrage(barrage: TUIBarrage) {
        messages.append(barrage)
    }
}
