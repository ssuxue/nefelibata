//
//  Array+Identifiable.swift
//  nefelibata
//
//  Created by hhhhh on 2021/1/21.
//

import Foundation

// Extension like this usually call the file array the thing we're extending plus some sort of
// description of what kind of thing this is and so this is kind of identifiable.
// [Array+Identifiable.swift] Others is also like this.
extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return 0 // TODO: bogus!
    }
}
