//
//  MoyaProviderExtension.swift
//  imf88
//
//  Created by Johnny on 2020/8/13.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import Moya
@_exported import enum Moya.MoyaError
@_exported import typealias Moya.Method
@_exported import enum Moya.Task
@_exported import protocol Moya.AccessTokenAuthorizable
@_exported import enum Moya.AuthorizationType
@_exported import protocol Moya.Cancellable

protocol MoyaTargetTypeAdapterProtocol: TargetType {
    associatedtype Request
    associatedtype Success: Decodable
    associatedtype Failure: Decodable & Error
}
enum StatusCode: Int {
    case success = 200
    case unFefined
}

class AppMoyaProvider<T: MoyaTargetTypeAdapterProtocol>: MoyaProvider<T> {
    var target:T!
    typealias DecodedCompletion = (Result<T.Success, MoyaError>) -> Void
    typealias Completion = (Result<(Data), MoyaError>) -> Void
    convenience init(
        session: Moya.Session = makeSession(),
        target: T,
        plugins:[PluginType] = []) {
        self.init(
            session: session,
            plugins:
                [
                    [
                        NetworkLoggerPlugin(
                            configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),
                                                 logOptions: .verbose)),
                        HeaderPlugin(),
                    ],
                    plugins,
                ].flatMap{$0}
        )
        self.target = target
    }
    func mapper(_ result: Result<Response, MoyaError>)
        -> Result<T.Success, MoyaError> {
        return result.tryMap { (response) throws -> T.Success in
            let successDecodeError: Error
            do {
                return try response.map(T.Success.self)
            }
            catch let sucessError {
                successDecodeError = sucessError
            }
            do {
                let err = try response.map(T.Failure.self)
                throw err
            } catch (let failure) {
                if failure is T.Failure {
                    throw failure
                }
                else {
                    print("🐞 api解析失敗 :",response.request?.url  ?? "",
                          successDecodeError)
                    throw MoyaError.objectMapping(successDecodeError
                                              ,response)
                }
            }
        }.mapError { (e) -> MoyaError in
            return ((e as? MoyaError) ?? MoyaError.underlying(e, nil))
        }
    }
    /*
    func decode(_ result: Result<Response, MoyaError>) -> Result<Data, MoyaError> {
        
        return result.tryMap { (response) throws -> Data in
            return response.data
        }.mapError { (e) -> MoyaError in
            return ((e as? MoyaError) ?? MoyaError.underlying(e, nil))
        }
    }*/
    
    @discardableResult
    func request(
        callbackQueue: DispatchQueue? = .none,
        progress: ProgressBlock? = .none,
        completion: @escaping DecodedCompletion) -> Cancellable {
        precondition(target != nil, "target is nil, please provide a target")
        return requestNormal(target, callbackQueue: callbackQueue, progress: progress) {
            result in
            let decoded = self.mapper(result)
            completion(decoded)
        }
    }
    /*
    @discardableResult
    func fetch(
        callbackQueue: DispatchQueue? = .none,
        progress: ProgressBlock? = .none,
        completion: @escaping Completion) -> Cancellable {
        precondition(target != nil, "target is nil, please provide a target")
        return requestNormal(target, callbackQueue: callbackQueue, progress: progress) {
            result in
            
            completion(self.decode(result))
        }
    }*/
}

struct HeaderPlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        let _request = request
        return _request
    }
    func willSend(_ request: RequestType, target: TargetType) { }
    
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        
    }
    
    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
        switch result {
        case .success(_):
                break
        default:
                break
        }
        return result
    }

}
/*
struct TokenPlugin:PluginType {
    private let _AccessTokenPlugin: AccessTokenPlugin
    private unowned var user:User!
    init(user: User)
    {
        self.user = user
        
        _AccessTokenPlugin = AccessTokenPlugin{ [user] s in  user.token ?? ""
        }
    }
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        _AccessTokenPlugin.prepare(request, target: target)
    }
}*/

extension Data {
    func formData(name:String) -> MultipartFormData {
        MultipartFormData(provider: .data(self), name: name, fileName: nil, mimeType: nil)
    }
    func dataToDictionary() ->Dictionary<String, Any>{
        do{
            let json = try JSONSerialization.jsonObject(with: self, options: .mutableContainers)
            let dic = json as! Dictionary<String, Any>
            return dic;
        }catch _ {
            
            return [:];
        }
    }
}

// MARK: - private

/// https://stackoverflow.com/a/58984801/10172299
private func makeSession() -> Moya.Session {
    let configuration = URLSessionConfiguration.default
          configuration.headers = .default
          configuration.timeoutIntervalForRequest = 30 // as seconds, you can set your request timeout
          configuration.timeoutIntervalForResource = 30 // as seconds, you can set your resource timeout
          configuration.requestCachePolicy = .useProtocolCachePolicy
          return Session(configuration: configuration)
}

/// https://github.com/Moya/Moya/blob/master/Examples/_shared/GitHubAPI.swift

private func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}

