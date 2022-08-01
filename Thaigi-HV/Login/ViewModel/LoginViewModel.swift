//
//  LoginViewModel.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/28.
//

import Foundation

class LoginViewModel: ViewModelable {
    func bind() {
        changeButtonStatus?(false)
    }
    
    var updateLoadingStatus: ((Bool) -> Void)?
    
    var updateView: (() -> Void)?
    
    var changeButtonStatus: ((Bool) -> Void)?
    
    var isAccountOK: Bool = false
    var isPasswordOK: Bool = false
    
    var request = LoginRequest.Login(account: "", password: "") {
        didSet {
            checkInput()
        }
    }
}

extension LoginViewModel {
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
    
    func checkInput() {
        isAccountOK = request.account.checkAccount()
        isPasswordOK = request.password.checkPassword()
        
        var isSend: Bool = false
        
        if isAccountOK && isPasswordOK {
            isSend = true
        }
        
        changeButtonStatus?(isSend)
    }
}
