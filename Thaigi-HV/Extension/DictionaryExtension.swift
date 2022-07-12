//
//  DictionaryExtension.swift
//  IMF88
//
//  Created by Johnny on 2020/5/28.
//  Copyright © 2020 IMF88. All rights reserved.
//

import Foundation
extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
