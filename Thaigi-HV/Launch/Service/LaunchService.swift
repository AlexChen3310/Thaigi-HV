//
//  LaunchService.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/28.
//

import Foundation
import Moya

//let launchProvider = MoyaProvider<LaunchService>(plugins: [
//    NetworkLoggerPlugin(
//        configuration: NetworkLoggerPlugin
//            .Configuration(logOptions: .verbose)),
//        HeaderPlugin()
//])

enum LaunchService {
    struct GetWToken: MoyaTargetTypeAdapterProtocol {
        typealias Request = LaunchRequest
        
        typealias Success = WtokenResponse
        
        typealias Failure = ShareFailureJSON_Error
        
        var baseURL: URL {
            return Arguments.url
        }
        
        var path: String {
            return "/api/v1/website"
        }
        
        var method: Method {
            return .post
        }
        
        var sampleData: Data {
            return "".utf8Encoded
        }
        
        var task: Task {
            return .requestParameters(parameters: ["website" : "thgi.vegas.gf-gaming.com"], encoding: JSONEncoding.default)
        }
        
        var headers: [String : String]? {
            return nil
        }
    }
}
