//
//  Message.swift
//  nefelibata
//
//  Created by hhhhh on 2021/1/24.
//

import SwiftUI

struct Message: Identifiable, Codable {
    var id: Int
    var name: String
    var message: String
    var avatar: String
    var offset: CGFloat
}
