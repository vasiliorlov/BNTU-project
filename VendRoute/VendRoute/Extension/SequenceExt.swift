//
//  SequenceExt.swift
//  Arphys
//
//  Created by Vasili Orlov on 05/08/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

extension Sequence {
    func uniqued<T: Equatable>(_ keyPath: KeyPath<Element, T>) -> [Element] {
        self.uniqued { $0[keyPath: keyPath] == $1[keyPath: keyPath] }
    }
    
    func uniqued(comparator: @escaping (Element, Element) throws -> Bool) rethrows -> [Element] {
        var buffer: [Element] = []

        for element in self {
            if try buffer.contains(where: { try comparator(element, $0) }) {
                continue
            }
            buffer.append(element)
        }
        return buffer
    }
}

extension Sequence where Element: Equatable {
    func uniqued() -> [Element] {
        return self.uniqued(comparator: ==)
    }
}

extension Sequence {
    var count: Int { return reduce(0) { acc, row in acc + 1 } }
}
