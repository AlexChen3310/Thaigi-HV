//
//  RegisterViewModel.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/29.
//

import Foundation
import UIKit

class RegisterViewModel: ViewModelable {
    internal init(_ verifyViewModel: VerifyViewModel) {
        self.verify = verifyViewModel
    }
    let verify: VerifyViewModel
    
    func bind() {
        
    }
    
    var updateLoadingStatus: ((Bool) -> Void)?
    
    var updateView: (() -> Void)?
}


extension RegisterViewModel {
    fileprivate func register() {
        updateLoadingStatus?(true)
        let target = RegisterService.Register(request: RegisterRequest.Register(account: "", password: "", password_confirmation: ""))
        let provider = AppMoyaProvider(target: target)
        
        provider.request { result in
            self.updateLoadingStatus?(false)
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
            self.updateView?()
        }
    }
}
