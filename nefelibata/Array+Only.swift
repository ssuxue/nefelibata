//
//  Array+Only.swift
//  nefelibata
//
//  Created by hhhhh on 2021/1/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
