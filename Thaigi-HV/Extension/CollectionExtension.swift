//
//  CollectionExtension.swift
//  Starlordtech
//
//  Created by ye hengjia on 2019/5/15.
//  Copyright © 2019 starlordtech. All rights reserved.
//

import UIKit

public extension Collection where Indices.Iterator.Element == Index {
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public extension Array {
    
    subscript (exist index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

public extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}
