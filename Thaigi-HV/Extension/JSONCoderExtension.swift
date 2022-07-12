//
//  JSONCoderExtension.swift
//  IMF88
//
//  Created by Johnny on 2020/7/3.
//  Copyright © 2020 IMF88. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    static let global:JSONDecoder = {
            JSONDecoder()
    }()
    open func decodeFromDictionary<T>(_ dic: [String:Any], to: T.Type)  throws -> T where T : Decodable{
        
        let data = try? JSONSerialization.data(withJSONObject: dic, options: [])
        return try JSONDecoder.global.decode(T.self, from: data ?? Data())
    }
}


extension JSONEncoder {
    static let global:JSONEncoder = {
        JSONEncoder()
    }()
}

func decodeTwoType<S,F>(
    s:S.Type, f: F.Type, data: Data
) throws -> S
    where S: Decodable, F: Decodable, F: Error
{
    let _s = try? JSONDecoder.global.decode(s, from: data)
    if let r = _s {return r}
    let _f = try JSONDecoder.global.decode(f, from: data)
    throw _f
}
