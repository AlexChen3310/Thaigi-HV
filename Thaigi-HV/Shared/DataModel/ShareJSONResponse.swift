//
//  ShareJSONResponse.swift
//  TFChessApp
//
//  Created by Johnny on 2021/12/10.
//

import Foundation

struct ShareJSONResponse: Decodable {
    
    var msg:String
    var status: String
    var errors: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case msg, status, errors
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(String.self, forKey: .status)
        self.msg = try container.decodeIfPresent(String.self, forKey: .msg) ?? ""
        self.errors = try container.decodeIfPresent([String].self, forKey: .errors)
    }
}

struct ShareFailureJSON_Error:Decodable {
    var status:String
    var msg:String?
    var errors:[String]
}

extension ShareFailureJSON_Error: LocalizedError {
    var errorDescription: String? {
        errors.joined(separator: ", ")
    }
}

