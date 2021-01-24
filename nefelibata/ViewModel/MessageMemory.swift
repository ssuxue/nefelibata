//
//  MessageMemory.swift
//  nefelibata
//
//  Created by hhhhh on 2021/1/24.
//

import SwiftUI

class MessageMemory: ObservableObject {
    @Published var messages: [Message]
    
    init() {
        messages = [
            Message(id: 0, name: "温庭筠", message: "记得交报表", avatar: "https://pic2.zhimg.com/80/v2-1b8f2e0754c29abbb0ca6e44235d5325.jpg", offset: 0),
            Message(id: 1, name: "李清照", message: "不知道说啥", avatar: "https://pic4.zhimg.com/80/v2-eb1b6a77df3ebb4d26df1cce8ec6abb5.jpg", offset: 0),
            Message(id: 2, name: "步非烟", message: "快来开黑啊", avatar: "https://pic4.zhimg.com/80/v2-5d97265c9413a325e2478797af8c1891.jpg", offset: 0),
            Message(id: 3, name: "花白凛", message: "我不玩辅助", avatar: "https://pic1.zhimg.com/80/v2-c02b1b501d746b05cbc2d4910ea088fb.jpg", offset: 0),
            Message(id: 4, name: "子非题", message: "白皇后红皇后", avatar: "https://pic4.zhimg.com/80/v2-fddbb8992e01651ff8ed9651541c9527.jpg", offset: 0),
            Message(id: 5, name: "韩立", message: "相貌平平韩天尊", avatar: "https://pic1.zhimg.com/80/v2-378ec387f5b6134f98bd7f4c88632dd6.jpg", offset: 0),
            Message(id: 6, name: "谢道韫", message: "若非柳絮因风起", avatar: "https://pic2.zhimg.com/80/v2-32d06114f1b471fbd2b42da47bc8c265.jpg", offset: 0)
        ]
    }
}

