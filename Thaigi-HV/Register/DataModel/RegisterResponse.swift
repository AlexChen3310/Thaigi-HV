//
//  RegisterResponse.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/29.
//

import Foundation

struct RegisterResponse: Codable {
    let status:String
    let data: [String:String]
}
