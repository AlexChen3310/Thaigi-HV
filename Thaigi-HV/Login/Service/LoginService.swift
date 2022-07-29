//
//  LoginService.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/28.
//

import Foundation
import Alamofire

enum LoginRequest {
    struct Login {
        let account: String
        let password: String
    }
}

enum LoginService {
    struct Login: MoyaTargetTypeAdapterProtocol {
        typealias Request = LoginRequest.Login
        
        typealias Success = LoginResponse
        
        typealias Failure = ShareFailureJSON_Error
        
        var baseURL: URL {
            return Arguments.url
        }
        
        var path: String {
            return "/api/v1/auth/login"
        }
        
        var method: Method {
            return .post
        }
        
        var sampleData: Data {
            return "".utf8Encoded
        }
        
        var task: Task {
            let parameters = ["account" : request.account,
                              "password" : request.password]
            
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
        
        private let request: Request
        
        var headers: [String : String]?
        
        internal init(request: Request){
            self.request = request
        }
    }
}
