//
//  RegisterService.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/29.
//

import Foundation
import Alamofire

enum RegisterRequest {
    struct Register {
        var account: String
        var password: String
        var password_confirmation: String
        var verify: String
    }
}

enum RegisterService {
    struct Register: MoyaTargetTypeAdapterProtocol {
        typealias Request = RegisterRequest.Register
        
        typealias Success = RegisterResponse
        
        typealias Failure = ShareFailureJSON_Error
        
        var baseURL: URL {
            return Arguments.url
        }
        
        var path: String {
            return "/api/v1/auth/register"
        }
        
        var method: Method {
            return .post
        }
        
        var sampleData: Data {
            return "".utf8Encoded
        }
        
        var task: Task {
            let parameters = ["account" : request.account,
                              "password" : request.password,
                              "password_confirmation" : request.password_confirmation,
                              "website" : "thgi.vegas.gf-gaming.com"]
            
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
        
        private let request: Request
        
        var headers: [String : String]?
        
        internal init(request: Request){
            self.request = request
        }
    }
}
