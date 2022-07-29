//
//  HVMemberShare.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/29.
//

import Foundation

struct User {
    static var type: String = ""
    static var token: String = ""
    
    static var member: LoginMember?
    
    static var data: LoginResponse? {
        didSet {
            type = data!.data.tokenType
            token = data!.data.accessToken
            member = data!.data.member
        }
    }
}
