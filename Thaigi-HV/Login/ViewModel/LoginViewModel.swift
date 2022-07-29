//
//  LoginViewModel.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/28.
//

import Foundation

class LoginViewModel: ViewModelable {
    func bind() {
        login()
    }
    
    var updateLoadingStatus: ((Bool) -> Void)?
    
    var updateView: (() -> Void)?
}

fileprivate extension LoginViewModel {
    func login() {
        updateLoadingStatus?(true)
        let target = LoginService.Login(request: LoginRequest.Login(account: "testapp01", password: "123456"))
        let provider = AppMoyaProvider(target: target)
        
        provider.request { result in
            self.updateLoadingStatus?(false)
            switch result {
            case .success(let response):
                User.data = response
            case .failure(let error):
                print(error)
            }
            self.updateView?()
        }
    }
}
